% Start of script
close all;                   	% close all figures
clearvars; clearvars -global;	% clear all variables
clc;                         	% clear the command terminal
format shortG;                 	% picks most compact numeric display
format compact;                	% suppress excess blank lines


%% import "cases"
% Import the data
timeseriescovid19confirmedUS = readtable("..\..\data\novel-corona-virus-2019-dataset\time_series_covid_19_confirmed_US.csv");

CA_idx = ismember(timeseriescovid19confirmedUS{:, 7}, 'California');
TX_idx = ismember(timeseriescovid19confirmedUS{:, 7}, 'Texas');

col_idx = 12;
num_cols = size(timeseriescovid19confirmedUS,2)-col_idx;
t1 = datetime(2020,1,23,8,0,0);
t2 = datetime(2020,9,13,8,0,0);
t = t1:t2;

daily_total = zeros(num_cols,2);
for ii = 1:num_cols
    daily_total(ii,1) = sum(str2double(timeseriescovid19confirmedUS{CA_idx==1,ii+col_idx}));
    daily_total(ii,2) = sum(str2double(timeseriescovid19confirmedUS{TX_idx==1,ii+col_idx}));
end

daily_diff = zeros(num_cols,2);
for ii = 13:num_cols
    daily_diff(ii,1) = daily_total(ii,1) - daily_total(ii-1,1);
    daily_diff(ii,2) = daily_total(ii,2) - daily_total(ii-1,2);
end

num_weeks = floor((num_cols-col_idx)/7)+1;
weekly_diff = zeros(num_weeks,2);
weekly_date = t(1:num_weeks)';
idx = 1;
for ii = 1:num_weeks
    weekly_date(ii,1) = t(idx+7);
    weekly_diff(ii,1) = sum(daily_diff(idx:idx+6,1));
    weekly_diff(ii,2) = sum(daily_diff(idx:idx+6,2));
    idx = idx+7;
end

figure
plot(t,daily_total(:,1),...
    t,daily_total(:,2),'LineWidth',2)
datetick('x', 'dd/mmm/yyyy', 'keepticks','keeplimits')
legend('California','Texas','Location','NW')
xlabel('Time (days)','Interpreter','latex');
ylabel('Cumulative number of cases','Interpreter','latex');
title('Cumulative number of cases vs time','Interpreter','latex');
% jan 21: first covid case in US
vline(t(1),0.65,'b','First COVID-19 case in US')
% jan 31: US blocks travel from china
vline(t(7),0.7,'g','US blocks travel from China')
% march 11: US borders closed
vline(t(47),0.75,'r','US borders closed')
% march 13: national emergency declared
vline(t(49),0.8,'m','National emergency declared')
% march 17: workforce asked to stay home
vline(t(53),0.85,'b','Workforce asked to stay home')
% april 1: lock-down
vline(t(68),0.9,'g','Lock-down')
% may 1: texas re-opens
vline(t(98),0.95,'r','Texas re-opens')


figure
plot(t,daily_diff(:,1),...
    t,daily_diff(:,2),'LineWidth',2)
datetick('x', 'dd/mmm/yyyy', 'keepticks','keeplimits')
legend('California','Texas','Location','NW')
xlabel('Time (days)','Interpreter','latex');
ylabel('Daily number of new cases','Interpreter','latex');
title('Daily number of new cases vs time','Interpreter','latex');
% jan 21: first covid case in US
vline(t(1),0.65,'b','First COVID-19 case in US')
% jan 31: US blocks travel from china
vline(t(7),0.7,'g','US blocks travel from China')
% march 11: US borders closed
vline(t(47),0.75,'r','US borders closed')
% march 13: national emergency declared
vline(t(49),0.8,'m','National emergency declared')
% march 17: workforce asked to stay home
vline(t(53),0.85,'b','Workforce asked to stay home')
% april 1: lock-down
vline(t(68),0.9,'g','Lock-down')
% may 1: texas re-opens
vline(t(98),0.95,'r','Texas re-opens')

figure
plot(weekly_date,weekly_diff(:,1),...
    weekly_date,weekly_diff(:,2),'LineWidth',2)
datetick('x', 'dd/mmm/yyyy', 'keepticks','keeplimits')
legend('California','Texas','Location','NW')
xlabel('Time (days)','Interpreter','latex');
ylabel('Weekly number of new cases','Interpreter','latex');
title('Weekly number of new cases vs time','Interpreter','latex');


