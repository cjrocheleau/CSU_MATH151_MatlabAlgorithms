%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% recursive_factorial.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 9/12/2023
%--------------------------------------------------------------------------
% This function is part of the answer key for lab 3 of the Fall 2023 MATH
% 151 class at CSU. Computes the factorial of some number n using a
% recursive relationship.
%--------------------------------------------------------------------------
% INPUTS
%   n: Integer representing the number who's factorial we want to compute
%--------------------------------------------------------------------------
% OUTPUTS
%   nfact: The output for n!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function nfact = recursive_factorial(n)
    % Make sure the input is a nonnegative integer
    if n ~= round(n) || n < 0
        nfact = NaN;
        beep; warning('Factorial needs to be nonnegative integer, check inputs')
        return; % Exit function with NaN as output
    end

    % Check if we have reached our base case of 0!=1
    if n == 0
        nfact = 1;
    else % Otherwise we use the recusive relationship to say n! = n(n-1)!
        nfact = n * recursive_factorial(n-1);
    end
end