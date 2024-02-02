% McGrattan
% 1-30-2024
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

% Test No. 36  37  38  39  40  41  42  43  44  45  46  47  48
t_end   = { 8  10  40  10  90  90  20  40  40  90  20  10  10};

% Column numbers to plot

p = {[2 3],[4 10],[5 11],[6 12],[0 0];...
     [2 3],[7 13],[8 14],[9 15],[0 0];...
     [2 3],[7 13],[8 14],[9 15],[0 0];...
     [2 3],[4 10],[5 11],[6 12],[0 0];...
     [2 3],[4  7],[5  8],[6  9],[10 11 12];...
     [2 3],[4  7],[5  8],[6  9],[13 14 15];...
     [2 3],[10 11 12 13 14 15],[0 0],[0 0],[0 0];...
     [2 3],[4 5 6 7 8 9],[10 11 12 13 14 15],[0 0],[0 0];...
     [2 3],[4 5 6 7 8 9],[10 11 12 13 14 15],[0 0],[0 0];...
     [2 3],[4 9],[5 8],[0 0],[0 0];...
     [2 3],[7 10],[6 11],[0 0],[0 0];...
     [2 3],[7 10],[4 9],[0 0],[0 0];...
     [2 3],[6 8],[5 11],[0 0],[0 0]};

legend_labels = {{'Burner','Total'},{'Slug 1','Cable 1'},{'Slug 2','Cable 2'},{'Slug 3','Cable 3'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 4','Cable 4'},{'Slug 5','Cable 5'},{'Slug 6','Cable 6'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 4','Cable 4'},{'Slug 5','Cable 5'},{'Slug 6','Cable 6'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 1','Cable 1'},{'Slug 2','Cable 2'},{'Slug 3','Cable 3'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 7','Cable 7'},{'Slug 8','Cable 8'},{'Slug 9','Cable 9'},{'Right 1' 'Right 2' 'Right 3'};...
                 {'Burner','Total'},{'Slug 7','Cable 7'},{'Slug 8','Cable 8'},{'Slug 9','Cable 9'},{'Left 1'  'Left 2'  'Left 3'} ;...
                 {'Burner','Total'},{'15 cm','45 cm','75 cm','105 cm','135 cm','165 cm'},{'x' 'x'},{'x' 'x'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 15 cm','Slug 15 cm','Slug 30 cm','Slug 30 cm','Slug 60 cm','Slug 60 cm'},{'Gas 15 cm','Gas 15 cm','Gas 30 cm','Gas 30 cm','Gas 60 cm','Gas 60 cm'},{'x' 'x'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 15 cm','Slug 15 cm','Slug 30 cm','Slug 30 cm','Slug 60 cm','Slug 60 cm'},{'Gas 15 cm','Gas 15 cm','Gas 30 cm','Gas 30 cm','Gas 60 cm','Gas 60 cm'},{'x' 'x'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 8','Cable 8'},{'Slug 10','Cable 7'},{'x','x'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 14','Cable 9'},{'Slug 12','Cable 10'},{'x','x'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 15','Cable 3'},{'Slug 7','Cable 2'},{'x','x'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 14','Cable 1'},{'Slug 9','Cable 10'},{'x','x'},{'x' 'x'}};

y_axis_labels = {'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)';...
                 'Heat Release Rate (kW)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)' 'Temperature ($^\circ$C)'};

y_max = {100 500 500 500 500;...
         100 500 500 500 500;...
         100 500 500 500 500;...
         100 500 500 500 500;...
         200 500 500 500 1000;...
         300 500 500 500 1000;...
         400 500 500 500 1000;...
         400 500 500 500 1000;...
         400 500 500 500 1000;...
         100 600 600 500 500;...
         100 600 600 500 500;...
         100 600 600 500 500;...
         100 600 600 500 500};

symbols = {'k-' 'r-' 'g-' 'm-' 'c-' 'b-'};

for j=36:48

   M  = importdata(['../DATA/Test_',num2str(j,'%1d\n'),'.csv'],',',2);

   for i=1:5
 
      if p{j-35,i}(1)==0 ; break ; end

      for ii=1:length(p{j-35,i})
         plot(M.data(:,1)/60,M.data(:,p{j-35,i}(ii)),symbols{ii}); hold on
      end

      set(gca,'FontName',Font_Name)
      set(gca,'FontSize',Title_Font_Size)
      axis([0 t_end{j-35} 0 y_max{j-35,i}])
      text(.05,.90,['Experiment ' num2str(j,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

      xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
      ylabel(y_axis_labels{j-35,i},'FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
      legend(legend_labels{j-35,i},'Location','Northeast','FontSize',Legend_Font_Size);

      set(gcf,'Visible',Figure_Visibility);
      set(gcf,'Units',Paper_Units);
      set(gcf,'PaperUnits',Paper_Units);
      set(gcf,'PaperSize',[Paper_Width Paper_Height]);
      set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
      print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(j,'%1d\n') '_Plot_' num2str(i)])

      hold off

   end
end

