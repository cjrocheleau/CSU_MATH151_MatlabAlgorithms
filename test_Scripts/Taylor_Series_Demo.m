%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Taylor_Series_Demo
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 4/4/23
%--------------------------------------------------------------------------
% A little demo showing off Taylor Series expansions for e^x, sin(x), cos(x)
% and more!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Set Up
close all; clear all; clc;
color_ord = {'b-','r-','g-','c-','m-','y-'};

%% Zoom in on e^x
x = -1:0.1:1;   % Grid Points
n = 0:4;        % Polynomial Sizes

% Plot our true function first
iplots = 1;
figure();
handles(iplots) = plot(x, exp(x), 'k-','linewidth',5);
leg_str{iplots} = 'True e^x';

% Make the plots look good
grid on; hold on; set(gca,'fontsize',16); axis tight;
iplots = iplots + 1;

% Loop through polynomial orders
for in = n
    % This is it, this is the Taylor series computation
    Taylor_Approx = arrayfun(@(x) sum(x.^(0:in)./factorial(0:in)), x);
    
    % This is all to make things look pretty
    handles(iplots) = plot(x, Taylor_Approx, color_ord{iplots-1}, 'linewidth',2);
    leg_str{iplots} = [num2str(in) ,' Term Approx.'];

    iplots = iplots + 1;
end

% Add legend to plot
legend(handles, leg_str, 'location', 'NorthWest')