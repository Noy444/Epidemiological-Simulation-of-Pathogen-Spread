%Noy Levi, 208753160
%R2024a

% Function to initialize the world and place the initial infected seeds
function world = initializing_world(world_size, n_seeds)
%% initializing a healthy population (marking as "0")
world = zeros(world_size, world_size);

%% adding seeds (marking as "1")
% If there is only one seed, setting it at the “center” of the population
% otherwise, setting them randomly
if n_seeds == 1
    world(round(world_size/2),round(world_size/2)) = 1;
elseif n_seeds > 1
    for seeds_idx = 1:n_seeds
        world(randi([1, world_size]), randi([1, world_size])) = 1;
    end
else
    error('no seeds of the pathogen are in the population.') % Error if no seeds are provided
end
end