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

etest       = {  51   52   53   54   55    56    57    58    59    60    61   62 };
mtest       = {  51   52   53   54   55    56    57    58    59    60    61   62 };
t_end       = {  30   30   30   30   30    30    50    50    50    50    20   20 };
t_ignition  = {1097  676  692 1219  737  1308  2716  2159  2007  2150   622  571 };

% Column numbers to plot

p = {[11]   ,[0 0];...                % Test 51
     [4  ]  ,[0 0];...                % Test 52
     [12]   ,[0 0];...                % Test 53
     [6 ]   ,[0 0];...                % Test 54
     [11]   ,[0 0];...                % Test 55
     [5 ]   ,[0 0];...                % Test 56
     [5 6]  ,[0 0];...                % Test 57
     [9 10] ,[0 0];...                % Test 58
     [5 6]  ,[0 0];...                % Test 59
     [5 6]  ,[0 0];...                % Test 60
     [6 7]  ,[0 0];...                % Test 61
     [6 7]  ,[0 0]};                  % Test 62

legend_labels = {{'Slug 8'}           ,{'x','x'};...    % Test 51
                 {'Slug 1'}           ,{'x','x'};...    % Test 52
                 {'Slug 13'}          ,{'x','x'};...    % Test 53
                 {'Slug 8' }          ,{'x','x'};...    % Test 54
                 {'Slug 17'}          ,{'x','x'};...    % Test 55
                 {'Slug 7'}           ,{'x','x'};...    % Test 56
                 {'Slug 2','Slug 3'}  ,{'x','x'};...    % Test 57
                 {'Slug 11','Slug 12'},{'x','x'};...    % Test 58
                 {'Slug 2','Slug 3'}  ,{'x','x'};...    % Test 59
                 {'Slug 2','Slug 3'}  ,{'x','x'};...    % Test 60
                 {'Slug 4','Slug 5'}  ,{'x','x'};...    % Test 61
                 {'Slug 17','Slug 18'},{'x','x'}};      % Test 62

y_axis_labels = {{'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'};...
                 {'Temperature ($^\circ$C)'},{'Temperature ($^\circ$C)'}};

y_max = {600 600;...      % Test 51
         600 600;...      % Test 52
         600 600;...      % Test 53
         600 600;...      % Test 54
         600 600;...      % Test 55
         600 600;...      % Test 56
         600 600;...      % Test 57
         600 600;...      % Test 58
         600 600;...      % Test 59
         600 600;...      % Test 60
         600 600;...      % Test 61
         600 600};        % Test 62

symbols = {'k-' 'r-' 'g-' 'm-' 'c-' 'b-'};

for j=1:12 % Test

   E = importdata(['../DATA/Test_',num2str(etest{j},'%1d\n'),'.csv'],',',2);
   M = importdata(['../FDS/Test_',num2str(mtest{j},'%1d\n'),'_devc.csv'],',',2);

   for i=1:2
 
      if p{j,i}(1)==0 ; break ; end

      for ii=1:length(p{j,i})
         plot(E.data(:,1)/60,E.data(:,p{j,i}(ii)),symbols{ii}); hold on
      end

      plot(M.data(:,1)/60,M.data(:,[2 3 4 5]),'g-'); hold on

      plot([t_ignition{j}/60 t_ignition{j}/60],[0 y_max{j,i}],'k--'); hold on

      set(gca,'FontName',Font_Name)
      set(gca,'FontSize',Title_Font_Size)
      axis([0 t_end{j} 0 y_max{j,i}])
      text(.05,.90,['Experiment ' num2str(etest{j},'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

      xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
      ylabel(y_axis_labels{j,i},'FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
      legend(legend_labels{j,i},'Location','Best','FontSize',Legend_Font_Size);

      set(gcf,'Visible',Figure_Visibility);
      set(gcf,'Units',Paper_Units);
      set(gcf,'PaperUnits',Paper_Units);
      set(gcf,'PaperSize',[Paper_Width Paper_Height]);
      set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
      print(gcf,'-dpdf',['../SCRIPT_FIGURES/FDS_Test_' num2str(etest{j},'%1d\n') '_Plot_' num2str(i)])

      hold off

   end
end

