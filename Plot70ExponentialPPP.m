% |**********************************************************************;
% * Project           : Examinations of Assumptions of
% *                     Environmental Load Models
% *
% * Program name      : PlotExponentialPPP.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 18, 2018
% *
% * Purpose           : Plots exponential PPP
%
% * Note              :
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format)
% * 2018/12/18      M Amin      1      Re-write from a previously written
%                                      program.
%   2019/01/02      M Amin      2      Rename plot files to be saved.
% *
% |**********************************************************************;
function [A,Y] = PlotExponentialPPP(i,isInterArrival,Data)
A = Data;

if isInterArrival == 0
    
    %PLOT THE EXPONENTIAL PPP for Wind Speed Data
    p = polyfitB(A.ExpPi,A.KMPH,1,0);
    f = polyval(p,A.ExpPi);
    plot(A.ExpPi,A.KMPH,'.',A.ExpPi,f,'-')
    grid on;
    legend('data','linear fit')
    dim = [0.2 0.5 0.3 0.3];
    mdl = fitlm(A.ExpPi,A.KMPH);
    ylabel('Data(Xi-70)'); xlabel('-Ln(1-Pi)');
    X = sprintf('Exponential');
    legend('data','linear fit','Location','southeast')
    title(X);
    set(gca,'FontName','Times');
    set(gcf,'Units','inches') % Set figure size units of "current figure"
    set(gcf,'Color','white');
    set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
    switch i
        case 1
            print -deps2c 3-4-1-b.eps % Save as PDF
            movefile('3-4-1-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 2
            print -deps2c 3-4-2-b.eps % Save as PDF
            movefile('3-4-2-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 3
            print -deps2c 3-4-3-b.eps % Save as PDF
            movefile('3-4-3-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 4
            print -deps2c 3-4-4-b.eps % Save as PDF
            movefile('3-4-4-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 5
            print -deps2c 3-4-5-b.eps % Save as PDF
            movefile('3-4-5-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 6
            print -deps2c 3-4-6-b.eps % Save as PDF
            movefile('3-4-6-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 7
            print -deps2c 3-4-7-b.eps % Save as PDF
            movefile('3-4-7-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 8
            print -deps2c 3-4-8-b.eps % Save as PDF
            movefile('3-4-8-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
    end
    %Calculation of the value of statistics
    lambda = 1/p(1);
    R_Sq = mdl.Rsquared.Ordinary;
    mean = 1/lambda;
    var = 1/(lambda^2);
    sd = sqrt(var);
    cov = sd/mean;
    Y = sprintf('Exponential PPP: %f X + %f; R-squared = %f; lambda = %f; Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,lambda,mean,var,cov);
    
else
    
    %PLOT THE EXPONENTIAL PPP for Inter-Arrival Time Data
    p = polyfitB(A.ExpPi,A.TI,1,0);
    f = polyval(p,A.ExpPi);
    plot(A.ExpPi,A.TI,'.',A.ExpPi,f,'-')
    grid on;
    legend('data','linear fit')
    dim = [0.2 0.5 0.3 0.3];
    mdl = fitlm(A.ExpPi,A.TI);
    ylabel('Data(Xi-7)'); xlabel('-Ln(1-Pi)');
    X = sprintf('Exponential');
    legend('data','linear fit','Location','southeast')
    title(X);
    set(gca,'FontName','Times');
    set(gcf,'Units','inches') % Set figure size units of "current figure"
    set(gcf,'Color','white');
    set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
    switch i
        case 1
            print -deps2c 3-5-1-b.eps % Save as PDF
            movefile('3-5-1-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 2
            print -deps2c 3-5-2-b.eps % Save as PDF
            movefile('3-5-2-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 3
            print -deps2c 3-5-3-b.eps % Save as PDF
            movefile('3-5-3-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 4
            print -deps2c 3-5-4-b.eps % Save as PDF
            movefile('3-5-4-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 5
            print -deps2c 3-5-5-b.eps % Save as PDF
            movefile('3-5-5-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 6
            print -deps2c 3-5-6-b.eps % Save as PDF
            movefile('3-5-6-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 7
            print -deps2c 3-5-7-b.eps % Save as PDF
            movefile('3-5-7-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 8
            print -deps2c 3-5-8-b.eps % Save as PDF
            movefile('3-5-8-b.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
    end
    %Calculation of the value of statistics
    lambda = 1/p(1);
    R_Sq = mdl.Rsquared.Ordinary;
    mean = 1/lambda;
    var = 1/(lambda^2);
    sd = sqrt(var);
    cov = sd/mean;
    Y = sprintf('Exponential PPP: %f X + %f; R-squared = %f; lambda = %f; Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,lambda,mean,var,cov);
      
end

end

