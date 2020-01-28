clear
close all
clc
tic()

acc_settings

%%
load mask
load XY3 XC3 YC3
load XY6  XC6 YC6
load XY12 XC12 YC12
load hpc/WVEL_BUDGETS
%%

%%
lw = 2.2;
nn = 200;
x11 = linspace(306,345.15,nn);
x12 = linspace(293,345.15,nn);
y1 = -55.*ones(1,nn);
y2 = -34.*ones(1,nn);
x3 = 345.*ones(1,nn);
x21 = linspace(306,345.1,nn);
x22 = linspace(293,345.1,nn);
y3 = linspace(-55,-34,nn);
y4 = linspace(-55.15,-33.85,nn);
x4 = 290.*ones(1,nn);
option = 13;
mask = permute(mask,[2,1,3]);
inside_coords = [290.5 350.2 -58.7 -32];
[XC3,YC3] = ndgrid(XC3,YC3);
[XC6,YC6] = ndgrid(XC6,YC6);
[XC12,YC12] = ndgrid(XC12,YC12);
clear *field* *MASK* mm nn ii jj hix hiy lox loy *Fac* str
dates = [datenum('20170115','yyyymmdd'),datenum('20170215','yyyymmdd'),...
    datenum('20170315','yyyymmdd'),datenum('20170415','yyyymmdd'),...
    datenum('20170515','yyyymmdd'),datenum('20170615','yyyymmdd'),...
    datenum('20170715','yyyymmdd'),datenum('20170815','yyyymmdd'),...
    datenum('20170915','yyyymmdd'),datenum('20171015','yyyymmdd'),...
    datenum('20171115','yyyymmdd'),datenum('20171215','yyyymmdd'),...
    ];
depths = [60,100,190,250];
mask_ind = [9,13,20,23];
%%

%%
load hpc/WVEL_BUDGETS


