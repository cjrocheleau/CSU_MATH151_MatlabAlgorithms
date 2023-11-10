%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATH_151_Lab2
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 9/6/2023
%--------------------------------------------------------------------------
% Answer key for MATH-151 Lab 2 for the Fall 2023 semester
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear all; clc;

%% Task 1: Moving Average

% Part a, let's generate and plot the ground truth
% Create our time vector
start_time = 0; end_time   = 10;
time_step  = 0.1;
time = start_time:time_step:end_time;

% Calculate and plot our ground truth
y = 450 + 30*time - 9.8*(time.^2); % Don't forget the .^
figure();
GTplot = plot(time, y, 'b.-','linewidth',2); % Store handle for legend (not needed)
hold on; 

% Part b, generate and plot noisy measurements
ytilde   = y + 25*randn(size(y));
Measplot = plot(time, ytilde,'r*','markersize',5); % plot big red stars

% Part c, Calculate Smoothed measurements and plot
ybar = zeros(1, length(y));
for n = 1:length(ybar)
    % Special cases for 1 and 2 before we have 3 points
    if n == 1
        ybar(n) = ytilde(n);
    elseif n == 2
        ybar(n) = (ytilde(n) + ytilde(n-1))/2;
    else
        % 3 point running average
        ybar(n) = (ytilde(n) + ytilde(n-1) + ytilde(n-2))/3;
    end
end
Smoothplot = plot(time, ybar, 'k:','linewidth',2); % plot wide black dotted line

% Part d, Labeling and Making it look good
grid on;                                              % Turn on Grid
set(gca,'fontsize',14)                                % Bigger font              
xlabel('Time (s)','fontweight','b','fontsize',16);    % Set x-axis label
ylabel('Height (m)','fontweight','b','fontsize',16);  % Set y-axis label
title('MATH 151: Lab 2','fontsize',18);               % Add title
% I go overboard on making sure my legends are correct, you don't need to
% do this much. I've just been bitten by mislabeled legends before and like
% to be very clear with Matlab what I want and expect.
legend([GTplot, Measplot, Smoothplot],{'Ground Truth','Measurements','Smoothed'},'location','SouthWest');
