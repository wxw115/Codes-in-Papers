%{
FileName:Sa_r_Tn_alpha.m

Codes for computing a FO IM called spectral acceleration of traditionally
damped single-degree-of-freedom system with fractional response,
which is a generalization of the traditional spectral acceleration.

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
alpha=-3.4;                           % fractional order value, [-4,1] in Wang et al. (2019)
                                      % alpha=-2 leads to Sa(Tn);
Tn = 2.0;                             % period of interest
wn = 2*pi/Tn;                         % circular frequency
zeta = 0.05;                          % damping ratio

w_L=1e-3; w_H=1e3;                    % frequency of practical interest
N=6;                                  % 2N+1 recursive z-p pairs

u = acc;                              % unit: g
t = [0:dt:dt*(length(u)-1)]';         % Ground motion time
T_end = t(end);                       % end time for simulation

Hsf1=ora_foc(alpha,N,w_L,w_H);
[n,d]=tfdata(Hsf1);
sim('FracResp_SDoF',[0 T_end]);       % traditionally damped SDoF with fractional response
Sa_r_alpha0=wn^(-alpha)*max(abs(accresp));
disp(['Sa_r_Tn_alpha = ',num2str(Sa_r_alpha0),'[m/s^2] for alpha = ',num2str(alpha),', Tn = ',num2str(Tn),'[s]']);
