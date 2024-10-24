%Noy Levi, 208753160
%R2024a

% Function to compute statistics for the current day and store them
function [all_stats] = computing_stats(world, day, all_stats)
%% Storing the current day statistics directly in all_stats
all_stats(day).day = day;
all_stats(day).num_dead = sum(world(:) == -1); % Count dead individuals
all_stats(day).num_healthy = sum(world(:) == 0); % Count healthy individuals
all_stats(day).num_infected = sum(world(:) == 1); % Count infected individuals
all_stats(day).num_immunized = sum(world(:) == 2); % Count immunized individuals

%% Computing the mortality rate
% Note: I wasn't certain whether the mortality rate should be calculated as the number of dead people on that day divided by the number of sick people on that day,
% or as the cumulative number of dead people up to that day divided by the cumulative number of sick people up to that day. 
% So, I used the first approach in this function.

if all_stats(day).num_infected > 0
    all_stats(day).mortality_rate = all_stats(day).num_dead / all_stats(day).num_infected;
else
    all_stats(day).mortality_rate = 0; % Avoiding division by zero while there is no sick people in the world
end

end