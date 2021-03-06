%{
FileName:SI_d_alpha.m

Codes for computing a FO IM called spectrum intensity of fractionally
damped single-degree-of-freedom system, which is a generalization of the
traditional Housner intensity (HI).

Reference:
Wang X, Ye A, Shafieezadeh A, Padgett JE (2019) Fractional order optimal
intensity measures for probabilistic seismic demand modeling of extended
pile-shaft-supported bridges in liquefiable and laterally spreading ground.
Soil Dyn Earthq Eng 120:301�315.
https://doi.org/10.1016/j.soildyn.2019.02.012
%}

clear all
warning('off','all');

%% load acc. and define key parameters [User Input]
acc=load('Acc(g).acc');               % example acc. vector [g]
dt=0.01;                              % time step of the example acc. vector [s]
alpha=-2;                             % fractional order value, [-2,0] in Wang et al. (2019)
                                      % alpha=-1 leads to HI;
zeta = 0.05;                          % damping ratio

w_L=1e-3; w_H=1e3;                    % frequency of practical interest
N=6;                                  % 2N+1 recursive z-p pairs

u = acc;                              % unit: g
t = [0:dt:dt*(length(u)-1)]';         % Ground motion time
T_end = t(end);                       % end time for simulation

Hsf1=ora_foc(alpha,N,w_L,w_H);
[n,d]=tfdata(Hsf1);
ihsum=0;
dT=0.02;                              % period step for integral
tu=1;
for k = 0.1:dT:2.5
    Tn=k;
    wn = 2*pi/Tn;
    sim('FracDamp_SDoF',[0 T_end]);   % fractionally damped SDoF
    PSv = wn*max(abs(dispresp));      % fractional pseudo velocity
    ihsum(tu) = PSv*dT;
    tu=tu+1;
end
SI_d_alpha0 = sum(ihsum);
disp(['SI_d_alpha = ',num2str(SI_d_alpha0),'[m] for alpha = ',num2str(alpha)]);
