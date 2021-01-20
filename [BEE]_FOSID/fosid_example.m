%{
FileName:fosid_example.m
Codes for computing a novel fractional order seismic intensity measure
called FOSID in Wang et al. (2021)

Reference:
Wang X., Shafieezadeh A., and Padgett J.E. (2021) FOSID:Fractional Order
Spectrum intensity enhanced with Integral period and Damping ratio for
probabilistic seismic demand modeling of extended pile-shaft-supported
highway bridges under liquefaction and transverse spreading. Bulletin of
Earthquake Engineering (In Review, Manuscript Number: BEEE-D-20-00397R1)

Acknowledgement:
Special thanks to Prof. YangQuan Chen for developing the ora_foc.m file.
%}

%% load acc. and define key parameters [User Input]
acc=load('Acc(g).acc');               % example acc. vector [g] for Fig.1 in Wang et al.(2021)
dt=0.02;                              % time step of the example acc. vector [s]

Tf=2.5;                               % example upper bond of the period [s] for integral, Eq.(12) in Wang et al.(2021)
Damp=0.05;                            % example damping coefficient
alpha=-2;                             % example fractional order value

%% define Simulink parameters
warning('off','all');
w_L=1e-3; w_H=1e3;                    % frequency of practical interest
N=6;                                  % 2N+1 recursive z-p pairs
zeta=Damp;                            % Damping ratio coefficient used in Simulink
u = acc;                              % Ground motion acceleration used in Simulink
t = [0:dt:dt*(length(u)-1)]';         % Ground motion time series
T_end = t(end);                       % end time

Hsf1=ora_foc(alpha,N,w_L,w_H);        % Oustaloup-Recursive-Approximation for fractional order differentiator
[n,d]=tfdata(Hsf1);                   % used for Simulink

Period_start=0.1;                     % lower bond period of the integral
Period_end=Tf;                        % upper bond periodof the integral
deltaPeriod=0.1;                      % period step for the integral [User can change it for computational efficiency]

ihsum=0;
tu=1;
for k = Period_start:deltaPeriod:Period_end
    Tn=k;
    wn = 2*pi/Tn;
    sim('SAFracSDoF_AccResponse',[0 T_end]);
    Sv_r_alpha=wn^(-alpha-1)*max(abs(accresp));  % Sv,r_alpha, Eq.(10) in Wang et al. (2021)
    if Period_end == Period_start                
        ihsum(tu)= 0;
    else
        ihsum(tu) = Sv_r_alpha*deltaPeriod;      % FOSID, Eq.(12) in Wang et al. (2021)
    end
    tu=tu+1;
end
fosid = sum(ihsum);
disp(['--- FOSID = ',num2str(fosid),' (m) for T_f = ',num2str(Tf),...
    '(s), damping =',num2str(Damp),' and alpha = ',num2str(alpha)]);
