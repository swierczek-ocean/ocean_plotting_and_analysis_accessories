clear
close all
clc
tic()

%% get the hours
strdate = '20161201:00:00';
numdate_start = datenum(strdate,'yyyymmdd:HH:MM');
enddate = '20171231:10:00';
numdate_end = datenum(enddate,'yyyymmdd:HH:MM');
time = numdate_start:(1/24):numdate_end;
time = time';
%%

load OOI_CTDs/GA_OOI_CTD_30mA_dep3.mat
[Proc_GA_OOI_CTD_30mA_dep3,str_key] = process_OOI(GA_OOI_CTD_30mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_30mA_dep3 Proc_GA_OOI_CTD_30mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_40mA_dep3.mat
[Proc_GA_OOI_CTD_40mA_dep3,str_key] = process_OOI(GA_OOI_CTD_40mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_40mA_dep3 Proc_GA_OOI_CTD_40mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_60mA_dep3.mat
[Proc_GA_OOI_CTD_60mA_dep3,str_key] = process_OOI(GA_OOI_CTD_60mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_60mA_dep3 Proc_GA_OOI_CTD_60mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_90mA_dep3.mat
[Proc_GA_OOI_CTD_90mA_dep3,str_key] = process_OOI(GA_OOI_CTD_90mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_90mA_dep3 Proc_GA_OOI_CTD_90mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_130mA_dep3.mat
[Proc_GA_OOI_CTD_130mA_dep3,str_key] = process_OOI(GA_OOI_CTD_130mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_130mA_dep3 Proc_GA_OOI_CTD_130mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_180mA_dep3.mat
[Proc_GA_OOI_CTD_180mA_dep3,str_key] = process_OOI(GA_OOI_CTD_180mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_180mA_dep3 Proc_GA_OOI_CTD_180mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_250mA_dep3.mat
[Proc_GA_OOI_CTD_250mA_dep3,str_key] = process_OOI(GA_OOI_CTD_250mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_250mA_dep3 Proc_GA_OOI_CTD_250mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_350mA_dep3.mat
[Proc_GA_OOI_CTD_350mA_dep3,str_key] = process_OOI(GA_OOI_CTD_350mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_350mA_dep3 Proc_GA_OOI_CTD_350mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_500mA_dep3.mat
[Proc_GA_OOI_CTD_500mA_dep3,str_key] = process_OOI(GA_OOI_CTD_500mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_500mA_dep3 Proc_GA_OOI_CTD_500mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_750mA_dep3.mat
[Proc_GA_OOI_CTD_750mA_dep3,str_key] = process_OOI(GA_OOI_CTD_750mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_750mA_dep3 Proc_GA_OOI_CTD_750mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_1000mA_dep3.mat
[Proc_GA_OOI_CTD_1000mA_dep3,str_key] = process_OOI(GA_OOI_CTD_1000mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_1000mA_dep3 Proc_GA_OOI_CTD_1000mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_1500mA_dep3.mat
[Proc_GA_OOI_CTD_1500mA_dep3,str_key] = process_OOI(GA_OOI_CTD_1500mA_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_1500mA_dep3 Proc_GA_OOI_CTD_1500mA_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_30mB_dep3.mat
[Proc_GA_OOI_CTD_30mB_dep3,str_key] = process_OOI(GA_OOI_CTD_30mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_30mB_dep3 Proc_GA_OOI_CTD_30mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_40mB_dep3.mat
[Proc_GA_OOI_CTD_40mB_dep3,str_key] = process_OOI(GA_OOI_CTD_40mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_40mB_dep3 Proc_GA_OOI_CTD_40mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_60mB_dep3.mat
[Proc_GA_OOI_CTD_60mB_dep3,str_key] = process_OOI(GA_OOI_CTD_60mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_60mB_dep3 Proc_GA_OOI_CTD_60mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_90mB_dep3.mat
[Proc_GA_OOI_CTD_90mB_dep3,str_key] = process_OOI(GA_OOI_CTD_90mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_90mB_dep3 Proc_GA_OOI_CTD_90mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_130mB_dep3.mat
[Proc_GA_OOI_CTD_130mB_dep3,str_key] = process_OOI(GA_OOI_CTD_130mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_130mB_dep3 Proc_GA_OOI_CTD_130mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_180mB_dep3.mat
[Proc_GA_OOI_CTD_180mB_dep3,str_key] = process_OOI(GA_OOI_CTD_180mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_180mB_dep3 Proc_GA_OOI_CTD_180mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_250mB_dep3.mat
[Proc_GA_OOI_CTD_250mB_dep3,str_key] = process_OOI(GA_OOI_CTD_250mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_250mB_dep3 Proc_GA_OOI_CTD_250mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_350mB_dep3.mat
[Proc_GA_OOI_CTD_350mB_dep3,str_key] = process_OOI(GA_OOI_CTD_350mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_350mB_dep3 Proc_GA_OOI_CTD_350mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_500mB_dep3.mat
[Proc_GA_OOI_CTD_500mB_dep3,str_key] = process_OOI(GA_OOI_CTD_500mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_500mB_dep3 Proc_GA_OOI_CTD_500mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_750mB_dep3.mat
[Proc_GA_OOI_CTD_750mB_dep3,str_key] = process_OOI(GA_OOI_CTD_750mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_750mB_dep3 Proc_GA_OOI_CTD_750mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_1000mB_dep3.mat
[Proc_GA_OOI_CTD_1000mB_dep3,str_key] = process_OOI(GA_OOI_CTD_1000mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_1000mB_dep3 Proc_GA_OOI_CTD_1000mB_dep3 str_key

load OOI_CTDs/GA_OOI_CTD_1500mB_dep3.mat
[Proc_GA_OOI_CTD_1500mB_dep3,str_key] = process_OOI(GA_OOI_CTD_1500mB_dep3,time);
save OOI_CTDs_processed/Proc_GA_OOI_CTD_1500mB_dep3 Proc_GA_OOI_CTD_1500mB_dep3 str_key







%% ridiculous attempt to be clever
% cd OOI_CTDs
% 
% stn1 = '../OOI_CTDs_processed/';
% stn2 = 'Proc_';
% 
% fileList = dir('*.mat');
% % newfileList = fileList;
% for ii = 1:numel(fileList)
%     Varnames{ii} = matlab.lang.makeValidName(strcat(stn2,fileList(ii).name));
% end
% 
% for ii=1:numel(fileList)
%     strfile = fileList(ii).name;
%     load(strfile)
%     [Varnames{ii},str_key] = process_OOI(strfile,time);
%     save([stn1,Varnames{ii}],Varnames{ii});
% end
% 
% cd ..
%% 



toc()