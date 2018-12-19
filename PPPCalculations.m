% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : ShiftData.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 17, 2018
% *
% * Purpose           : Performs the PPP
%                       
% * Note              : 
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * 2018/12/17      M Amin      1      Re-write from a previously written
%                                      program.
% *
% |**********************************************************************;
function A = PPPCalculations(isInterArrival,Data)
A = Data;
z = numel(A.Date_Time);
if isInterArrival == 0

    for k = 1:z
        A.Ln_KMPH(k) = log(A.KMPH(k));
    end
%     toDelete = A.Ln_KMPH == 0;
%     A(toDelete,:) = [];
    z = numel(A.Ln_KMPH);
else
    for k = 1:z
        A.Ln_TI(k) = log(A.TI(k));
    end
%     toDelete = A.Ln_TI == 0;
%     A(toDelete,:) = [];
    z = numel(A.Ln_TI);
end

for k = 1:z
    A.Rank(k) = k;
end

for k = 1:z
    A.Pi(k) = k/(z+1);
end

for k = 1:z
    A.InvPi(k) = norminv(A.Pi(k));
end

for k = 1:z
    A.ExpPi(k) = -log(1-A.Pi(k));
end
for k = 1:z
    A.WeibPi(k) = log(-log(1-A.Pi(k)));
end
for k = 1:z
    A.GumbPi(k) = -log(-log(A.Pi(k)));
end

end
