%{
FileName:PGR_alpha.m

Codes for computing a FO IM called peak ground fractional response,
which is a generalization of PGA, PGV, and PGD. 

Reference:
Shafieezadeh A, Ramanathan K, Padgett JE, DesRoches R (2012) Fractional
order intensity measures for probabilistic seismic demand modeling applied
to highway bridges. Earthq Eng Struct Dyn 41:391–409.
https://doi.org/10.1002/eqe.1135

Wang X, Ye A, Shafieezadeh A, Padgett JE (2019) Fractional order optimal
intensity measures for probabilistic seismic demand modeling of extended
pile-shaft-supported bridges in liquefiable and laterally spreading ground.
Soil Dyn Earthq Eng 120:301–315.
https://doi.org/10.1016/j.soildyn.2019.02.012
%}

clear all
warning('off','all');

%% load acc. and define key parameters [User Input]
acc=load('Acc(g).acc');               % example acc. vector [g]
dt=0.01;                              % time step of the example acc. vector [s]
alpha=-1.3;                           % fractional order value, [-4,1] in Wang et al. (2019)
                                      % alpha = 0 leads to PGA [m/s^2]
                                      % alpha = -1 leads to PGV [m/s]
                                      % alpha = -2 leads to PGD [m]

w_L=1e-3; w_H=1e3;                    % frequency of practical interest
N=6;                                  % 2N+1 recursive z-p pairs

u = acc;                              % unit: g
t = [0:dt:dt*(length(u)-1)]';         % Ground motion time
T_end = t(end);                       % end time for simulation

Hsf1=ora_foc(alpha,N,w_L,w_H);
[n,d]=tfdata(Hsf1);
sim('FracPGR',[0 T_end]);             % load Simulink architecture
PGR_alpha0=max(abs(fracResp));
disp(['PGR_alpha = ',num2str(PGR_alpha0),'[m/s^',num2str(2+alpha),'] for alpha = ',num2str(alpha)]);
