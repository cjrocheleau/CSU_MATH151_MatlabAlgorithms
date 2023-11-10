%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATH_151_Lab3
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 9/12/2023
%--------------------------------------------------------------------------
% Answer key for MATH-151 Lab 3 for the Fall 2023 semester
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear all; clc;

%% Task 1: Return of the Factorials

% See recursive_factorial.m for details, find 16!
recursive_factorial(16)

%% Task 2: What's Your Sine

% a) It uses fewer terms than most of you probably think! 10 at most!

% b) and c) See taylor_sine.m for details on implementation
x = -pi:0.1:pi;

figure();
plot(x, sin(x), 'k-','linewidth',5); % Plot built in sine
hold on; axis tight; grid on;
plot(x, taylor_sine(x, 3), 'b.--', 'markersize',20); % Plot 3 term taylor approx
plot(x, taylor_sine(x, 5), 'r.--', 'markersize',20); % Plot 5 term taylor approx
legend('Built-in','3 Term Taylor','5 Term Taylor','location','NorthWest');
title('Taylor Approximations of sin(x)','fontsize',18);
xlabel('x','fontsize',18,'fontweight','b');
ylabel('sin(x)','fontsize',18,'fontweight','b');
set(gca,'fontsize',14)
