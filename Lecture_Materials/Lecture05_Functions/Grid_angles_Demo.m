%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid_angles_Demo
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 8/24/2023
%--------------------------------------------------------------------------
% This script is a quick example of a nested loop that will calculate the
% angle (in degrees) of each point on an (x,y) grid and plots them
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear all; clc;

% Create Grid points and preallocate grid
x = -10:1:10; y = -50:2:50;
angles = zeros(length(y), length(x)); % Matrices are row x column so its a little backward

for iX = 1:length(x)        % Iterate over x values
    for iY = 1:length(y)    % Iterate over y values for the same x value
        angles(iY,iX) = atan2d(y(iY), x(iX));
    end
end

% There are a few different ways to display it

% As a surface plot
figure()
surf(x,y,angles);
title('Angle from Origin as Surface')
xlabel('X'); ylabel('Y')
colorbar;

% As a "Heatmap"
figure()
pcolor(x,y,angles);
title('Angle from Origin as Heatmap')
xlabel('X'); ylabel('Y')
colorbar;

% As a Scatterplot
figure()
[scattX, scattY] = meshgrid(x,y); % This translates x and y from vectors into matrices
scatter(scattX(:), scattY(:), 5, angles(:), 'filled');
title('Angle from Origin as Colored Scatterplot')
xlabel('X'); ylabel('Y')
colorbar;
