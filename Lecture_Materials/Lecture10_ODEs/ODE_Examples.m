%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ODE_Examples
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 10/9/2023
%--------------------------------------------------------------------------
% Ordinary differential equation solver examples for the Fall 2023 MATH 151
% course. Shows examples of the following algorithms
%   - Backward Euler Method
%   - Forward Euler Method
%   - Fourth-Order Runge-Kutta
% and the following specific cases
%   - Initial Value Problems
%   - Shooting Method for Boundary Value Problems
%   - Solutions for Second-Order ODEs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


close all; clear all; clc;

%% Example 1: Exponential Growth
% Set up time grid
h = 0.25;
t = 0:h:10;
y_true = exp(t/2);

% Find Backward Euler to f' = f/2
y_BE = ones(size(t));
for n = 2:length(t)
    y_BE(n) = y_BE(n-1) + h*y_BE(n-1)/2;
end

% Plotting our Solution Compared to Truth
figure();
plot(t, y_BE, 'b.-','linewidth',2,'markersize',25);
hold on; grid on; ylim([0 225])
set(gca,'fontsize',14,'fontweight','b')
ylabel('y(t)')
xlabel('t');
title('Backward Euler Solution to y''(t)=y(t)/2')

figure();
plot(t, y_true, 'r-','linewidth',5);
hold on; grid on; ylim([0 225])
set(gca,'fontsize',14,'fontweight','b')
ylabel('y(t)')
xlabel('t');
plot(t, y_BE, 'b.-','linewidth',2,'markersize',25);
title('Backward Euler Solution to y''(t)=y(t)/2')


% Find Forward Euler Solutions to f' = f/2
y_FE = ones(size(t));
for n = 2:length(t)
    % Update with a Backward Euler guess
    y_FE(n) = y_FE(n-1) + h*y_FE(n-1)/2;
    temp = Inf;

    % We solve nonlinear equation 0 = f_n - (f_(n-1) + h*f_n / 2) 
    while abs(y_FE(n) - temp) > 0.001
        temp = y_FE(n);
        y_FE(n) = y_FE(n) - (y_FE(n) - h*y_FE(n)/2 - y_FE(n-1))/(1 - h/2);
    end
end

% Plotting our Solution Compared to Truth
figure();
plot(t, y_true, 'r-','linewidth',5);
hold on; grid on; ylim([0 225])
set(gca,'fontsize',14,'fontweight','b')
ylabel('y(t)')
xlabel('t');
plot(t, y_FE, 'b.-','linewidth',2,'markersize',25);
title('Forward Euler Solution to y''(t)=y(t)/2')

% Find Runge-Kutta 4th Order Solutions to f' = f/2
y_RK4 = ones(size(t));
for n = 2:length(t)
    k1 = y_RK4(n-1)/2;
    k2 = (1/2)*(y_RK4(n-1) + (h/2)*k1);
    k3 = (1/2)*(y_RK4(n-1) + (h/2)*k2);
    k4 = (1/2)*(y_RK4(n-1) + h*k3);

    y_RK4(n) = y_RK4(n-1) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
end

% Plotting our Solution Compared to Truth
figure();
plot(t, y_true, 'r-','linewidth',5);
hold on; grid on; ylim([0 225])
set(gca,'fontsize',14,'fontweight','b')
ylabel('y(t)')
xlabel('t');
plot(t, y_RK4, 'b.-','linewidth',2,'markersize',25);
title('Runge-Kutta 4 Solution to y''(t)=y(t)/2')

%% Example 2: Shooting Method with Bubble Equation
% Let's see if shooting method works well for the minimal volume of
% revolution
% This solves the following BVP
% u'' = (1 + u'^2) / u
% u(0) = alpha, u(L) = beta

L = 10; 
alpha = 10; beta = 7;

% Break up into discrete length steps and run
dx = 0.05;          % Spacial Step
X = 0:dx:L;         % Create our x grid
u = inf(size(X));   % Initialize u as infinity so we enter while loop

% Initialization for Secant method
nIts = 1; 
slopeleft = (beta-alpha); sloperight = 0; % Initial Slope guesses

% Plot Setup
figure(); hold on; axis equal;
plot([0 0 NaN L L],[-1 alpha NaN -1 beta],'ko-','linewidth',5,'markersize',20);
set(gca,'fontsize',16); title('Shooting Method Example')
xlabel('Distance'); ylabel('Radius'); 
ylim([0 12]);

while abs(u(end) - beta) > 0.001 && nIts < 1000
    % Initialize forward solver and hope it satisfies BVP
    u(1)   = alpha;       % Initial Height
    if nIts == 1
        uprime0 = sloperight; % Initial Guess straight line
    elseif nIts == 2
        up0_last = uprime; 
        err_last = u(end) - beta;
        uprime0  = slopeleft;  % Second Guess line to 0
    else
        % Try to Guess next point using Secant Method
        err  = u(end) - beta;
        temp = uprime0 - err*((uprime0 - up0_last)/(err - err_last));

        up0_last = uprime0;
        err_last = err;
        uprime0  = temp;
    end
    
    uprime = uprime0; % Uprime doesn't have to be a vector but we need to be careful with it
    
    % Solve Using RK4
    % Because we have a second-order DE we need to split it into pieces
    % We define u' = v
    % This transforms our u'' into v' = (1 + v^2) / u 
    % This means we are solving two related ODES using RK4
    for iStep = 2:length(X)
        k1 = (1 + uprime^2)/u(iStep - 1); % v' = (1 + v^2) / u 
        l1 = uprime;                      % u' = v
       
        % Be careful with updates, this is helpful to write out
        % The ks update our v = u'
        % The ls update our u
        k2 = (1 + (uprime + dx/2*k1)^2)/(u(iStep - 1) + dx/2*l1);
        l2 = uprime + dx/2*k1;

        k3 = (1 + (uprime + dx/2*k2)^2)/(u(iStep - 1) + dx/2*l2);
        l3 = uprime + dx/2*k2;

        k4 = (1 + (uprime + dx*k3)^2)/(u(iStep - 1) + dx*l3);
        l4 = uprime + dx*k3;
        
        uprime   = uprime     + (dx/6)*(k1 + 2*k2 + 2*k3 + k4);
        u(iStep) = u(iStep-1) + (dx/6)*(l1 + 2*l2 + 2*l3 + l4);
    end
    
    % Update iteration number to make secant guesses work correct
    nIts = nIts + 1;
    
    plot(X,u,'-','linewidth',2);
    pause(1); % put a short pause in so we can see them get plotted as a movie!
end

% Delete off all of the Intermediate plots and just show the final solution
int_plots = get(gca, 'children');
delete(int_plots(1:end-1));
plot(X,u,'c-','linewidth',5);
