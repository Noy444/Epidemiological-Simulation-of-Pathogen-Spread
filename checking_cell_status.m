%Noy Levi, 208753160
%R2024a

% Function to update the status of each cell (individual) in the world based on its neighbors
function [world, sick_days] = checking_cell_status (sick_days, world, world_size, prob_infection, prob_death, days_to_incubate, days_to_recover)
%% finding all the sick cells in the world
[rows, cols] = find(world == 1);

%% Iterate through each infected individual to update their status and potentially spread the infection to their neighboring cells
for infected_idx = 1:length(rows)
    % Defining the relevant sick cell
    r_infected = rows(infected_idx);
    c_infected = cols(infected_idx);

    % updating the sick days for the sick cell
    sick_days(r_infected, c_infected) = sick_days(r_infected, c_infected) + 1;

    % Note: I was debating whether a person can infect others only after the incubation period or also during it.
    % Based on the internet, it seems that a person can be contagious even during the incubation period.
    % Therefore, in this model, a person can infect others from the moment he is infected.

    % Checking if the sick cell should become immunized or die; if so, it can no longer infect others and the loop will move on to the next iteration.
    if sick_days(r_infected, c_infected) >= (days_to_incubate + days_to_recover)
        world(r_infected, c_infected) = 2; % becoming immunized
        continue;
    % According to the instructions, the risk of death only applies once a person becomes ill.
    % Thus, it is only considered after the incubation period has ended.
    elseif (sick_days(r_infected, c_infected) >= days_to_incubate) && (rand < prob_death)
        world(r_infected, c_infected) = -1; % becoming dead
        continue;
    end

    % Defining the eight neighbors of each cell
    neighbors_deltas = [-1 0; 1 0; 0 -1; 0 1; -1 1; 1 -1; -1 -1; 1 1];
    for neighbors_offsets_idx = 1:size(neighbors_deltas, 1)
        r_neighbor = r_infected + neighbors_deltas(neighbors_offsets_idx, 1);
        c_neighbor = c_infected + neighbors_deltas(neighbors_offsets_idx, 2);

        % Ensure the simulated world is a round, borderless world.
        % This wraps the row index (r_neighbor) around to the other side if it goes out of bounds.
        switch r_neighbor
            case 0
                r_neighbor = world_size; % If the row index is 0, wrap it to the last row
            case (world_size + 1)
                r_neighbor = 1; % If the row index exceeds the world size, wrap it to the first row
        end
        % This wraps the column index (c_neighbor) around to the other side if it goes out of bounds.
        switch c_neighbor
            case 0
                c_neighbor = world_size; % If the column index is 0, wrap it to the last column
            case (world_size + 1)
                c_neighbor = 1; % If the column index exceeds the world size, wrap it to the first column
        end

        % Applying infection probability on healthy neighbors
        if world(r_neighbor, c_neighbor) == 0 && rand < prob_infection
            world(r_neighbor, c_neighbor) = 1; % becoming sick
            sick_days(r_neighbor, c_neighbor) = 1; % initializing sick days for a newly infected neighbor
        end
    end
end
end