%Noy Levi, 208753160
%R2024a

% Main function to simulate the spread of a pathogen in a population.
% This function tracks the status of individuals over time and generates visualizations.

% Marks legend of the world matrix:
% 0 = healthy
% 1 = sick
% 2 = immunized
% -1 = dead

function epidemiology_model (parameter_structure)
%% initializing world, including adding seeds
world_size = parameter_structure.world_size;
n_seeds = parameter_structure.n_seeds;
world = initializing_world(world_size, n_seeds); 

%% Extract relevant parameters from the structure for the following functions
prob_infection = parameter_structure.prob_infection;
prob_death = parameter_structure.prob_death;
days_to_incubate = parameter_structure.days_to_incubate;
days_to_recover = parameter_structure.days_to_recover;
max_days_to_simulate = parameter_structure.max_days_to_simulate;

sick_days = zeros(world_size); % initializing sick_days matrix to track the number of days each individual has been sick
all_stats = []; % initializing an empty array to store statistics over time

%% initializing figure for real-time plotting
figure_handle = figure('Units', 'normalized', 'Position', [0, 0, 1, 1]); % Adjusting the figure to cover the entire screen

%% checking cells status & computing stats & generating plots - separately for each day
for day = 1:max_days_to_simulate
    [world, sick_days] = checking_cell_status(sick_days, world, world_size, prob_infection, prob_death, days_to_incubate, days_to_recover);
    [all_stats] = computing_stats(world, day, all_stats);
    clf(figure_handle); % Clear the current figure without closing it
    generating_plots(world, sick_days, all_stats, day);
    drawnow; % Update the figure window with the new plots
end

end