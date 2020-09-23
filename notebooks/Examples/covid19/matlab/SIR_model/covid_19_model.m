% function covid_19_model

clc;
close all;

% SIR Model
% https://www.maa.org/press/periodicals/loci/joma/the-sir-model-for-spread-of-disease-the-differential-equation-model
% 
% McCluskey, C. Connell. "Complete global stability for an SIR epidemic model with delay—distributed or discrete." Nonlinear Analysis: Real World Applications 11.1 (2010): 55-59.
% Takeuchi, Yasuhiro, Wanbiao Ma, and Edoardo Beretta. "Global asymptotic properties of a delay SIR epidemic model with finite incubation times." Nonlinear Analysis: Theory, Methods & Applications 42.6 (2000): 931-947.
% Beretta, Edoardo, and Yasuhiro Takeuchi. "Global stability of an SIR epidemic model with time delays." Journal of mathematical biology 33.3 (1995): 250-260.
% 
% Transmission Rate:
%   a = 3.2
% 
% Recovery Rate:
%   b = 0.23
% 
% The Susceptible Equation:
%   ds/dt = -a s(t) i(t)
% or
%   S'=-a*S*I
% 
% The Recovered Equation: 
%   dr/dt = b i(t)
% or
%   R'=b*I
% 
% The Infected Equation: 
% we know that 
%   ds/dt + di/dt + dr/dt = 0
% therefore: 
%   di/dt = a s(t) i(t) - b i(t)
% or
%   I'=a*S*I-b*I
% 
% To solve this in Matlab, let:
%   x(1)=S, x(2)=I, x(3)=R
% then 
%   x'=f(t,x) 
% where 
%   x=(x(1),x(2),x(3))'

a_ii = [0.5 1.5 3.2]; 
b_jj = [0.23 0.5 0.8];

I0 = 0.01;  % inital infected
S0 = 0.99;  % initial susceptible
R0 = 0;     % initial recovered
tSpan = (0:0.1:50)';
% figInc = 0;

t_ii = zeros(length(tSpan),1);
y_ii = zeros(length(tSpan),3,3);

% varied transmission rate
for ii = 1:3
    for jj = 1
        a = a_ii(ii);
        b = b_jj(jj);
        f = @(t,x) [-a*x(1)*x(2); a*x(1)*x(2)-b*x(2); b*x(2)];
        [t,y]=ode45(f,tSpan, [S0 I0 R0]);

        t_ii(:,ii) = t;
        y_ii(:,:,ii) = y;
    end
end

figure(1)
plot(t_ii(:,1),y_ii(:,1,1),'b.-',t_ii(:,1),y_ii(:,2,1),'r.-',t_ii(:,1),y_ii(:,3,1),'g.-',...
    t_ii(:,1),y_ii(:,1,2),'bd-',t_ii(:,1),y_ii(:,2,2),'rd-',t_ii(:,1),y_ii(:,3,2),'gd-',...
    t_ii(:,1),y_ii(:,1,3),'bo-',t_ii(:,1),y_ii(:,2,3),'ro-',t_ii(:,1),y_ii(:,3,3),'go-')
title('SIR model: various Transmission Rates (a=\{0.5,1.5,3.2\}), fixed Recovery Rate (b=0.23)','Interpreter','latex');
xlabel('Time (t)','Interpreter','latex');
ylabel('Solution (ds/dt + di/dt + dr/dt)','Interpreter','latex');
legend('susceptible:  a=0.5','infected:       a=0.5','recovered:    a=0.5',...
    'susceptible:  a=1.5','infected:       a=1.5','recovered:    a=1.5',...
    'susceptible:  a=3.2','infected:       a=3.2','recovered:    a=3.2')

% varied recovery rate
for ii = 3
    for jj = 1:3
        a = a_ii(ii);
        b = b_jj(jj);
        f = @(t,x) [-a*x(1)*x(2); a*x(1)*x(2)-b*x(2); b*x(2)];
        [t,y]=ode45(f,tSpan, [S0 I0 R0]);

        t_ii(:,ii) = t;
        y_ii(:,:,ii) = y;
    end
end

figure(2)
plot(t_ii(:,1),y_ii(:,1,1),'b.-',t_ii(:,1),y_ii(:,2,1),'r.-',t_ii(:,1),y_ii(:,3,1),'g.-',...
    t_ii(:,1),y_ii(:,1,2),'bd-',t_ii(:,1),y_ii(:,2,2),'rd-',t_ii(:,1),y_ii(:,3,2),'gd-',...
    t_ii(:,1),y_ii(:,1,3),'bo-',t_ii(:,1),y_ii(:,2,3),'ro-',t_ii(:,1),y_ii(:,3,3),'go-')
title('SIR model: fixed Transmission Rate (a=3.2), various Recovery Rates (b=\{0.23,0.5,0.8\})','Interpreter','latex');
xlabel('Time (t)','Interpreter','latex');
ylabel('Solution (ds/dt + di/dt + dr/dt)','Interpreter','latex');
legend('susceptible: b=0.23','infected:       b=0.23','recovered:   b=0.23',...
    'susceptible: b=0.5','infected:       b=0.5','recovered:   b=0.5',...
    'susceptible: b=0.8','infected:       b=0.8','recovered:   b=0.8')

dock_all_figures;

save_all_figs_OPTION('covid-19_model','png')
