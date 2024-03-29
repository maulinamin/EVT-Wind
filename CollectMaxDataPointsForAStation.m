% |**********************************************************************;
% * Project           : Examinations of Assumptions of 
% *                     Environmental Load Models
% *
% * Program name      : CollectMaxDataPointsForAStation.m
% *
% * Author            : Maulin Amin
% *
% * Date created      : November 22, 2018
% *
% * Purpose           : Function to collect just maximum data points for
%                       each year.
%                       
% * Note              : 
% *
% * Revision History  :
% *
% * Date            Author      Ref    Revision (Date in YYYYMMDD format) 
% * YYYY/MM/DD      M Amin      1      Description of Revision
% *
% |**********************************************************************;
function MaxPoints = CollectMaxDataPointsForAStation(folder)
i=1; %Set i=1 so that it does not give error for data{0} which is impossible
%use the Datastore function to read all the CSV files in the folder
ds = tabularTextDatastore(folder,'FileExtensions','.csv','SelectedVariableNames',{'Date_Time','SpdOfMaxGust_km_h_'});
%a while loop divides the Datastore variable data into years
while hasdata(ds)
    data{i} = read(ds);
    i=i+1;
end
%Make a second set of data. Here we just replace <31 with 30.5 in the data
u = numel(data);
for k = 1:u
    data2{k,1} = data{1,k}; %extract data cell by cell
    t = cell2table(data{1,k}.SpdOfMaxGust_km_h_); %extract just the data column for modifications
    y = table2array(t); %prepare to make modifications
    y = strrep(y,'<31','30.5'); %make modifications
    data2{k,1}.SpdOfMaxGust_km_h_ = y; %overwrite the modified data into its old column
end
%Extract maximum data points for each of the years
u = numel(data);
for k = 1:u
    A = (data2{k,1});
    temp_A_Date_Time = datetime(A.Date_Time,'InputFormat','yyyy-MM-dd'); %Array that converts 'string date' to datetime format
    A.Date_Time = temp_A_Date_Time;
    Wind_Gust = cell2table(data2{k,1}.SpdOfMaxGust_km_h_);
    Wind_Gust = table2array(Wind_Gust);
    Wind_Gust = str2double(Wind_Gust);
    %if loop makes sure that the NaN years are ignored.
    if isnan(Wind_Gust)
        u = u-1;
        continue
    end
    A.SpdOfMaxGust_km_h_ = (Wind_Gust);
    A = table2timetable(A);
    idx = ~any(ismissing(A),2);
    A = A(idx,:);
    B = sortrows(A,1,'descend');
    B = timetable2table(B);
    MaxPoints(k,:) = B(1,:);
end
u = numel(data);
TEMP = MaxPoints;
MaxPoints = rmmissing(TEMP);
end

