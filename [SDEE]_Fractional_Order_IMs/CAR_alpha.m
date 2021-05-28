%{
FileName:CAR_alpha.m

Codes for computing a FO IM called cumulative absolute fractional response,
which is a generalization of the traditional cumulative absolute velocity (CAV)

Reference:
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
alpha=-0.7;                           % fractional order value, [-4,1] in Wang et al. (2019)
                                      % alpha=0 leads to CAV;
                                      % alpha=-1 leads to CAD;
                                      
w_L=1e-3; w_H=1e3;                    % frequency of practical interest
N=6;                                  % 2N+1 recursive z-p pairs

u = acc;                              % unit: g
t = [0:dt:dt*(length(u)-1)]';         % Ground motion time
T_end = t(end);                       % end time for simulation

Hsf1=ora_foc(alpha,N,w_L,w_H);
[n,d]=tfdata(Hsf1);
sim('FracPGR',[0 T_end]);             % load Simulink architecture
dt_out=(dt*(length(u)-1))/(length(fracResp)-1);
t_out=[0:dt_out:dt*(length(u)-1)]';
fracResp_new=spline(t_out,fracResp,t);
CAR_alpha0=sum(dt.*(abs(fracResp_new)));
disp(['CAR_alpha = ',num2str(CAR_alpha0),'[m/s^',num2str(1+alpha),'] for alpha = ',num2str(alpha)]);
