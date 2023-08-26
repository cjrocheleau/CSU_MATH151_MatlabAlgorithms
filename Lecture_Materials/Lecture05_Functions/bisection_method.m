%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bisection_method.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 8/22/23
%--------------------------------------------------------------------------
% This function will perform bisection method solving 
% x^2 - x - 12 - 5*cos(pi*x) = 0
% in order to show an example of a recursive function, an optional variable 
% and a secondary function embedded in the definition of a larger function
%--------------------------------------------------------------------------
% INPUTS
%   left: Left side of region considered by bisection method
%   right: Right side of region considered by bisection method
%   tol: {Optional} Tolerance before accepting output as our estimation of
%       the root 
%--------------------------------------------------------------------------
% OUTPUTS
%   root: Estimate of the root of function x^2 - x - 12 - 5*cos(pi*x)
%--------------------------------------------------------------------------
% REVISION HISTORY
% 8/22/23 C Rocheleau: Initial Creation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function root = bisection_method(left, right, tol)
    % If the user does not provide tol, fill it with default choice
    if nargin == 2  % nargin = "number of arguments in" or number of inputs given
        tol = 1/1000;
    end
    
    % For fun, let's plot the search area and see what it does
    x = -10:1e-4:10;
    plot(x([1 end]), [0, 0], 'k-','linewidth',2);
    xlim([-10 10]); ylim([-20 100]);
    grid on; 
    hold on;
    plot(x, x.^2 - x - 12 - 5*cos(pi*x),'linewidth',2)
    plot(left*[1 1] , ylim ,'b-','linewidth',2)
    plot(right*[1 1], ylim ,'r-','linewidth',2)
    plot(((left+right)/2)*[1 1] , ylim ,'k--','linewidth',2)
    pause(1);
    hold off;


    % Check if this is a value bisection method
    F_left  = fun(left);
    F_right = fun(right);
    if sign(F_left) == sign(F_right)  % Both endpoints have the same sign, not necessarily a zero between
        disp('Left and Right sides have same sign, invalid for bisection method')
        root = []; %Set root as empty matrix and exit function
        return;
    end
    
    % Find middle of region and its function value
    middle   = (left + right)/2;
    F_middle = fun(middle);

    % Check value of middle function value and act accordingly
    if abs(fun(middle)) < tol
        % Set root to middle and 
        root = middle;
    elseif sign(F_left) == sign(F_middle)  % Left and middle have same sign
        % Set middle to new left endpoint and call bisection method on new range
        left = middle;
        root = bisection_method(left, right, tol);
    elseif sign(F_right) == sign(F_middle)  > 0 % Right and middle have same sign
        % Set middle to new left endpoint and call bisection method on new range
        right = middle;
        root = bisection_method(left, right, tol);
    end
end % Function needs an end to create a new subfunction

function y = fun(x)
    y = x^2 - x - 12 - 5*cos(pi*x);
end