%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATH_151_Lab0
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 8/25/2023
%--------------------------------------------------------------------------
% Answer key for MATH-151 Lab 0 for the Fall 2023 semester
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear all; clc;

%% Task 1: Variables and Operations
ft2m = 0.3048; % Conversion factor from feet to meters

% Objects to convert
table_ft  = 2.5;
ladder_ft = 12;
chris_ft  = 5.67;

% Part (a)  Do the conversion
table_m  = table_ft*ft2m
ladder_m = ladder_ft*ft2m
chris_m  = chris_ft*ft2m

% Part (b) Chris on ladder
chris_on_ladder_m   = chris_m + ladder_m

% Part (c) How much taller is ladder than table
ladder_table_diff_m = ladder_m - table_m

% Part (d) Convert back to feet
room_m  = 4.8768;
room_ft = room_m/ft2m

% Part (d) Area of the "room"
area_ft = room_ft^2

%% Task 2: Help Utilities

% (a): The atan is the mathematical arctan function that accepts a ratio,
% y/x as its argument and gives an angle between [-pi/2, pi/2]. atan2 is
% the four-quadrant arctangent function, in that it accounts for the
% location of the (x,y) point and gives an appropriate angle in [-pi, pi]/
% For example, consider the difference between the points (-1,-1) and (1,1)
% atan(-1/-1) and atan(1/1) would both give us pi/4 as an answer, however 
% atan2(1,1) is pi/4 and atan2(-1,-1) is -3pi/4. This is especially helpful
% to know is something is "in front" of you or "behind" you.

% (b) atan2 gives the angle in radians, atan2d gives the angle in degrees