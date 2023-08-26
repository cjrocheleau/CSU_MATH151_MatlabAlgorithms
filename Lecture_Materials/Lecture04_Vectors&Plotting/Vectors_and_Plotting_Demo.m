%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vectors and Plotting_Demo.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 8/19/2023
%--------------------------------------------------------------------------
% This script will show off some examples of vectors and common used in
% Matlab. This includes generating and fetching elements from a vector,
% updating a vector in a loop, and lastly plotting a vector. The plotting
% will show off some aesthetic options for making a legible plot!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
% Now that we have the tools I'll talk about what each of these commands
% do. I usually put them at the beginnning of scripts to make sure
% everything is fresh
close all; % Closes all plots, so no old plots get in the way
clear all; % Clears all variables, so we don't get unintended values
clc;       % Clears command window, so the command window only shows us what this script is showing

%% Vector Samples
% Vector of all Zeros
zeros(1,5)

% Vector of all ones, and vector of all 24s
ones(1,7)
24*ones(1,6)

% Generate a Uniformly spaced vector
% If we're given end points and a step size
a = 2; b = 5; step_size = 0.5;
x = a:step_size:b 

% If we're given end points and a number of desired points
a = 2; b = 5; N = 6;
x = linspace( a, b, N)

% Random Vectors
rand(1,5)   % 5 Uniformly distributed values between 0 and 1

randn(1,5)  % 5 Normally distributed values from standard normal

heights = 5*randn(1,5) + 68 % 5 Normally distributed values with mean of 68 and standard deviation of 5

%% Vector Arithmetic and Use 
x = [5 4 8 1];

% Pulling out specific elements from a vector
x(1)
x(3)
x(end) % We can even ask Matlab for the final value!


% Scalar multiplication and addition
x + 2
3*x

% Element-wise addition or multiplication with a vector of the same size
y = [1 2 3 4];
x + y
x.*y 

% Finally we perform some funtions on a vector
x = [0 1 2];

exp(x)
log(x)
sin(pi*x)
x.^2

% The length function is very useful, it tells us how long the vector is!
N = length(x)

%% Median of a set of data values 
% I teased this in the lecture slides last week, now that we know how to
% use vectors we can look at it in detail

% Give a set of data values 
data_values = [25 48 3 13 100 62 78];  
data_values = sort(data_values);        % Reorganizes vector in increasing order
L           = length(data_values);      % How many values are there

if L/2 == round(L/2)  % Check if L is even
    % if L is even, average the center two terms (Index L/2 and L/2 + 1)
    median = (data_values(L/2) + data_values(L/2 + 1)) / 2;
else
    % if L is odd, take the center value (Index L/2)
    median = data_values(ceil(L/2));
end
display(median)

%% Fibonacci Sequence
% This is a good example of showing how we can mix vectors together with
% out for loops and if ... else ... statements.
% In the Fibonacci sequence, we start with 1 and 1, and then the next
% number is given by the sum of the two that came before it. It looks like 
% 1, 1, 2, 3, 5, 8, 11, ...
% We'll calculate the first N terms then plot them

% How many terms do we want?
N = 10;

% Preallocate our vector as all zeros (this step isn't necessary but it
% speeds things up when vectors get VERY large, so is good practice)
fib_seq = zeros(N,1);   % A row vector of N zeros to start with

% If N is 1 or 2, we already have the answer!
for ii = 1:length(fib_seq)  % I like to use the length of my vector for the max iteration in case I ever want to change the vector
    if ii == 1 || ii == 2   % Terms 1 and 2 have special rules (both are set to 1)
        fib_seq(ii) = 1;
    else                    % For everything else, add the last 2 terms
        fib_seq(ii) = fib_seq(ii-2) + fib_seq(ii-1);
    end
end

% Now let's make a plot of the sequence!
figure();               % Open up a new plot window
plot(fib_seq, 'bo');   % plot as blue circles with lines between them

% Lets put a grid on this
grid on;

% Label our plot and axes
title('First 10 Terms of Fibonacci Sequence','fontsize',18);
xlabel('N',  'fontweight','bold','fontsize',18);
ylabel('X_N','fontweight','bold','fontsize',18);
% This is higher level than this class, its changing properties of the axis
% directly. I just want to show it to show you have a lot of freedom in
% plotting!
set(gca,'fontsize',14,'XTick',1:10)  

%% Vectors as functions and plotting multiple lines on an axis
% Sequences are one way to think about functions, but we can also think of
% functions as a type of discrete equivalent of functions. Let's look at
% how we can use functions to quickly calculate and plot the sine and
% cosine functions

% First, let's create a vector of our desired x values
x = -pi:0.1:pi; % Vector from -pi to pi using steps of 0.1
y = x.^3 - 2*sin(pi*x) + 1;     % Matlab knows when sine gets a vector, to take the sine of each element

% Plot it
figure();
plot( x, y, 'rx:'); % Plot sine as a magenta dotted line with x at each point

% Clean up and make it look nice
grid on;            % adds a grid
xlim([-2 2]);       % This sets the plot to only show us x from -2 to 2
ylim([-10 10]);     % This sets the plot to only show us y from -10 to 10

% Label the axes appropriately
xlabel('Time (s)');
ylabel('Position (ft)');
title('Good Lookin Plot!')

% Now lets plot sine of pi*x on the same plot
hold on;                 % This tells Matlab to hold onto everything on the current plot
plot( x, sin(pi*x), 'k-'); % For simple functions we can just put them right into the plot function

legend('x^3 +-2sin(pi*x) + 1', 'sin(pi*x)') % label the plots in the order you made them to label it correctly


