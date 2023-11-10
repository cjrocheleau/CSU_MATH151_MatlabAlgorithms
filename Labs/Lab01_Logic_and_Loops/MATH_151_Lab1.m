%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATH_151_Lab1
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 9/1/2023
%--------------------------------------------------------------------------
% Answer key for MATH-151 Lab 1 for the Fall 2023 semester
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear all; clc;

%% Task 1: Factorials and Gambling
% Part (a), Find # of possible orderings of 14 horses in Kentucky Derby
nKDHorses = 14;
nKDCombos = 1;  % Initialize at 1 combination, 0 horses can finish in 1 way

for ii = 1:nKDHorses
    nKDCombos = ii*nKDCombos;   % Every time we add a horse, we get ii times more possibilities
end

fprintf(['With ', num2str(nKDHorses),' horses there are ', num2str(nKDCombos), ' ways they can finish \n']);

% Part (b), How many horses are needed to have 1,000,000 or more possible
% finishes?
nHorses = 0; % Our race has 0 horses
nCombos = 1; % 0 horses finish in 1 ordering

while nCombos < 1000000
    nHorses = nHorses + 1;      % Add a new horse to the race
    nCombos = nCombos*nHorses;  % Update number of possible finishes
end

fprintf(['We need ', num2str(nHorses), ' horses to have over 1,000,000 possibilities \n']);

%% Task 2: Gambler's Ruin
% We start with $100 and play a game with 45% chance of winning until we
% are out of money

money  = 100;
nGames = 0;
while money > 0             % Keep playing while you have money
    nGames = nGames + 1;    % Count games played
    if rand < 0.45
        money = money + 1;  % Gain $1 on a win
    else
        money = money - 1;  % Lost $1 on a loss
    end
end

fprintf(['It took ', num2str(nGames),' games to lose all my money. \n'])