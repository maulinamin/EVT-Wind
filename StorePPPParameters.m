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
% *
% |**********************************************************************;
function Y = StorePPPParameters(i,isInterArrival,Data)
A = Data;

if isInterArrival == 0
    switch i
        case 1
            WS = A;
        case 2
            WS = A;
        case 3
            WS = A;
        case 4
            WS = A;
        case 5
            WS = A;
        case 6
            WS = A;
        case 7
            WS = A;
        case 8
            WS = A;
    end
    Y = WS;
else
    switch i
        case 1
            IAT = A;
        case 2
            IAT = A;
        case 3
            IAT = A;
        case 4
            IAT = A;
        case 5
            IAT = A;
        case 6
            IAT{6} = A;
        case 7
           IAT{7} = A;
        case 8
           IAT{8} = A;
    end 
    Y = IAT;
end

end

