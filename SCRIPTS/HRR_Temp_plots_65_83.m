% McGrattan
% 4-18-2025
%
% Create plots of HRR and temperature for BECCA-FIRE

close all
clear all

Font_Name       = 'Times';
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
Font_Interpreter = 'LaTeX';

t_ignition  = {1097  676  692 1219  737  1308  2716  2159  2007  2150   622  571 };

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

   set(gca,'FontName',Font_Name)
   set(gca,'FontSize',Title_Font_Size)
   axis([0 40 0 800])
   text(.05,.90,['Experiment ' num2str(test_number,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

   xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   ylabel('Temperature ($^\circ$C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
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

   set(gca,'FontName',Font_Name)
   set(gca,'FontSize',Title_Font_Size)
   axis([0 40 0 800])
   text(.05,.90,['Experiment ' num2str(test_number,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

   xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
   ylabel('Temperature ($^\circ$C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
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
   ylabel('Temperature ($^\circ$C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
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