% for kk=1:2
%     for ii=1:12
%         for jj=1:4
%             cm = acc_colormap('cmo_balance');
%             [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(vert_wvel_3(:,:,jj,ii),...
%                 vert_wvel_3(:,:,jj,ii),vert_wvel_6(:,:,jj,ii),vert_wvel_12(:,:,jj,ii),option);
%             
%             z = linspace(lb,ub,nlvls);
%             z = [z(1)-100,z,z(end)+100];
%             
%             figure()
%             set(gcf, 'Position', [1, 1, 1600, 900])
%             colormap(cm)
%             
%             ax2 = subplot(2,2,2);
%             contourf(XC3,YC3,vert_wvel_3(:,:,jj,ii),'LineStyle','none','LevelList',z);
%             hold on
%             contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%             if kk==2
%                 plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%                 plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%                 plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%                 plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%                 
%                 plot(x4,y3,'Color','w','LineWidth',lw)
%                 plot(x22,y1,'Color','w','LineWidth',lw)
%                 plot(x21,y2,'Color','w','LineWidth',lw)
%                 plot(x3,y3,'Color','w','LineWidth',lw)
%             end
%             caxis([lb ub])
%             axis(inside_coords)
%             xtickformat('degrees')
%             ytickformat('degrees')
%             title(['1/3 ',datestr(dates(ii),'mmmm'),' ',...
%                 num2str(depths(jj)),'m vertical velocity [m/s]'],...
%                 'FontWeight','Normal','FontSize',16)
%             acc_movie
%             acc_quad_plots_v2
%             hold off
%             
%             ax3 = subplot(2,2,3);
%             contourf(XC6,YC6,vert_wvel_6(:,:,jj,ii),'LineStyle','none','LevelList',z);
%             hold on
%             contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%             if kk==2
%                 plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%                 plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%                 plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%                 plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%                 
%                 plot(x4,y3,'Color','w','LineWidth',lw)
%                 plot(x22,y1,'Color','w','LineWidth',lw)
%                 plot(x21,y2,'Color','w','LineWidth',lw)
%                 plot(x3,y3,'Color','w','LineWidth',lw)
%             end
%             caxis([lb ub])
%             axis(inside_coords)
%             xtickformat('degrees')
%             ytickformat('degrees')
%             title(['1/6 ',datestr(dates(ii),'mmmm'),' ',...
%                 num2str(depths(jj)),'m vertical velocity [m/s]'],...
%                 'FontWeight','Normal','FontSize',16)
%             acc_movie
%             acc_quad_plots_v3
%             hold off
%             
%             ax4 = subplot(2,2,4);
%             contourf(XC12,YC12,vert_wvel_12(:,:,jj,ii),'LineStyle','none','LevelList',z);
%             hold on
%             cbar = colorbar('eastoutside');
%             set(cbar,'XLim',[lbcb ubcb]);
%             contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%             if kk==2
%                 plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%                 plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%                 plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%                 plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%                 
%                 plot(x4,y3,'Color','w','LineWidth',lw)
%                 plot(x22,y1,'Color','w','LineWidth',lw)
%                 plot(x21,y2,'Color','w','LineWidth',lw)
%                 plot(x3,y3,'Color','w','LineWidth',lw)
%             end
%             caxis([lb ub])
%             axis(inside_coords)
%             xtickformat('degrees')
%             ytickformat('degrees')
%             title(['1/12 ',datestr(dates(ii),'mmmm'),' ',...
%                 num2str(depths(jj)),'m vertical velocity [m/s]'],...
%                 'FontWeight','Normal','FontSize',16)
%             acc_movie
%             acc_quad_plots_v8
%             hold off
%             set(gcf,'InvertHardCopy','off');
%             print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
%                 'm/ADVr_WVEL_',num2str(ii,'%02.f'),'_',...
%                 datestr(dates(ii),'mmmm'),'_',num2str(depths(jj)),'m'],'-dpng')
%             close all
%             
%         end
%     end
% end
% for jj=1:4
%     for kk=1:2
%         cm = acc_colormap('cmo_balance');
%         temp3 = mean(vert_wvel_3(:,:,jj,:),4);
%         temp6 = mean(vert_wvel_6(:,:,jj,:),4);
%         temp12 = mean(vert_wvel_12(:,:,jj,:),4);
%         
%         [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(temp3,...
%             temp3,temp6,temp12,option);
%         
%         z = linspace(lb,ub,nlvls);
%         z = [z(1)-100,z,z(end)+100];
%         
%         figure()
%         set(gcf, 'Position', [1, 1, 1600, 900])
%         colormap(cm)
%         
%         ax2 = subplot(2,2,2);
%         contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
%         hold on
%         contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%         if kk==2
%             plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%             plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%             plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%             plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%             
%             plot(x4,y3,'Color','w','LineWidth',lw)
%             plot(x22,y1,'Color','w','LineWidth',lw)
%             plot(x21,y2,'Color','w','LineWidth',lw)
%             plot(x3,y3,'Color','w','LineWidth',lw)
%         end
%         caxis([lb ub])
%         axis(inside_coords)
%         xtickformat('degrees')
%         ytickformat('degrees')
%         title(['1/3 mean 2017 ',...
%             num2str(depths(jj)),'m vertical velocity [m/s]'],...
%             'FontWeight','Normal','FontSize',16)
%         acc_movie
%         acc_quad_plots_v2
%         hold off
%         
%         ax3 = subplot(2,2,3);
%         contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
%         hold on
%         contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%         if kk==2
%             plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%             plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%             plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%             plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%             
%             plot(x4,y3,'Color','w','LineWidth',lw)
%             plot(x22,y1,'Color','w','LineWidth',lw)
%             plot(x21,y2,'Color','w','LineWidth',lw)
%             plot(x3,y3,'Color','w','LineWidth',lw)
%         end
%         caxis([lb ub])
%         axis(inside_coords)
%         xtickformat('degrees')
%         ytickformat('degrees')
%         title(['1/6 mean 2017 ',...
%             num2str(depths(jj)),'m vertical velocity [m/s]'],...
%             'FontWeight','Normal','FontSize',16)
%         acc_movie
%         acc_quad_plots_v3
%         hold off
%         
%         ax4 = subplot(2,2,4);
%         contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
%         hold on
%         cbar = colorbar('eastoutside');
%         set(cbar,'XLim',[lbcb ubcb]);
%         contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%         if kk==2
%             plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%             plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%             plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%             plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%             
%             plot(x4,y3,'Color','w','LineWidth',lw)
%             plot(x22,y1,'Color','w','LineWidth',lw)
%             plot(x21,y2,'Color','w','LineWidth',lw)
%             plot(x3,y3,'Color','w','LineWidth',lw)
%         end
%         caxis([lb ub])
%         axis(inside_coords)
%         xtickformat('degrees')
%         ytickformat('degrees')
%         title(['1/12 mean 2017 ',...
%             num2str(depths(jj)),'m vertical velocity [m/s]'],...
%             'FontWeight','Normal','FontSize',16)
%         acc_movie
%         acc_quad_plots_v8
%         hold off
%         set(gcf,'InvertHardCopy','off');
%         print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
%             'm/ADVr_WVEL_00_MEAN_',num2str(depths(jj)),'m'],'-dpng')
%         close all
%         
%         
%         cm = acc_colormap('cmo_amp');
%         temp3 = std(vert_wvel_3(:,:,jj,:),0,4);
%         temp6 = std(vert_wvel_6(:,:,jj,:),0,4);
%         temp12 = std(vert_wvel_12(:,:,jj,:),0,4);
%         
%         [lb,ub,nlvls] = get_color_bounds_standard(temp3,...
%             temp3,temp6,temp12,12);
%         lb = 0;
%         
%         z = linspace(lb,ub,nlvls);
%         z = [z,z(end)+100];
%         
%         figure()
%         set(gcf, 'Position', [1, 1, 1600, 900])
%         colormap(cm)
%         
%         ax2 = subplot(2,2,2);
%         contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
%         hold on
%         contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%         if kk==2
%             plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%             plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%             plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%             plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%             
%             plot(x4,y3,'Color','w','LineWidth',lw)
%             plot(x22,y1,'Color','w','LineWidth',lw)
%             plot(x21,y2,'Color','w','LineWidth',lw)
%             plot(x3,y3,'Color','w','LineWidth',lw)
%         end
%         caxis([lb ub])
%         axis(inside_coords)
%         xtickformat('degrees')
%         ytickformat('degrees')
%         title(['1/3 2017 st dev ',...
%             num2str(depths(jj)),'m vertical velocity [m/s]'],...
%             'FontWeight','Normal','FontSize',16)
%         acc_movie
%         acc_quad_plots_v2
%         hold off
%         
%         ax3 = subplot(2,2,3);
%         contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
%         hold on
%         contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%         if kk==2
%             plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%             plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%             plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%             plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%             
%             plot(x4,y3,'Color','w','LineWidth',lw)
%             plot(x22,y1,'Color','w','LineWidth',lw)
%             plot(x21,y2,'Color','w','LineWidth',lw)
%             plot(x3,y3,'Color','w','LineWidth',lw)
%         end
%         caxis([lb ub])
%         axis(inside_coords)
%         xtickformat('degrees')
%         ytickformat('degrees')
%         title(['1/6 2017 st dev ',...
%             num2str(depths(jj)),'m vertical velocity [m/s]'],...
%             'FontWeight','Normal','FontSize',16)
%         acc_movie
%         acc_quad_plots_v3
%         hold off
%         
%         ax4 = subplot(2,2,4);
%         contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
%         hold on
%         cbar = colorbar('eastoutside');
%         set(cbar,'XLim',[lb ub]);
%         contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
%         if kk==2
%             plot(x4,y3,'Color','k','LineWidth',lw+2.3)
%             plot(x12,y1,'Color','k','LineWidth',lw+2.3)
%             plot(x11,y2,'Color','k','LineWidth',lw+2.3)
%             plot(x3,y4,'Color','k','LineWidth',lw+2.3)
%             
%             plot(x4,y3,'Color','w','LineWidth',lw)
%             plot(x22,y1,'Color','w','LineWidth',lw)
%             plot(x21,y2,'Color','w','LineWidth',lw)
%             plot(x3,y3,'Color','w','LineWidth',lw)
%         end
%         caxis([lb ub])
%         axis(inside_coords)
%         xtickformat('degrees')
%         ytickformat('degrees')
%         title(['1/12 2017 st dev ',...
%             num2str(depths(jj)),'m vertical velocity [m/s]'],...
%             'FontWeight','Normal','FontSize',16)
%         acc_movie
%         acc_quad_plots_v4
%         hold off
%         set(gcf,'InvertHardCopy','off');
%         print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
%             'm/ADVr_WVEL_00_STD_',num2str(depths(jj)),'m'],'-dpng')
%         close all
%     end
% end
% %% END


