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
function [A,Y] = PlotWeibullPPP(i,isInterArrival,Data)
A = Data;

if isInterArrival == 0
    
    %PLOT THE WEIBULL PPP for Wind Speed Data
    p = polyfit(A.WeibPi,A.Ln_KMPH,1);
    f = polyval(p,A.WeibPi);
    plot(A.WeibPi,A.Ln_KMPH,'.',A.WeibPi,f,'-')
    grid on;
    legend('data','linear fit')
    dim = [0.2 0.5 0.3 0.3];
    mdl = fitlm(A.WeibPi,A.Ln_KMPH);
    ylabel('Ln(Xi-70)'); xlabel('Ln(-Ln(1-Pi))');
    X = sprintf('Weibull');
    legend('data','linear fit','Location','southeast')
    title(X);
    set(gca,'FontName','Times');
    set(gcf,'Units','inches') % Set figure size units of "current figure"
    set(gcf,'Color','white');
    set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
    switch i
        case 1
            print -deps2c 3-4-1-c.eps % Save as PDF
            movefile('3-4-1-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 2
            print -deps2c 3-4-2-c.eps % Save as PDF
            movefile('3-4-2-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 3
            print -deps2c 3-4-3-c.eps % Save as PDF
            movefile('3-4-3-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 4
            print -deps2c 3-4-4-c.eps % Save as PDF
            movefile('3-4-4-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 5
            print -deps2c 3-4-5-c.eps % Save as PDF
            movefile('3-4-5-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 6
            print -deps2c 3-4-6-c.eps % Save as PDF
            movefile('3-4-6-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 7
            print -deps2c 3-4-7-c.eps % Save as PDF
            movefile('3-4-7-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 8
            print -deps2c 3-4-8-c.eps % Save as PDF
            movefile('3-4-8-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
    end
    %Calculation of the value of statistics
    alpha = 1/p(1);
    beta = exp( p(2) );
    R_Sq = mdl.Rsquared.Ordinary;
    mean = beta *( gamma( 1+(1/alpha) ) );
    var = (beta^2)*( gamma(1+(2/alpha)) - (gamma(1+(1/alpha)))^2 );
    sd = sqrt(var);
    cov = sd/mean;
    Y = sprintf('Weibull PPP: %f X + %f; R-squared = %f; alpha = %f, beta = %f, Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,alpha,beta,mean,var,cov);
    
else
    
    %PLOT THE WEIBULL PPP for Inter-Arrival Time Data
    p = polyfit(A.WeibPi,A.Ln_TI,1);
    f = polyval(p,A.WeibPi);
    plot(A.WeibPi,A.Ln_TI,'.',A.WeibPi,f,'-')
    grid on;
    legend('data','linear fit')
    dim = [0.2 0.5 0.3 0.3];
    mdl = fitlm(A.WeibPi,A.Ln_TI);
    ylabel('Ln(Xi-7)'); xlabel('Ln(-Ln(1-Pi))');
    X = sprintf('Weibull');
    legend('data','linear fit','Location','southeast')
    title(X);
    set(gca,'FontName','Times');
    set(gcf,'Units','inches') % Set figure size units of "current figure"
    set(gcf,'Color','white');
    set(gcf,'Position',[0,0,3,2.5]) % Set figure width (6 in.) and height (4 in.)
    switch i
        case 1
            print -deps2c 3-5-1-c.eps % Save as PDF
            movefile('3-5-1-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 2
            print -deps2c 3-5-2-c.eps % Save as PDF
            movefile('3-5-2-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 3
            print -deps2c 3-5-3-c.eps % Save as PDF
            movefile('3-5-3-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 4
            print -deps2c 3-5-4-c.eps % Save as PDF
            movefile('3-5-4-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 5
            print -deps2c 3-5-5-c.eps % Save as PDF
            movefile('3-5-5-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 6
            print -deps2c 3-5-6-c.eps % Save as PDF
            movefile('3-5-6-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 7
            print -deps2c 3-5-7-c.eps % Save as PDF
            movefile('3-5-7-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
        case 8
            print -deps2c 3-5-8-c.eps % Save as PDF
            movefile('3-5-8-c.eps','C:\Users\Maulin Amin\OneDrive - University of Waterloo\Waterloo\Winter 2018\Environment Canada\Thesis\Latex\plots');
    end
    %Calculation of the value of statistics
    alpha = 1/p(1);
    beta = exp( p(2) );
    R_Sq = mdl.Rsquared.Ordinary;
    mean = beta *( gamma( 1+(1/alpha) ) );
    var = (beta^2)*( gamma(1+(2/alpha)) - (gamma(1+(1/alpha)))^2 );
    sd = sqrt(var);
    cov = sd/mean;
    Y = sprintf('Weibull PPP: %f X + %f; R-squared = %f; alpha = %f, beta = %f, Mean = %f; Variance = %f, Covariance = %f',p(1),p(2),R_Sq,alpha,beta,mean,var,cov);
    
end

end

