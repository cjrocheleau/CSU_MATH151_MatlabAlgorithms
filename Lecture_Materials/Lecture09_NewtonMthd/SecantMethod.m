%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SecantMethod.m
%--------------------------------------------------------------------------
% C Rocheleau, Colorado State University
% 9/19/23
%--------------------------------------------------------------------------
% This function will perform secant method method solving 
% x^2 - x - 12 - 3*cos(pi*x) = 0
% in order to show an example of a recursive function, an optional variable 
% and a secondary function embedded in the definition of a larger function
%--------------------------------------------------------------------------
% INPUTS
%   x: Initial Guess
%   tol: {Optional} Tolerance before accepting output as our estimation of
%       the root 
%--------------------------------------------------------------------------
% OUTPUTS
%   x: Estimate of the root of function x^2 - x - 12 - 3*cos(pi*x)
%--------------------------------------------------------------------------
% REVISION HISTORY
% 9/19/23 C Rocheleau: Initial Creation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x = SecantMethod(x, xold, tol)
    % If the user does not provide tol, fill it with default choice
    if nargin == 2  % nargin = "number of arguments in" or number of inputs given
        tol = 1/1000;
    end
    
    % For fun, let's plot the search area and see what it does
    % Uncomment this block for fun plots!
    X = -10:1e-4:10;
    plot(X([1 end]), [0, 0], 'k-','linewidth',2);
    xlim([0 10]); ylim([-20 100]);
    grid on; 
    hold on;
    plot(X, fun(X),'linewidth',2)
    zeroline  = plot([x - fun(x)*(x - xold)/(fun(x) - fun(xold)) x - fun(x)*(x - xold)/(fun(x) - fun(xold))], ...
                    [0 fun(x - fun(x)*(x - xold)/(fun(x) - fun(xold)))],'r*--','linewidth',2);
    secant   = plot([xold x], fun([xold x]),'b*--', 'linewidth',2);
%     pause;


    % Update using Newton's method
    while abs(fun(x)) > tol
        xtemp = x - fun(x)*(x - xold)/(fun(x) - fun(xold));
        xold = x; x = xtemp;

        set(secant,'xdata', [xold x],'ydata',fun([xold x]));
        set(zeroline,'xdata', [x - fun(x)*(x - xold)/(fun(x) - fun(xold)) x - fun(x)*(x - xold)/(fun(x) - fun(xold))], ...
                    'ydata',[0 fun(x - fun(x)*(x - xold)/(fun(x) - fun(xold)))]);
%         pause;
    end
end % Function needs an end to create a new subfunction

function y = fun(x)
    y = x.^2 - x - 12 - 3*cos(pi*x);
end