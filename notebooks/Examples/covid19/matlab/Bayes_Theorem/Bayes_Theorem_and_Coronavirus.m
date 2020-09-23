% Bayes Theorem and Coronavirus: The Chance You Have It & The Chance You Die

clear all; close all; clc;

% This is for tests
sen = 0.99;
spe = 0.99;
B = [0.01:.01:.1]';
p_chan = (sen .* B) ./ (sen .*B + (1-spe) .* (1-B));
test = [B,round(p_chan,3)];

fprintf(1,'Test Sensitivity = %1.2f, Test Specificity = %1.2f\n',sen,spe);
fprintf(1,'inc   B     Pr(CY|+TB)\n')
for i=1:length(B)
    fprintf(1,'[%2.0f]  %1.2f   %1.2f\n',i,test(i,1),test(i,2));
end
fprintf(1,'\n');

% This is for dead.
dead_sen = 0.99;
DB = [0.02:.02:.2]';
B = 0.147;
sen = 0.99;
spe = 0.99;
d_chan =   dead_sen .* (DB.*B + 0.*(1-B)  )   ./ (sen.*B +  (1-spe) .*(1-B));
death = [DB,round(d_chan,3)];

fprintf(1,'Test Sensitivity = %1.2f, Test Specificity = %1.2f\n',sen,spe);
fprintf(1,'Death Sensitivity = %1.2f, Initial Base rate = %1.2f\n',dead_sen,B);
fprintf(1,'inc   DB     Pr(D|+TB)\n')
for i=1:length(DB)
    fprintf(1,'[%2.0f]  %1.2f   %1.2f\n',i,death(i,1),death(i,2));
end