%%
load hpc/HEAT_BUDGETS
option = 2;

for kk=1:2
    for ii=1:12
        for jj=1:4
            cm = acc_colormap('cmo_balance');
            [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(vert_heat_adv_3(:,:,jj,ii),...
                vert_heat_adv_3(:,:,jj,ii),vert_heat_adv_6(:,:,jj,ii),vert_heat_adv_12(:,:,jj,ii),option);
            
            z = linspace(lb,ub,nlvls);
            z = [z(1)-100,z,z(end)+100];
            
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            colormap(cm)
            
            ax2 = subplot(2,2,2);
            contourf(XC3,YC3,vert_heat_adv_3(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/3 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v2
            hold off
            
            ax3 = subplot(2,2,3);
            contourf(XC6,YC6,vert_heat_adv_6(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/6 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v3
            hold off
            
            ax4 = subplot(2,2,4);
            contourf(XC12,YC12,vert_heat_adv_12(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            cbar = colorbar('eastoutside');
            set(cbar,'XLim',[lbcb ubcb]);
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/12 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v8
            hold off
            set(gcf,'InvertHardCopy','off');
            print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
                'm/ADVr_HEAT_',num2str(ii,'%02.f'),'_',...
                datestr(dates(ii),'mmmm'),'_',num2str(depths(jj)),'m'],'-dpng')
            close all
            
        end
    end
end
for jj=1:4
    for kk=1:2
        cm = acc_colormap('cmo_balance');
        temp3 = mean(vert_heat_adv_3(:,:,jj,:),4);
        temp6 = mean(vert_heat_adv_6(:,:,jj,:),4);
        temp12 = mean(vert_heat_adv_12(:,:,jj,:),4);
        
        [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(temp3,...
            temp3,temp6,temp12,option);
        
        z = linspace(lb,ub,nlvls);
        z = [z(1)-100,z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 mean 2017 ',...
            num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 mean 2017 ',...
            num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lbcb ubcb]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 mean 2017 ',...
            num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v8
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_HEAT_00_MEAN_',num2str(depths(jj)),'m'],'-dpng')
        close all
        
        
        cm = acc_colormap('cmo_amp');
        temp3 = std(vert_heat_adv_3(:,:,jj,:),0,4);
        temp6 = std(vert_heat_adv_6(:,:,jj,:),0,4);
        temp12 = std(vert_heat_adv_12(:,:,jj,:),0,4);
        
        [lb,ub,nlvls] = get_color_bounds_standard(temp3,...
            temp3,temp6,temp12,12);
        lb = 0;
        
        z = linspace(lb,ub,nlvls);
        z = [z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 2017 st dev ',...
            num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 2017 st dev ',...
            num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lb ub]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 2017 st dev ',...
            num2str(depths(jj)),'m vertical heat flux [W/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v4
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_HEAT_00_STD_',num2str(depths(jj)),'m'],'-dpng')
        close all
    end
end
%% END


%%
load hpc/SALT_BUDGETS
option = 13;

for kk=1:2
    for ii=1:12
        for jj=1:4
            cm = acc_colormap('cmo_balance');
            [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(vert_salt_adv_3(:,:,jj,ii),...
                vert_salt_adv_3(:,:,jj,ii),vert_salt_adv_6(:,:,jj,ii),vert_salt_adv_12(:,:,jj,ii),option);
            
            z = linspace(lb,ub,nlvls);
            z = [z(1)-100,z,z(end)+100];
            
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            colormap(cm)
            
            ax2 = subplot(2,2,2);
            contourf(XC3,YC3,vert_salt_adv_3(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/3 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v2
            hold off
            
            ax3 = subplot(2,2,3);
            contourf(XC6,YC6,vert_salt_adv_6(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/6 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v3
            hold off
            
            ax4 = subplot(2,2,4);
            contourf(XC12,YC12,vert_salt_adv_12(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            cbar = colorbar('eastoutside');
            set(cbar,'XLim',[lbcb ubcb]);
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/12 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v8
            hold off
            set(gcf,'InvertHardCopy','off');
            print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
                'm/ADVr_SALT_',num2str(ii,'%02.f'),'_',...
                datestr(dates(ii),'mmmm'),'_',num2str(depths(jj)),'m'],'-dpng')
            close all
            
        end
    end
end
for jj=1:4
    for kk=1:2
        cm = acc_colormap('cmo_balance');
        temp3 = mean(vert_salt_adv_3(:,:,jj,:),4);
        temp6 = mean(vert_salt_adv_6(:,:,jj,:),4);
        temp12 = mean(vert_salt_adv_12(:,:,jj,:),4);
        
        [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(temp3,...
            temp3,temp6,temp12,option);
        
        z = linspace(lb,ub,nlvls);
        z = [z(1)-100,z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 mean 2017 ',...
            num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 mean 2017 ',...
            num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lbcb ubcb]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 mean 2017 ',...
            num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v8
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_SALT_00_MEAN_',num2str(depths(jj)),'m'],'-dpng')
        close all
        
        
        cm = acc_colormap('cmo_amp');
        temp3 = std(vert_salt_adv_3(:,:,jj,:),0,4);
        temp6 = std(vert_salt_adv_6(:,:,jj,:),0,4);
        temp12 = std(vert_salt_adv_12(:,:,jj,:),0,4);
        
        [lb,ub,nlvls] = get_color_bounds_standard(temp3,...
            temp3,temp6,temp12,12);
        lb = 0;
        
        z = linspace(lb,ub,nlvls);
        z = [z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 2017 st dev ',...
            num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 2017 st dev ',...
            num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lb ub]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 2017 st dev ',...
            num2str(depths(jj)),'m vertical salt flux [kg/s/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v4
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_SALT_00_STD_',num2str(depths(jj)),'m'],'-dpng')
        close all
    end
end
%% END

%%
load hpc/CARBON_BUDGETS


for kk=1:2
    for ii=1:12
        for jj=1:4
            cm = acc_colormap('cmo_balance');
            [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(vert_carbon_adv_3(:,:,jj,ii),...
                vert_carbon_adv_3(:,:,jj,ii),vert_carbon_adv_6(:,:,jj,ii),vert_carbon_adv_12(:,:,jj,ii),option);
            
            z = linspace(lb,ub,nlvls);
            z = [z(1)-100,z,z(end)+100];
            
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            colormap(cm)
            
            ax2 = subplot(2,2,2);
            contourf(XC3,YC3,vert_carbon_adv_3(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/3 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v2
            hold off
            
            ax3 = subplot(2,2,3);
            contourf(XC6,YC6,vert_carbon_adv_6(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/6 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v3
            hold off
            
            ax4 = subplot(2,2,4);
            contourf(XC12,YC12,vert_carbon_adv_12(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            cbar = colorbar('eastoutside');
            set(cbar,'XLim',[lbcb ubcb]);
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/12 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v8
            hold off
            set(gcf,'InvertHardCopy','off');
            print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
                'm/ADVr_CARBON_',num2str(ii,'%02.f'),'_',...
                datestr(dates(ii),'mmmm'),'_',num2str(depths(jj)),'m'],'-dpng')
            close all
            
        end
    end
end
for jj=1:4
    for kk=1:2
        cm = acc_colormap('cmo_balance');
        temp3 = mean(vert_carbon_adv_3(:,:,jj,:),4);
        temp6 = mean(vert_carbon_adv_6(:,:,jj,:),4);
        temp12 = mean(vert_carbon_adv_12(:,:,jj,:),4);
        
        [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(temp3,...
            temp3,temp6,temp12,option);
        
        z = linspace(lb,ub,nlvls);
        z = [z(1)-100,z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 mean 2017 ',...
            num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 mean 2017 ',...
            num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lbcb ubcb]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 mean 2017 ',...
            num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v8
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_CARBON_00_MEAN_',num2str(depths(jj)),'m'],'-dpng')
        close all
        
        
        cm = acc_colormap('cmo_amp');
        temp3 = std(vert_carbon_adv_3(:,:,jj,:),0,4);
        temp6 = std(vert_carbon_adv_6(:,:,jj,:),0,4);
        temp12 = std(vert_carbon_adv_12(:,:,jj,:),0,4);
        
        [lb,ub,nlvls] = get_color_bounds_standard(temp3,...
            temp3,temp6,temp12,12);
        lb = 0;
        
        z = linspace(lb,ub,nlvls);
        z = [z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 2017 st dev ',...
            num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 2017 st dev ',...
            num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lb ub]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 2017 st dev ',...
            num2str(depths(jj)),'m vertical carbon flux [kg C/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v4
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_CARBON_00_STD_',num2str(depths(jj)),'m'],'-dpng')
        close all
    end
end
%% END

%%
load hpc/OXYGEN_BUDGETS


for kk=1:2
    for ii=1:12
        for jj=1:4
            cm = acc_colormap('cmo_balance');
            [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(vert_oxygen_adv_3(:,:,jj,ii),...
                vert_oxygen_adv_3(:,:,jj,ii),vert_oxygen_adv_6(:,:,jj,ii),vert_oxygen_adv_12(:,:,jj,ii),option);
            
            z = linspace(lb,ub,nlvls);
            z = [z(1)-100,z,z(end)+100];
            
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            colormap(cm)
            
            ax2 = subplot(2,2,2);
            contourf(XC3,YC3,vert_oxygen_adv_3(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/3 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v2
            hold off
            
            ax3 = subplot(2,2,3);
            contourf(XC6,YC6,vert_oxygen_adv_6(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/6 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v3
            hold off
            
            ax4 = subplot(2,2,4);
            contourf(XC12,YC12,vert_oxygen_adv_12(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            cbar = colorbar('eastoutside');
            set(cbar,'XLim',[lbcb ubcb]);
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/12 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v8
            hold off
            set(gcf,'InvertHardCopy','off');
            print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
                'm/ADVr_OXYGEN_',num2str(ii,'%02.f'),'_',...
                datestr(dates(ii),'mmmm'),'_',num2str(depths(jj)),'m'],'-dpng')
            close all
            
        end
    end
end
for jj=1:4
    for kk=1:2
        cm = acc_colormap('cmo_balance');
        temp3 = mean(vert_oxygen_adv_3(:,:,jj,:),4);
        temp6 = mean(vert_oxygen_adv_6(:,:,jj,:),4);
        temp12 = mean(vert_oxygen_adv_12(:,:,jj,:),4);
        
        [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(temp3,...
            temp3,temp6,temp12,option);
        
        z = linspace(lb,ub,nlvls);
        z = [z(1)-100,z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 mean 2017 ',...
            num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 mean 2017 ',...
            num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lbcb ubcb]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 mean 2017 ',...
            num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v8
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_OXYGEN_00_MEAN_',num2str(depths(jj)),'m'],'-dpng')
        close all
        
        
        cm = acc_colormap('cmo_amp');
        temp3 = std(vert_oxygen_adv_3(:,:,jj,:),0,4);
        temp6 = std(vert_oxygen_adv_6(:,:,jj,:),0,4);
        temp12 = std(vert_oxygen_adv_12(:,:,jj,:),0,4);
        
        [lb,ub,nlvls] = get_color_bounds_standard(temp3,...
            temp3,temp6,temp12,12);
        lb = 0;
        
        z = linspace(lb,ub,nlvls);
        z = [z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 2017 st dev ',...
            num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 2017 st dev ',...
            num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lb ub]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 2017 st dev ',...
            num2str(depths(jj)),'m vertical oxygen flux [kg O/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v4
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_OXYGEN_00_STD_',num2str(depths(jj)),'m'],'-dpng')
        close all
    end
end
%% END

%%
load hpc/NITRATE_BUDGETS


for kk=1:2
    for ii=1:12
        for jj=1:4
            cm = acc_colormap('cmo_balance');
            [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(vert_nitrate_adv_3(:,:,jj,ii),...
                vert_nitrate_adv_3(:,:,jj,ii),vert_nitrate_adv_6(:,:,jj,ii),vert_nitrate_adv_12(:,:,jj,ii),option);
            
            z = linspace(lb,ub,nlvls);
            z = [z(1)-100,z,z(end)+100];
            
            figure()
            set(gcf, 'Position', [1, 1, 1600, 900])
            colormap(cm)
            
            ax2 = subplot(2,2,2);
            contourf(XC3,YC3,vert_nitrate_adv_3(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/3 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v2
            hold off
            
            ax3 = subplot(2,2,3);
            contourf(XC6,YC6,vert_nitrate_adv_6(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/6 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v3
            hold off
            
            ax4 = subplot(2,2,4);
            contourf(XC12,YC12,vert_nitrate_adv_12(:,:,jj,ii),'LineStyle','none','LevelList',z);
            hold on
            cbar = colorbar('eastoutside');
            set(cbar,'XLim',[lbcb ubcb]);
            contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
            if kk==2
                plot(x4,y3,'Color','k','LineWidth',lw+2.3)
                plot(x12,y1,'Color','k','LineWidth',lw+2.3)
                plot(x11,y2,'Color','k','LineWidth',lw+2.3)
                plot(x3,y4,'Color','k','LineWidth',lw+2.3)
                
                plot(x4,y3,'Color','w','LineWidth',lw)
                plot(x22,y1,'Color','w','LineWidth',lw)
                plot(x21,y2,'Color','w','LineWidth',lw)
                plot(x3,y3,'Color','w','LineWidth',lw)
            end
            caxis([lb ub])
            axis(inside_coords)
            xtickformat('degrees')
            ytickformat('degrees')
            title(['1/12 ',datestr(dates(ii),'mmmm'),' ',...
                num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
                'FontWeight','Normal','FontSize',16)
            acc_movie
            acc_quad_plots_v8
            hold off
            set(gcf,'InvertHardCopy','off');
            print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
                'm/ADVr_NITRATE_',num2str(ii,'%02.f'),'_',...
                datestr(dates(ii),'mmmm'),'_',num2str(depths(jj)),'m'],'-dpng')
            close all
            
        end
    end
end
for jj=1:4
    for kk=1:2
        cm = acc_colormap('cmo_balance');
        temp3 = mean(vert_nitrate_adv_3(:,:,jj,:),4);
        temp6 = mean(vert_nitrate_adv_6(:,:,jj,:),4);
        temp12 = mean(vert_nitrate_adv_12(:,:,jj,:),4);
        
        [lb,ub,lbcb,ubcb,nlvls] = get_color_bounds_balance(temp3,...
            temp3,temp6,temp12,option);
        
        z = linspace(lb,ub,nlvls);
        z = [z(1)-100,z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 mean 2017 ',...
            num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 mean 2017 ',...
            num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lbcb ubcb]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 mean 2017 ',...
            num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v8
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_NITRATE_00_MEAN_',num2str(depths(jj)),'m'],'-dpng')
        close all
        
        
        cm = acc_colormap('cmo_amp');
        temp3 = std(vert_nitrate_adv_3(:,:,jj,:),0,4);
        temp6 = std(vert_nitrate_adv_6(:,:,jj,:),0,4);
        temp12 = std(vert_nitrate_adv_12(:,:,jj,:),0,4);
        
        [lb,ub,nlvls] = get_color_bounds_standard(temp3,...
            temp3,temp6,temp12,12);
        lb = 0;
        
        z = linspace(lb,ub,nlvls);
        z = [z,z(end)+100];
        
        figure()
        set(gcf, 'Position', [1, 1, 1600, 900])
        colormap(cm)
        
        ax2 = subplot(2,2,2);
        contourf(XC3,YC3,temp3,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/3 2017 st dev ',...
            num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v2
        hold off
        
        ax3 = subplot(2,2,3);
        contourf(XC6,YC6,temp6,'LineStyle','none','LevelList',z);
        hold on
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/6 2017 st dev ',...
            num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v3
        hold off
        
        ax4 = subplot(2,2,4);
        contourf(XC12,YC12,temp12,'LineStyle','none','LevelList',z);
        hold on
        cbar = colorbar('eastoutside');
        set(cbar,'XLim',[lb ub]);
        contour(XCm,YCm,mask(:,:,mask_ind(jj)),'Color','k')
        if kk==2
            plot(x4,y3,'Color','k','LineWidth',lw+2.3)
            plot(x12,y1,'Color','k','LineWidth',lw+2.3)
            plot(x11,y2,'Color','k','LineWidth',lw+2.3)
            plot(x3,y4,'Color','k','LineWidth',lw+2.3)
            
            plot(x4,y3,'Color','w','LineWidth',lw)
            plot(x22,y1,'Color','w','LineWidth',lw)
            plot(x21,y2,'Color','w','LineWidth',lw)
            plot(x3,y3,'Color','w','LineWidth',lw)
        end
        caxis([lb ub])
        axis(inside_coords)
        xtickformat('degrees')
        ytickformat('degrees')
        title(['1/12 2017 st dev ',...
            num2str(depths(jj)),'m vertical nitrate flux [kg N/yr/m^2]'],...
            'FontWeight','Normal','FontSize',16)
        acc_movie
        acc_quad_plots_v4
        hold off
        set(gcf,'InvertHardCopy','off');
        print('-r300',['ADVr',num2str(kk),'/',num2str(depths(jj)),...
            'm/ADVr_NITRATE_00_STD_',num2str(depths(jj)),'m'],'-dpng')
        close all
    end
end
%% END







toc()