%% import deaths
% Import the data
timeseriescovid19deathsUS = readtable("..\..\data\novel-corona-virus-2019-dataset\time_series_covid_19_deaths_US.csv");

CA_idx = ismember(timeseriescovid19deathsUS{:, 7}, 'California');
TX_idx = ismember(timeseriescovid19deathsUS{:, 7}, 'Texas');

col_idx = 13;
num_cols = size(timeseriescovid19deathsUS,2)-col_idx;
t1 = datetime(2020,1,23,8,0,0);
t2 = datetime(2020,9,13,8,0,0);
t = t1:t2;

daily_total = zeros(num_cols,2);
for ii = 1:num_cols
    daily_total(ii,1) = sum(str2double(timeseriescovid19deathsUS{CA_idx==1,ii+col_idx}));
    daily_total(ii,2) = sum(str2double(timeseriescovid19deathsUS{TX_idx==1,ii+col_idx}));
end

daily_diff = zeros(num_cols,2);
for ii = 13:num_cols
    daily_diff(ii,1) = daily_total(ii,1) - daily_total(ii-1,1);
    daily_diff(ii,2) = daily_total(ii,2) - daily_total(ii-1,2);
end

num_weeks = floor((num_cols-col_idx)/7)+1;
weekly_diff = zeros(num_weeks,2);
weekly_date = t(1:num_weeks)';
idx = 1;
for ii = 1:num_weeks
    weekly_date(ii,1) = t(idx+7);
    weekly_diff(ii,1) = sum(daily_diff(idx:idx+6,1));
    weekly_diff(ii,2) = sum(daily_diff(idx:idx+6,2));
    idx = idx+7;
end

figure
plot(t,daily_total(:,1),...
    t,daily_total(:,2),'LineWidth',2)
datetick('x', 'dd/mmm/yyyy', 'keepticks','keeplimits')
legend('California','Texas','Location','NW')
xlabel('Time (days)','Interpreter','latex');
ylabel('Cumulative number of deaths','Interpreter','latex');
title('Cumulative number of deaths vs time','Interpreter','latex');
% jan 21: first covid case in US
vline(t(1),0.65,'b','First COVID-19 case in US')
% jan 31: US blocks travel from china
vline(t(7),0.7,'g','US blocks travel from China')
% march 11: US borders closed
vline(t(47),0.75,'r','US borders closed')
% march 13: national emergency declared
vline(t(49),0.8,'m','National emergency declared')
% march 17: workforce asked to stay home
vline(t(53),0.85,'b','Workforce asked to stay home')
% april 1: lock-down
vline(t(68),0.9,'g','Lock-down')
% may 1: texas re-opens
vline(t(98),0.95,'r','Texas re-opens')

figure
plot(t,daily_diff(:,1),...
    t,daily_diff(:,2),'LineWidth',2)
datetick('x', 'dd/mmm/yyyy', 'keepticks','keeplimits')
legend('California','Texas','Location','NW')
xlabel('Time (days)','Interpreter','latex');
ylabel('Daily number of new deaths','Interpreter','latex');
title('Daily number of new deaths vs time','Interpreter','latex');
y=get(gca,'ylim');
ylim([0 y(2)])
% jan 21: first covid case in US
vline(t(1),0.65,'b','First COVID-19 case in US')
% jan 31: US blocks travel from china
vline(t(7),0.7,'g','US blocks travel from China')
% march 11: US borders closed
vline(t(47),0.75,'r','US borders closed')
% march 13: national emergency declared
vline(t(49),0.8,'m','National emergency declared')
% march 17: workforce asked to stay home
vline(t(53),0.85,'b','Workforce asked to stay home')
% april 1: lock-down
vline(t(68),0.9,'g','Lock-down')
% may 1: texas re-opens
vline(t(98),0.95,'r','Texas re-opens')

figure
plot(weekly_date,weekly_diff(:,1),...
    weekly_date,weekly_diff(:,2),'LineWidth',2)
datetick('x', 'dd/mmm/yyyy', 'keepticks','keeplimits')
legend('California','Texas','Location','NW')
xlabel('Time (days)','Interpreter','latex');
ylabel('Weekly number of new deaths','Interpreter','latex');
title('Weekly number of new deaths vs time','Interpreter','latex');

dock_all_figures
save_all_figs_OPTION('timeseries','png')

