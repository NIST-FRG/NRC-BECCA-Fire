% McGrattan
% 3-21-2022
% HRR_Temp_Gas
%
% Create plots of HRR and gas concentration for OLIVE-FIRE

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

HRR_File = {'../DATA/Test_33.csv',...
            '../DATA/Test_34.csv',...
            '../DATA/Test_35.csv'};

t_end   = {60 60 60};

HRR_max = {400 400 400};
       
HRR_label_1 = {'Burner' 'Burner' 'Burner'};           
HRR_label_2 = {'Total' 'Total' 'Total'};
                       
for j=1:3

M = importdata(HRR_File{j},',',2);

dt = t_end{j}/10;

plot(M.data(:,1)/60,M.data(:,2),'k--'); hold on
plot(M.data(:,1)/60,M.data(:,3),'k-'); hold on

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)
axis([0 t_end{j} 0 HRR_max{j}])
text(.05,.90,['Experiment ' num2str(j+32,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
ylabel('Heat Release Rate (kW)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
legend({HRR_label_1{j},HRR_label_2{j}}, 'Location', 'Best','FontSize',Legend_Font_Size);

set(gcf,'Visible',Figure_Visibility);
set(gcf,'Units',Paper_Units);
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(j+32,'%1d\n') '_HRR'])

hold off

clf('reset')

if j==1
    plot(M.data(:,1)/60,M.data(:,5),'k-'); hold on
    plot(M.data(:,1)/60,M.data(:,15),'k--'); hold on
else
    plot(M.data(:,1)/60,M.data(:,5),'k-'); hold on
    plot(M.data(:,1)/60,M.data(:,7),'k--'); hold on
end

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)
axis([0 t_end{j} 0 1000])
text(.05,.90,['Experiment ' num2str(j+32,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
ylabel('Temperature ($^\circ$C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
legend({'Aluminum Slug','Cable Segment'}, 'Location', 'South','Interpreter',Font_Interpreter,'FontSize',Legend_Font_Size);

set(gcf,'Visible',Figure_Visibility);
set(gcf,'Units',Paper_Units);
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(j+32,'%1d\n') '_Slug_TC'])

hold off

clf('reset')

if j==1
    plot(M.data(:,1)/60,M.data(:,9),'k-'); hold on
    plot(M.data(:,1)/60,M.data(:,10),'k--'); hold on
    plot(M.data(:,1)/60,M.data(:,11),'k-.'); hold on
    plot(M.data(:,1)/60,M.data(:,12),'k:'); hold on
    legend({'Breaker Compartment','Loaded Compartment Above','Top Center','Top Right'}, 'Location', 'South','Interpreter',Font_Interpreter,'FontSize',Legend_Font_Size);

elseif j==2
    plot(M.data(:,1)/60,M.data(:,14),'k-'); hold on
    plot(M.data(:,1)/60,M.data(:,12),'k--'); hold on
    legend({'Breaker Compartment','Empty Compartment Above'}, 'Location', 'South','Interpreter',Font_Interpreter,'FontSize',Legend_Font_Size);
else
    plot(M.data(:,1)/60,M.data(:,10),'k-'); hold on
    plot(M.data(:,1)/60,M.data(:,11),'k--'); hold on
    legend({'Breaker Compartment','Compartment Above'}, 'Location', 'South','Interpreter',Font_Interpreter,'FontSize',Legend_Font_Size);
end

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)
axis([0 t_end{j} 0 1000])
text(.05,.90,['Experiment ' num2str(j+32,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
ylabel('Temperature ($^\circ$C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)

set(gcf,'Visible',Figure_Visibility);
set(gcf,'Units',Paper_Units);
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(j+32,'%1d\n') '_Gas_TC'])

hold off

clf('reset')

end

% Make a plot of the Al rods and cable oven test

M = importdata('../DATA/Oven_Test_002_avg.csv',',',2);

plot(M.data(:,1),M.data(:,2),'k-'); hold on
plot(M.data(:,1),M.data(:,8),'k--'); hold on
plot(M.data(:,1),M.data(:,9),'k:'); hold on

set(gca,'FontName',Font_Name)
set(gca,'FontSize',Title_Font_Size)
axis([0 100 0 400])

xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
ylabel('Temperature ($^\circ$C)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
legend('Aluminum Rod','Thermoset Cable','Thermoplastic Cable','Location', 'Best','FontSize',Legend_Font_Size);

set(gcf,'Visible',Figure_Visibility);
set(gcf,'Units',Paper_Units);
set(gcf,'PaperUnits',Paper_Units);
set(gcf,'PaperSize',[Paper_Width Paper_Height]);
set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
print(gcf,'-dpdf',['../SCRIPT_FIGURES/Oven_Test'])

hold off
