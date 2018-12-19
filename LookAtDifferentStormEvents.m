% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : LookAtDifferentStormEvents.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : December 17, 2018
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
function WindData = LookAtDifferentStormEvents(t1, data)
A = data;
toDelete = A.Time_Interval < t1;
A(toDelete,:) = [];
WindData = A;
end