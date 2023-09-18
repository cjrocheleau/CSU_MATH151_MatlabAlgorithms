%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% InterpTest.m
%--------------------------------------------------------------------------
% MATH-151 Quick Test script to see interpolation in practice
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Let's do Runge's Function
x = -1:0.01:1; y = 1./(1 + 25*x.^2);

% Define number of interpolation points and desired X points

X = -1:0.01:1; 

% Do Uniform spacing with Lagrange Method
numPts = 21;
unifx = linspace(-1, 1, numPts);
unify = 1./(1 +  25*unifx.^2);
unifY = lagrange_interp(unifx, unify, X);

% Now do Chebyshev spacing with Newton's divided difference
chebx = cos(pi*(2*(1:numPts) - 1)/(2*numPts));
cheby = 1./(1 + 25*chebx.^2);
chebY = Newton_DD(chebx, cheby, X);

% Plot
figure()
htruth = plot(x,y,'k-','linewidth',2);
hold on;
plot(unifx, unify,'bo'); 
hunif = plot(X, unifY, 'b-');
plot(chebx, cheby, 'ro');
hcheby = plot(X, chebY,'r-');

legend([htruth, hunif, hcheby],{'Truth','Uniform Spacing','Chebyshev Points'});

% %% Lets compare with Matlab's built in polyfit function
% matlab_p_unif  = polyfit(unifx, unify, numPts-1);
% matlab_unifY   = polyval(matlab_p_unif, X);
% 
% matlab_p_cheb  = polyfit(chebx, cheby, numPts-1);
% matlab_chebY   = polyval(matlab_p_cheb, X);
% 
% % Plot
% figure()
% plot(x,y,'k-','linewidth',2);
% hold on;
% plot(unifx, unify,'bo'); 
% plot(X, matlab_unifY, 'b-');
% plot(chebx, cheby, 'ro');
% plot(X, matlab_chebY,'r-');