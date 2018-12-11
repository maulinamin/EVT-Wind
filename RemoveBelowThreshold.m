% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : RemoveBelowThreshold.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : Removes data below the given threshold value. 
% *                     We receive the threshold as input and the output is
% *                     the data below the threshold.  
% * Note              : This program does not remove the data above a particular
%                       threshold. Refer to a different program for that
%                       function.
% * Input 1           : Threshold Value (u)
% * Input 2           : Data from which the data below threshold needs to
%                       be deleted (data)
% * Output            : Modified data with no values below the threshold.
% *                     (WindData)
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function WindData = ExtractCSV(u,data)
A = data;
A = table2timetable(A);
toDelete = A.SpdOfMaxGust_km_h_ < u;
A(toDelete,:) = [];
A = timetable2table(A);
WindData = A;
end
