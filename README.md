# Epidemiological Simulation of Pathogen Spread

This project implements an epidemiology model by Matlab that tracks the spread of a pathogen in a population. The simulation monitors infection progression, recovery, and mortality within a structured environment. Key statistics and plots are generated to visualize the spread of the virus over a set period of time.

## Project Description

The epidemiology model simulates the spread of a virus from one or more initial "seed" infections. As time progresses, the virus spreads to neighboring cells with a set probability. Infected individuals eventually become sick, and after a defined incubation period, they are hospitalized. Over time, they either recover, gaining immunity, or die from the disease.

The simulation produces the following outputs:
- **Status Plot**: A graphical representation of the infection status (healthy, sick, immunized, dead) across the population.
- **Sickness Tracking Plot**: Displays the number of days each individual has been sick.
- **Daily Summary Plot**: Summarizes the daily number of dead, infected, recovered, and immunized individuals, as well as the mortality rate.

## Usage

1. Initialize the simulation by setting the parameters in the structure defined within the `main.m` script. Key parameters include:

   ```matlab
   % Parameters example
   params.world_size = 30;          % Size of the simulated world (e.g., 30x30 grid)
   params.n_seeds = 1;              % Number of initial infected individuals
   params.prob_infection = 0.03;    % Probability of infection spreading to a neighboring cell
   params.prob_death = 0.02;        % Daily probability of death while sick
   params.days_to_incubate = 14;    % Days before an infected person becomes sick
   params.days_to_recover = 40;     % Number of days a person remains sick before recovery or death
   params.max_days_to_simulate = 1000;  % Maximum number of simulation days

2. Run the simulation by executing:

  ```matlab
  % Run the main function
  main(params);

3. The output will generate three plots:
   - Infection status across the population.
   - Days sick per individual.
   - Daily summary statistics including mortality rate.

4. A movie will also be generated to visualize the spread of infection over time.

## Code Structure

- `initializing_world.m`: Initializes the simulation environment, including the placement of infection seeds and the boundaries.
- `checking_cell_status.m`: Evaluates the status of each cell (healthy, infected, immunized, or dead).
- `computing_stats.m`: Computes daily statistics including the number of dead, sick, recovered, and immunized individuals.
- `generating_plots.m`: Generates plots to visualize the simulation results.
- `epidemiology_model.m`: Core simulation logic to run the epidemiology model.
- `the_structure.m`: Defines the structure of the simulation parameters.
