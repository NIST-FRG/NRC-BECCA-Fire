% McGrattan
% 1-30-2024
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

% Test No.       36    37    38    39    40    41    42    43    44    45    46    47    48    49    50    51    52    53    54    55    56    57    58    59    60    61    62    63    64
t_end      = {    8    10    40    10    90    90    20    40    40    90    20    10    10    40    30    30    30    30    30    30    30    50    50    50    50    20    20    50    30};
t_ignition = {   90   240   -1.    75   -1.   -1.   -1.   -1.   -1.  3000   705    60   180   -1.  1213  1097   676   692  1219   737  1308  2716  2159  2007  2150   622   571  2613   857};

% Column numbers to plot

p = {[2 3],[4 10],[5 11],[6 12],[0 0];...                         % Test 36
     [2 3],[7 13],[8 14],[9 15],[0 0];...                         % Test 37
     [2 3],[7 13],[8 14],[9 15],[0 0];...                         % Test 38
     [2 3],[4 10],[5 11],[6 12],[0 0];...                         % Test 39
     [2 3],[4  7],[5  8],[6  9],[10 11 12];...                    % Test 40
     [2 3],[4  7],[5  8],[6  9],[13 14 15];...                    % Test 41
     [2 3],[10 11 12 13 14 15],[0 0],[0 0],[0 0];...              % Test 42
     [2 3],[4 5 6 7 8 9],[10 11 12 13 14 15],[0 0],[0 0];...      % Test 43
     [2 3],[4 5 6 7 8 9],[10 11 12 13 14 15],[0 0],[0 0];...      % Test 44
     [2 3],[4 9],[5 8],[0 0],[0 0];...                            % Test 45
     [2 3],[7 10],[6 11],[0 0],[0 0];...                          % Test 46
     [2 3],[7 10],[4 9],[0 0],[0 0];...                           % Test 47
     [2 3],[6 8],[5 11],[0 0],[0 0];...                           % Test 48
     [2 3],[7 8 28 29],[12 13 22 23],[0 0],[0 0];...              % Test 49
     [2 3],[6 25],[0  0],[0 0],[0 0];...                          % Test 50
     [2 3],[10 21],[11 22],[0 0],[0 0];...                        % Test 51
     [2 3],[5 17],[4 18],[0 0],[0 0];...                          % Test 52
     [2 3],[13 18],[12 17],[0 0],[0 0];...                        % Test 53
     [2 3],[7 18],[6 17],[0 0],[0 0];...                          % Test 54
     [2 3],[13 14 18 19],[11 12 16 17],[0 0],[0 0];...            % Test 55
     [2 3],[7 8 12 13],[5 6 10 11],[0 0],[0 0];...                % Test 56
     [2 3],[7 8 18 19],[5 6 16 17],[0 0],[0 0];...                % Test 57
     [2 3],[5 6 16 17],[7 8 18 19],[0 0],[0 0];...                % Test 58
     [2 3],[5 6 16 17],[7 8 18 19],[0 0],[0 0];...                % Test 59
     [2 3],[5 6 13 14],[7 8 15 16],[0 0],[0 0];...                % Test 60
     [2 3],[6 11],[7 12],[8 13],[0 0];...                         % Test 61
     [2 3],[6 11],[7 12],[8 13],[0 0];...                         % Test 62
     [2 3],[6 11],[7 12],[8 13],[0 0];...                         % Test 63
     [2 3],[6 11],[7 12],[8 13],[0 0]};                           % Test 64

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
                 {'Burner','Total'},{'Slug 14','Cable 1'},{'Slug 9','Cable 10'},{'x','x'},{'x' 'x'};...
                 {'Burner','Total'},{'Slug 4','Slug 5','Cable 39','Cable 40'},{'Slug 9','Slug 10','Cable 23','Cable 24'},{'x','x'},{'x' 'x'};...    % Test 49
                 {'Burner','Total'},{'Slug 6','Cable 35'},{'x','x'},{'x','x'},{'x' 'x'};...                % Test 50
                 {'Burner','Total'},{'Slug 7','Cable 22'},{'Slug 8','Cable 21'},{'x','x'},{'x' 'x'};...    % Test 51
                 {'Burner','Total'},{'Slug 2','Cable 37'},{'Slug 1','Cable 38'},{'x','x'},{'x' 'x'};...    % Test 52
                 {'Burner','Total'},{'Slug 14','Cable 34'},{'Slug 13','Cable 33'},{'x','x'},{'x' 'x'};...    % Test 53
                 {'Burner','Total'},{'Slug 9','Cable 24'},{'Slug 8','Cable 23'},{'x','x'},{'x' 'x'};...    % Test 54
                 {'Burner','Total'},{'Slug 19','Slug 20','Cable 29','Cable 30'},{'Slug 17','Slug 18','Cable 27','Cable 28'},{'x','x'},{'x' 'x'};...    % Test 55
                 {'Burner','Total'},{'Slug 9','Slug 11','Cable 24','Cable 25'},{'Slug 7','Slug 8','Cable 22','Cable 23'},{'x','x'},{'x' 'x'};...    % Test 56
                 {'Burner','Total'},{'Slug 4','Slug 5','Cable 24','Cable 25'},{'Slug 2','Slug 3','Cable 22','Cable 23'},{'x','x'},{'x' 'x'};...    % Test 57
                 {'Burner','Total'},{'Slug 11','Slug 12','Cable 31','Cable 32'},{'Slug 13','Slug 14','Cable 33','Cable 34'},{'x','x'},{'x' 'x'};...    % Test 58
                 {'Burner','Total'},{'Slug 2','Slug 3','Cable 22','Cable 23'},{'Slug 4','Slug 5','Cable 24','Cable 25'},{'x','x'},{'x' 'x'};...    % Test 59
                 {'Burner','Total'},{'Slug 2','Slug 3','Cable 22','Cable 23'},{'Slug 4','Slug 5','Cable 24','Cable 25'},{'x','x'},{'x' 'x'};...    % Test 60
                 {'Burner','Total'},{'Slug 4','Cable 28'},{'Slug 5','Cable 29'},{'Slug 20','Cable 35'},{'x' 'x'};...    % Test 61
                 {'Burner','Total'},{'Slug 17','Cable 23'},{'Slug 18','Cable 24'},{'Slug 19','Cable 25'},{'x' 'x'};...    % Test 62
                 {'Burner','Total'},{'Slug 8','Cable 23'},{'Slug 9','Cable 24'},{'Slug 10','Cable 25'},{'x' 'x'};...    % Test 63
                 {'Burner','Total'},{'Slug 12','Cable 32'},{'Slug 13','Cable 33'},{'Slug 15','Cable 34'},{'x' 'x'}};      % Test 64

