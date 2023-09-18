%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nested_gamblers_ruin.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 8/22/2023
%--------------------------------------------------------------------------
% This script will display a nested set of for loops in order to perform a
% series of 25 play gamblers ruin simulations across 10 plays of our gambling
% game to display use of nested for loops. This will also include a quick 
% example of a matrix so that we canshow different ways that 2-D plotting 
% can be performed.
%--------------------------------------------------------------------------

close all; clear all; clc;

% Lets set up how the game will work
initial_money = 10;     % Lets start with $10
num_plays     = 25;     % We will play 10 games in our simulation
num_sims      = 5;      % We'll do 5 simulations to compare
win_prob      = 0.45;   % Give the game a 45% win probability

% Lets track how much money is made in each game and the final total
final_money  = zeros(1,num_sims);
money_track  = zeros(num_plays, num_sims); % This is a matrix, 
                                           % its going to have a set of vectors 
                                           % lined up side-by-side

% When I have nested loops, I like to label the iterator with i followed by
% a description of what we are iterating
for iSim = 1:num_sims           % For example iSim represents which simulation is running
    money = initial_money;
    for iPlay = 1:num_plays     % iPlay is the number of times we have played our game this simulation
        if money <= 0               % Did we go broke? Game Over
            % Set Money to 0 and forego rest of simulation
            money = 0; 
            break;              % This tells matlab to end iPlay loop 
        elseif rand < win_prob      % WINNER!
            money = money + 1;
        else                        % LOSER :(
            money = money - 1;
        end
        money_track(iPlay, iSim) = money; % Update our matrix
    end
    final_money(iSim) = money;      % Save our final money before next sim
end

% What is the average amount of money we ended with?
mean(final_money)       % Computes mean value of the vector we input

% Create Plots of the Money history 
figure()
plot(1:num_plays, money_track,'o-');
xlabel('Game Number');
ylabel('Money Remaining')
grid on; 
xlim([1 num_plays]); ylim([0 20])