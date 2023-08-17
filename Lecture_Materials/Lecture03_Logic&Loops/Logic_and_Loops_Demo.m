%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Logic_and_Loops_Demo.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 8/12/2023
%--------------------------------------------------------------------------
% This script will show off some examples of logical statements in
% Matlab and some usage of if .. else .. statements.
% Afterwards, there are some examples introducing students to common usage 
% of for and while loops.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Introduction
% The double percentage signs indicate to Matlab to split the script into
% sections, one can run the sections one at a time using CTRL-Enter on a PC
% I personally don't sure sections often, but they have use and value.
close all; clear all; clc;
 
%% Logical Statements
% Lets see how Matlab represents a true and a false statement
this_is_F = 5 == 8
this_is_T = 5 <= 8

not_example = ~this_is_F                   % We expect this to be true
or_example  = this_is_F || this_is_T       % We expect this to be true
and_example = this_is_F && this_is_T       % We expect this to be false

% Lets look at the xor function
xor_example_T = xor( this_is_F, this_is_T)  % We expect this to be true
xor_example_F = xor(~this_is_F, this_is_T) % We expect this to be false

%% if .. else .. statements
% Lets define a number x. 
% If it is 0, we'll set it to 8675309
% If it is even, we'll multiply it by 10 
% If it is odd, we'll subtract 0.5 

x = 0; % Change this value and see what happens!

if x == 0                       % If x is 0, x is 0
    x = 8675309;
elseif x/2 == round(x/2)        % If x is even, x/2 will already be rounded
    x = 10*x;
else                            % If it is not 0 and not even, it is odd
    x = x - 0.5;
end

% Print the resulting x
display(x)

%% for Loops
% Lets look at what happens when we add together the first N positive
% integers. We can use a for loop starting at 1 and counting up to N adding
% up all of the numbers because we know where to begin and end

N = 10;                 % This is how many numbers to add up    
test_sum_forloop = 0;   % We make sure to give a starting point for the number we'll be adding up

% Here's the loop
for ii = 1:N        % For all numbers ii from 1 to N
    test_sum_forloop = test_sum_forloop + ii;
end

% There is actually a formula for this, its N*(N+1)/2, let's check our answer
expected_sum = N*(N + 1)/2;
display(test_sum_forloop)
display(expected_sum)

%% while Loops
% However, suppose we want to know how many numbers to add up before we
% reach 10,000. A for loop wouldn't work as well because we are trying
% to find when to end. This is a case for a while loop!

n = 0;                  % This is our iterator, it will count how many times we repeat the loop
test_sum_whileloop = 0; % Our variable to accumulate our sum

% Here's the loop
while test_sum_whileloop < 10000 % Continue running until we pass 1,000,000
    % Update n to count how many iterations we've done and add it on
    n = n + 1; 
    test_sum_whileloop = test_sum_whileloop + n;
end

% Let's see how many iterations it took, and confirm it is larger than 1,000,000
display(n)
n_term_sum = n*(n + 1)/2;
display(n_term_sum)

%% Putting it together
% Let's use what we learned to simulate a poll!
% We suppose approximately 11% of people are correct and like the Oxford Comma
% We can use a for loop and if statements to simulate a poll of 43 people

Npeople = 43;
NGood   = 0;    % We initiate a count of good people who like the Oxford Comma
NBad    = 0;    % We also initiate a counter of bad people who don't

p = 0.11;       % The probability someone likes the Oxford Comma

for iperson = 1:Npeople
    % rand generates a random number between 0 and 1
    % there is an 11% chance it is less than 0.11
    if rand < 0.11  
        NGood = NGood + 1;  % One more for the good team!
    else
        NBad  = NBad + 1;   % :(
    end
end
display(NGood)
display(NBad)