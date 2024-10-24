%Noy Levi, 208753160
%R2024a

% Defining the following variables as parameters for the simulation
world_size = 30;
n_seeds = 1;
prob_infection = 0.03; % chances of infecting a neighbor cells
prob_death = 0.02; % chances of dying while sick
days_to_incubate = 14; % days infected before becoming sick and hospitalized
days_to_recover = 40;
max_days_to_simulate = 1000;

% Creating a structure to store all these parameters for convenient passing to the main function
parameter_structure = struct('world_size', world_size, 'n_seeds', n_seeds, 'prob_infection', prob_infection, 'prob_death', prob_death, 'days_to_incubate', days_to_incubate, 'days_to_recover', days_to_recover, 'max_days_to_simulate', max_days_to_simulate);

% calling the epidemiology_model function (the main function), while using the parameter_stracture
epidemiology_model (parameter_structure);