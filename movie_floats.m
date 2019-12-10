clear
close all
clc
tic()


acc_settings
load Topo12
load SOCCOM_floats
load float_colors

num_floats = length(floats);
%        1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 
% cind = [61,14,34,55,61,66,24,71,83,24,61,38,74,81,55,12,90,37,89,77,...
%     69,65,36,27,39,84,70,12,78,34,61,69,59, 3,66];
%   21 22 23 24 25 26 27 28 29 30 31 32 33 34 35

colors = [84:90,80,79,75,74,70,68,51:63,39,43,38,30,12,11,...
    16,17,3,1,5,22,83,81,78,76,73,71,31,44,6,5,19,84:90,80,79,...
    75,74,70,68,51:63,39,83,81,78,76,73];

cind = color_array(97,:);
floats_color = Color(colors(cind),:);
fsz = 74;
numdate = datenum('20150812','yyyymmdd');
enddate = datenum('20191120','yyyymmdd');
num_days = enddate - numdate;

for ii = 1:size(SOCCOM_floats,1)
    doubledate = SOCCOM_floats(ii,2);
    strngdate = string(doubledate);
    SOCCOM_floats(ii,2) = datenum(strngdate,'yyyymmdd');    
end

%% 50m contour levels
z = -6000:50:5000;
coords = [250 350 -75 -22.5];


cm = acc_colormap('cmo_topo');
cm = cm(1:237,:);
figure()
set(gcf, 'Position', [1, 1, 1600, 1000])
colormap(cm)
contourf(XC12,YC12,Topo12,'LineStyle','none','LevelList',z)
hold on
% for ii=1:num_floats
%     spfloat = floats(ii);
%     float_temp = SOCCOM_floats(SOCCOM_floats(:,1)==spfloat,:);
%     points = [float_temp(:,4)';float_temp(:,3)'];
%     points = fnplt(cscvn(points));
%     plot(points(1,:),points(2,:),'LineWidth',2.7,'Color',floats_color(ii,:))
% end
for ii=1:num_floats
    spfloat = floats(ii);
    float_temp = SOCCOM_floats(SOCCOM_floats(:,1)==spfloat,:);
    float_temp = float_temp(float_temp(:,2)<numdate,:);
    float_temp = float_temp(float_temp(:,2)>(numdate-90),:);
    scatter(float_temp(:,4),float_temp(:,3),fsz,'MarkerEdgeColor',[1 1 1],...
        'MarkerFaceColor',floats_color(ii,:),...
        'LineWidth',0.8)
end
ytickformat('degrees')
xtickformat('degrees')
title(['SOCCOM float profiles around Drake Passage in 90 days prior to ',...
    datestr(numdate,'yyyy mmm dd')],'FontWeight','Normal','FontSize',18)
axis(coords)
acc_movie
acc_plots
hold off

set(gca, 'nextplot','replacechildren', 'Visible','on');
vidObj = VideoWriter('SOCCOM_DRAKE.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 24;
open(vidObj);
writeVideo(vidObj, getframe(gcf));

for jj=3:2:num_days
    numdate = numdate + 2;
    fprintf('iteration # %g \n',jj)
    contourf(XC12,YC12,Topo12,'LineStyle','none','LevelList',z)
    hold on
    %     for ii=1:num_floats
    %         spfloat = floats(ii);
    %         float_temp = SOCCOM_floats(SOCCOM_floats(:,1)==spfloat,:);
    %         float_temp = float_temp(float_temp(:,2)<numdate,:);
    %         points = [float_temp(:,4)';float_temp(:,3)'];
    %         points = fnplt(cscvn(points));
    %         plot(points(1,:),points(2,:),'LineWidth',2.7,'Color',floats_color(ii,:))
    %     end
    for ii=1:num_floats
        spfloat = floats(ii);
        float_temp = SOCCOM_floats(SOCCOM_floats(:,1)==spfloat,:);
        float_temp = float_temp(float_temp(:,2)<numdate,:);
        float_temp = float_temp(float_temp(:,2)>(numdate-90),:);
        scatter(float_temp(:,4),float_temp(:,3),fsz,'MarkerEdgeColor',[0 0 0],...
            'MarkerFaceColor',floats_color(ii,:),...
            'LineWidth',0.8)
    end
    ytickformat('degrees')
    xtickformat('degrees')
    title(['SOCCOM float profiles around Drake Passage in 90 days prior to ',...
        datestr(numdate-1,'yyyy mmm dd')],'FontWeight','Normal','FontSize',18)
    axis(coords)
    acc_movie
    hold off
    
    drawnow()
    writeVideo(vidObj, getframe(gcf));
end
close(vidObj);

%%

toc()