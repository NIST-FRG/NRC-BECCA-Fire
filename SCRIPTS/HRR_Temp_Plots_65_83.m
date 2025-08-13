% McGrattan
% 4-18-2025
%
% Create plots of HRR and temperature for BECCA-FIRE

close all
clear all

Font_Name       = 'Arial';
Key_Font_Size   = 14;
Title_Font_Size = 16;
Label_Font_Size = 16;
Legend_Font_Size= 12;
Line_Width      = 1.0;
Plot_Units      = 'inches';
Plot_Width      = 4.5;
Plot_Height     = 3.15;
Plot_X          = 0.9;
Plot_Y          = 0.75;
Paper_Units     = 'inches';
Paper_Width     = 5.75;
Paper_Height    = 4.5;
Figure_Visibility = 'on';
Font_Interpreter = 'TeX';

t_fail  = {[  -1   -1 14.2 13.8];... % Test 65
           [  -1   -1 22.4 23.0];... % Test 66
           [33.1 27.2 29.9 33.8];... % Test 67
           [  -1   -1   -1   -1];... % Test 68
           [  -1   -1   -1   -1];... % Test 69
           [  -1   -1 30.9 31.0];... % Test 70
           [16.1 17.5 12.7 13.2];... % Test 71
           [24.5 20.7 17.7 18.5];... % Test 72
           [  -1   -1   -1   -1];... % Test 73
           [  -1   -1 23.7 23.4];... % Test 74
           [30.0 26.8 21.4 21.2];... % Test 75
           [  -1   -1   -1   -1];... % Test 76
           [  -1   -1 17.3 16.7];... % Test 77
           [10.9 10.4  9.6  9.9];... % Test 78
           [29.0 30.1 30.4 30.8];... % Test 79
           [  -1   -1   -1   -1];... % Test 80
           [  -1   -1 30.3 30.5];... % Test 81
           [17.3 17.3 17.5 17.2];... % Test 82
           [19.5 17.2 13.2 12.2]};   % Test 83

for j=1:19 % Test

   test_number = 64 + j;
   E = importdata(['../DATA/Test_',num2str(test_number,'%1d\n'),'.csv'],',',2);

   plot(E.data(:,1)/60,E.data(:,2),'r-'); hold on
   plot(E.data(:,1)/60,E.data(:,3),'k-'); hold on

   set(gca,'FontName',Font_Name)
   set(gca,'FontSize',Title_Font_Size)
   axis([0 40 0 600])
   text(.05,.90,['Experiment ' num2str(test_number,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

   xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   ylabel('Heat Release Rate (kW)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   legend({'Burner','Total'},'Location','NorthEast','FontSize',Legend_Font_Size);

   set(gcf,'Visible',Figure_Visibility);
   set(gcf,'Units',Paper_Units);
   set(gcf,'PaperUnits',Paper_Units);
   set(gcf,'PaperSize',[Paper_Width Paper_Height]);
   set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
   print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(test_number,'%1d\n') '_HRR'])

   hold off

   clf('reset')

   plot(E.data(:,1)/60,E.data(:,4),'r-'); hold on
   plot(E.data(:,1)/60,E.data(:,5),'k-'); hold on
   plot(E.data(:,1)/60,E.data(:,6),'g-'); hold on

   if t_fail{j}(1)>0 ; plot([t_fail{j}(1) t_fail{j}(1)],[0 800],'k--'); hold on ; end
   if t_fail{j}(2)>0 ; plot([t_fail{j}(2) t_fail{j}(2)],[0 800],'k--'); hold on ; end

   set(gca,'FontName',Font_Name)
   set(gca,'FontSize',Title_Font_Size)
   axis([0 40 0 800])
   text(.05,.90,['Experiment ' num2str(test_number,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

   xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   ylabel('Temperature (°C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   legend({'TC-1','TC-2','TC-3'},'Location','East','FontSize',Legend_Font_Size);

   set(gcf,'Visible',Figure_Visibility);
   set(gcf,'Units',Paper_Units);
   set(gcf,'PaperUnits',Paper_Units);
   set(gcf,'PaperSize',[Paper_Width Paper_Height]);
   set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
   print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(test_number,'%1d\n') '_TC_1-3'])

   hold off

   clf('reset')

   plot(E.data(:,1)/60,E.data(:,7),'r-'); hold on
   plot(E.data(:,1)/60,E.data(:,8),'k-'); hold on
   plot(E.data(:,1)/60,E.data(:,9),'g-'); hold on

   if t_fail{j}(3)>0 ; plot([t_fail{j}(3) t_fail{j}(3)],[0 800],'k--'); hold on ; end
   if t_fail{j}(4)>0 ; plot([t_fail{j}(4) t_fail{j}(4)],[0 800],'k--'); hold on ; end

   set(gca,'FontName',Font_Name)
   set(gca,'FontSize',Title_Font_Size)
   axis([0 40 0 800])
   text(.05,.90,['Experiment ' num2str(test_number,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

   xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   ylabel('Temperature (°C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   legend({'TC-4','TC-5','TC-6'},'Location','East','FontSize',Legend_Font_Size);

   set(gcf,'Visible',Figure_Visibility);
   set(gcf,'Units',Paper_Units);
   set(gcf,'PaperUnits',Paper_Units);
   set(gcf,'PaperSize',[Paper_Width Paper_Height]);
   set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
   print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(test_number,'%1d\n') '_TC_4-6'])

   hold off

   clf('reset')

   plot(E.data(:,1)/60,E.data(:,10),'r-'); hold on
   plot(E.data(:,1)/60,E.data(:,11),'k-'); hold on

   set(gca,'FontName',Font_Name)
   set(gca,'FontSize',Title_Font_Size)
   axis([0 40 0 1100])
   text(.05,.90,['Experiment ' num2str(test_number,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

   xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   ylabel('Temperature (°C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   legend({'TC-7','TC-8'},'Location','East','FontSize',Legend_Font_Size);

   set(gcf,'Visible',Figure_Visibility);
   set(gcf,'Units',Paper_Units);
   set(gcf,'PaperUnits',Paper_Units);
   set(gcf,'PaperSize',[Paper_Width Paper_Height]);
   set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
   print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(test_number,'%1d\n') '_TC_7-8'])

   hold off

   clf('reset')

end

