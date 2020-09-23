DJIA = readtable('HistoricalPrices_DJIA_2000_2020.csv');
SnP500 = readtable('HistoricalPrices_SnP500_2000_2020.csv');
NASDAQ = readtable('HistoricalPrices_NASDAQ_2000_2020.csv');

figure(1)
plot(DJIA.Date,DJIA.Close,...
    NASDAQ.Date,NASDAQ.Close,...
    SnP500.Date,SnP500.Close,...
    'LineWidth',2)
datetick('x', 'mm-dd-yy', 'keepticks')
legend('DJIA','NASDAQ','S&P 500')
xtickangle(45)
title('Recovery of stock prices after national event.')
xlim([datetime('03/20/0000') datetime('05/01/0020')])

d1 = datetime('09/10/0001');
d2 = datetime('11/09/0001');
between(d1,d2,'Days')
vline(d1,'r','9/11 Attack')
vline(d2,'g')
text(datetime('11/09/0001'),0.5e4,'Recovery = 61 days');

d1 = datetime('10/08/0008');
d2 = datetime('03/24/0010');
between(d1,d2,'Days')
vline(d1,'r','2008 Crash')
vline(d2,'g')
text(datetime('03/24/0010'),0.5e4,'Recovery = 532 days');

save_all_figs_OPTION('stock_recovery','png')
