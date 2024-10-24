%Noy Levi, 208753160
%R2024a

% Function to generate plots visualizing the world status, sickness progression, and statistics
function generating_plots(world, sick_days, all_stats, day)
%% writing a title for the whole figure
txt = ['Results after ',num2str(day), ' days']; % Display the results after a certain number of days
sgtitle(txt);

%% Left panel: current world status
p1 = subplot(1, 3, 1);
imagesc(world); % Display the world matrix
clim([-1 2]); % Set color limits to cover all categories (-1: dead, 0: healthy, 1: sick, 2: immunized)
colormap(p1, parula); % Set color map for this panel 
colorbar('Ticks', [-1, 0, 1, 2]); % Display color bar with labeled ticks
title('Current world status'); % Set title for this panel
axis square;

%% Middle panel: number of days each person is sick
p2 = subplot(1, 3, 2);
imagesc(sick_days); % Display the sick_days matrix
colormap(p2, summer); % Set differnt color map this panel
colorbar; % Display color bar
title('Number of days sick'); % Set title for this panel
axis square;

%% Right panel: summarizing stats and mortality rate
subplot(1, 3, 3);
% Extracting relevant data for the following plot
days = [all_stats.day];
num_dead = [all_stats.num_dead];
num_infected = [all_stats.num_infected];
num_immunized = [all_stats.num_immunized];
mortality_rate = [all_stats.mortality_rate];

yyaxis left; % Plot on the left y-axis
hold on;
plot(days, num_dead, '-', 'LineWidth', 1.5, 'DisplayName', 'Dead'); % Plot number of dead individuals
plot(days, num_infected, '--', 'LineWidth', 1.5, 'DisplayName', 'Infected'); % Plot number of infected individuals
plot(days, num_immunized, ':', 'LineWidth', 1.5, 'DisplayName', 'Immunized'); % Plot number of immunized individuals
% Note: "Recovered" and "Immunized" represent the same group in the population, so only "Immunized" is displayed in this plot.
ylabel('People'); % Label for the left y-axis

yyaxis right; % Plot on the right y-axis
plot(days, mortality_rate, '-r', 'LineWidth', 1.5, 'DisplayName', 'Mortality rate'); % Plot mortality rate
ylabel('Mortality rate'); % Label for the right y-axis

xlabel('Days'); % Label for the x-axis
legend('show', 'Location', 'eastoutside'); % Display a legend outside the plot
hold off;
axis square;

end