y_axis_labels = {'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)';...
                 'Heat Release Rate (kW)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)' 'Temperature (°C)'};

y_max = {100 500 500 500 500;...      % Test 36
         100 500 500 500 500;...      % Test 37
         100 500 500 500 500;...      % Test 38
         100 500 500 500 500;...      % Test 39
         200 500 500 500 1000;...     % Test 40
         300 500 500 500 1000;...     % Test 41
         400 500 500 500 1000;...     % Test 42
         400 700 700 700 1000;...     % Test 43
         400 700 700 700 1000;...     % Test 44
         100 700 700 700 700;...      % Test 45
         100 600 600 500 500;...      % Test 46
         100 700 700 700 700;...      % Test 47
         100 600 600 500 500;...      % Test 48
         500 300 300 300 300;...      % Test 49
         600 200 200 200 200;...      % Test 50
         300 600 600 500 500;...      % Test 51
         300 800 800 800 800;...      % Test 52
         300 800 800 800 800;...      % Test 53
         300 700 700 700 700;...      % Test 54
         300 700 700 700 700;...      % Test 55
         300 600 600 500 500;...      % Test 56
         400 600 600 500 500;...      % Test 57
         400 600 600 500 500;...      % Test 58
         300 600 600 500 500;...      % Test 59
         300 800 800 800 800;...      % Test 60
         300 800 800 800 800;...      % Test 61
         300 600 600 500 500;...      % Test 62
         400 600 600 500 500;...      % Test 63
         400 700 700 700 700};        % Test 64

symbols = {'k-' 'k--' 'g-' 'm-' 'c-' 'b-'};

for j=36:64

   M  = importdata(['../DATA/Test_',num2str(j,'%1d\n'),'.csv'],',',2);

   for i=1:5
 
      if p{j-35,i}(1)==0 ; break ; end

      for ii=1:length(p{j-35,i})
         plot(M.data(:,1)/60,M.data(:,p{j-35,i}(ii)),symbols{ii}); hold on
      end

      if i>1 ; plot([t_ignition{j-35}/60 t_ignition{j-35}/60],[0 y_max{j-35,i}],'k--'); hold on ; end

      set(gca,'FontName',Font_Name)
      set(gca,'FontSize',Title_Font_Size)
      axis([0 t_end{j-35} 0 y_max{j-35,i}])
      text(.05,.90,['Experiment ' num2str(j,'%1d\n')],'FontName',Font_Name,'FontSize',Label_Font_Size,'Interpreter',Font_Interpreter,'Units','normalized')

      xlabel('Time (min)','FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
      ylabel(y_axis_labels{j-35,i},'FontSize',Title_Font_Size,'Interpreter',Font_Interpreter)
      legend(legend_labels{j-35,i},'Location','SouthEast','FontSize',Legend_Font_Size);

      set(gcf,'Visible',Figure_Visibility);
      set(gcf,'Units',Paper_Units);
      set(gcf,'PaperUnits',Paper_Units);
      set(gcf,'PaperSize',[Paper_Width Paper_Height]);
      set(gcf,'Position',[0 0 Paper_Width Paper_Height]);
      print(gcf,'-dpdf',['../SCRIPT_FIGURES/Test_' num2str(j,'%1d\n') '_Plot_' num2str(i)])

      hold off

   end
end

