% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : ShiftIATData.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : december 17, 2018
% *
% * Purpose           : Shifts wind inter-arrival time data according to
%                       the chosen value of t.
%                        
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function WindData = ShiftIATData(t2, data)
A = data;
%Shift the Inter-arrival data
for k = 1:numel(A.Time_Interval)
    A.Time_Interval(k) = A.Time_Interval(k) - t2;
end
WindData = A;
end