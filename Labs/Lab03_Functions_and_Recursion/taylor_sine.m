%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% taylor_sine.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 9/12/2023
%--------------------------------------------------------------------------
% This function is part of the answer key for lab 3 of the Fall 2023 MATH
% 151 class at CSU. Computes the sine of some x for using N terms in the
% Taylor series expansion
%--------------------------------------------------------------------------
% INPUTS
%   x: Vector of values to compute sin(x)
%   N: Integer representing the number of Taylor series terms we want to
%   use
%--------------------------------------------------------------------------
% OUTPUTS
%   y: Taylor series approximation of sin(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function y = taylor_sine( x, N)
% Calculation will only be good if x is between [-pi,pi] so we shift
% using Matlab's built in wrap to pi function
x = wrapToPi(x);

y = zeros(size(x));     % Preallocate our output vector

% We could do this using vector arithmetic, but I'll show off nested loops
% so we can see how this works
for iX = 1:length(x)    % Iterate across each input x
    for n = 1:N        % Iterate across Taylor series terms
        y(iX) = y(iX) + (-1)^(n-1)*x(iX)^(2*n-1)/recursive_factorial(2*n-1);
    end
end

end