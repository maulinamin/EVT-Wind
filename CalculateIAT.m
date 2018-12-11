% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : CalculateIAT.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : Calculates the Inter Arrival Time of the already
%                       modified data. This modified data consists of
%                       values only above the chosen threshold.
%                       downloaded from Environment Canada. This program
%                       also removes the values from the same shock event.
%                       A shock event usually lasts about 7 days. 
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function WindData = CalculateIAT(data)

%Calculate the time interval between the data
A = data;
for k = 2:numel(A.Date_Time)
A.Time_Interval(k) = daysact(A.Date_Time(k-1), A.Date_Time(k));
end
toDelete = A.Time_Interval < 7;
A(toDelete,:) = [];
WindData = A;