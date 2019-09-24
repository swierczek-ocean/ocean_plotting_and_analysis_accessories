clear
close all
clc
tic()

load OOI_CTDs/GA_OOI_CTD_500mB_dep3.mat
load OOI_CTDs_processed/Proc_GA_OOI_CTD_500mB_dep3

figure()
plot(GA_OOI_CTD_500mB_dep3(:,1),GA_OOI_CTD_500mB_dep3(:,4))
hold on
plot(Proc_GA_OOI_CTD_500mB_dep3(:,1),Proc_GA_OOI_CTD_500mB_dep3(:,4))
hold off




toc()