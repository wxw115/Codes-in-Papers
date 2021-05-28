%{
FileName:CAR_5_alpha.m

Codes for computing a FO IM called modified cumulative absolute fractional
response, which is a generalization of the traditional modified cumulative
absolute velocity (CAV_5)

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
alpha=0;                              % fractional order value, [-4,1] in Wang et al. (2019)
                                      % alpha=0 leads to CAV_5
                                      
w_L=1e-3; w_H=1e3;                    % frequency of practical interest
N=6;                                  % 2N+1 recursive z-p pairs

u0 = acc.*9.81;                       % transfer to m/s^2
acc5 = zeros(length(u0),1);
for m=1:length(u0)
    if abs(u0(m,1)) < 0.05            % threshold: 5 cm/s^2
        acc5(m,1) = 0;
    else
        acc5(m,1) = abs(u0(m,1));
    end
end
u = acc5./9.81;                       % unit: g
t = [0:dt:dt*(length(u)-1)]';         % Ground motion time
T_end = t(end);                       % end time for simulation

Hsf1=ora_foc(alpha,N,w_L,w_H);
[n,d]=tfdata(Hsf1);
sim('FracPGR',[0 T_end]);             % load Simulink architecture
dt_out=(dt*(length(u)-1))/(length(fracResp)-1);
t_out=[0:dt_out:dt*(length(u)-1)]';
fracResp_new=spline(t_out,fracResp,t);
CAR5_alpha=sum(dt.*(abs(fracResp_new)));
disp(['CAR_5_alpha = ',num2str(CAR5_alpha),'[m/s^',num2str(1+alpha),'] for alpha = ',num2str(alpha)]);
