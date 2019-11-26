clear
close all
clc
tic()

color_array = zeros(100,53);

for kk=1:100
    acc_settings
    load Topo12
    load SOCCOM_floats
    
    num_floats = length(floats);
    colors = [84:90,80,79,75,74,70,68,51:63,39,43,38,30,12,11,...
        16,17,3,1,5,22,83,81,78,76,73,71,31,44,6,5,19,84:90,80,79,...
        75,74,70,68,51:63,39,83,81,78,76,73];
    cind = randperm(length(colors),num_floats);
    color_array(kk,:) = cind;
    floats_color = Color(colors(cind),:);
    fsz = 65;
    
    %% 50m contour levels
    z = -6000:50:5000;
    coords = [250 350 -75 -22.5];
    
    
    cm = acc_colormap('cmo_topo');
    cm = cm(1:237,:);
    figure()
    set(gcf, 'Position', [1, 1, 1600, 900])
    colormap(cm)
    contourf(XC12,YC12,Topo12,'LineStyle','none','LevelList',z)
    hold on
    for ii=1:num_floats
        spfloat = floats(ii);
        float_temp = SOCCOM_floats(SOCCOM_floats(:,1)==spfloat,:);
        points = [float_temp(:,4)';float_temp(:,3)'];
        points = fnplt(cscvn(points));
        plot(points(1,:),points(2,:),'LineWidth',2.1,'Color',floats_color(ii,:))
    end
    for ii=1:num_floats
        spfloat = floats(ii);
        float_temp = SOCCOM_floats(SOCCOM_floats(:,1)==spfloat,:);
        scatter(float_temp(:,4),float_temp(:,3),fsz,'MarkerEdgeColor',[1 1 1],...
            'MarkerFaceColor',floats_color(ii,:),...
            'LineWidth',0.8)
    end
    cbar = colorbar('eastoutside');
    ytickformat('degrees')
    xtickformat('degrees')
    title('SOCCOM float profiles near the Drake Passage, 2014 - 2019','FontWeight','Normal','FontSize',18)
    axis(coords)
    acc_movie
    acc_plots
    hold off
    print('-r200',['FLOATSrand/AB_BATHY_50_floats_traj_',num2str(kk)],'-dpng')
    close all
    %%
    
   
end

save float_colors color_array

toc()