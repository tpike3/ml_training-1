% Transmission rate, R0 = n/p, where n = new cases, and p = prior cases.  
% To simulate each day, n = R0 * p;

% date of first case in NYC
d1 = datetime('02/10/0020');

% today
d2 = datetime('04/28/0020'); 

% calculate the number of days 
day_str = between(d1,d2,'Days');
day_num = split(day_str,'days');

% Number of cases in NYC today
cases_NYC = 291996;

% infection rate
ir = 1.176;

% initial infected
i_0 = ones(day_num,1);

% simulate
for ii=2:day_num
    i_0(ii,1) = ir * i_0(ii-1,1);
end

% plot results
figure(1)
plot([1:1:day_num],i_0,'b.-')
% semilogy([1:1:day_num],i_0)
xlabel('Time (days)','Interpreter','latex');
ylabel('Number of infections','Interpreter','latex');
title(sprintf('R0 model: Transmission Rates (a=%1.2f)',ir),'Interpreter','latex');



% SIR model
% 
%   S'=-a*S*I
%   I'=a*S*I-b*I
%   R'=b*I
% 
%   dS = -a*x(1)*x(2);
%   dI = a*x(1)*x(2)-b*x(2);
%   dR = b*x(2);

a = ir; % Transmission Rate
b = 0.23; % Recovery Rate

I0 = 0.01;  % inital infected
S0 = 0.99;  % initial susceptible
R0 = 0;     % initial recovered

% varied transmission rate
tSpan = (0:0.1:50)';
f = @(t,x) [-a*x(1)*x(2); a*x(1)*x(2)-b*x(2); b*x(2)]; % [S';I';R']
[t,y]=ode45(f,tSpan, [S0 I0 R0]);


figure(2)
plot(t(:,1),y(:,1),'b.-',t(:,1),y(:,2),'r.-',t(:,1),y(:,3),'g.-')
title(sprintf('SIR model: Transmission Rates (a=%1.2f), Recovery Rate (b=%1.2f)',a,b),'Interpreter','latex');
xlabel('Time (days)','Interpreter','latex');
ylabel('Solution (ds/dt + di/dt + dr/dt)','Interpreter','latex');
legend('susceptible','infected','recovered')

% save_all_figs_OPTION('R0_model','png')
