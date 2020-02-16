clear
close all
clc

tic()

% get_profiles('32')
% get_profiles('34')
% get_profiles('62')
% get_profiles('64')
% get_profiles('122')
% get_profiles('124')
warning('off','all')

% get_profiles_figures_bsose

get_profiles_figures('32')
get_profiles_figures('62')
get_profiles_figures('122')
%get_profiles_figures('34')
%get_profiles_figures('64')
%get_profiles_figures('124')
% get_profiles_figures_2('32')
% get_profiles_figures_2('62')
% get_profiles_figures_2('122')

toc()
