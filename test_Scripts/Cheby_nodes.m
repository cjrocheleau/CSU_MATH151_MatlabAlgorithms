%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cheby_Nodes
%--------------------------------------------------------------------------
% An example of Runge's function showing the limitations of polynomial
% interpolation with uniform nodes. And the value of Chebyshev nodes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X = -5:1:5; Y = 1./(1+X.^2);
x = -5:0.1:5; y = NaN(size(x));
p = polyfit(X,Y,length(X)-1);
y = polyval(p,x);
% for ii = 1:length(x)
%     tempy = 0;
%     for jj = 1:length(X)
%         tempX = X; tempX(jj) = [];
%         tempY = Y; tempY(jj) = [];
%         tempy = tempy + Y(jj)*prod(x(ii) - tempX)/prod(X(jj)- tempX);
%     end
%     y(ii) =  tempy;
% end
chebyX = 5*cos((2*(1:length(X))-1)/(2*length(X))*pi);
chebyY = 1./(1+chebyX.^2);
chebyp = polyfit(chebyX, chebyY, length(chebyX)-1);
chebyy = polyval(chebyp,x);
% chebyy = NaN(size(x));
% for ii = 1:length(x)
%     tempy = 0;
%     for jj = 1:length(X)
%         tempX = chebyX; tempX(jj) = [];
%         tempY = chebyY; tempY(jj) = [];
%         tempy = tempy + chebyY(jj)*prod(x(ii) - tempX)/prod(chebyX(jj)- tempX);
%     end
%     chebyy(ii) =  tempy;
% end

figure()
subplot(1,2,1)
plot(X,Y,'bo-')
hold on; ylim([-1 2]);
plot(x,y,'r-')
subplot(1,2,2)
plot(chebyX,chebyY,'bo-')
hold on; ylim([-1 2]);
plot(x,chebyy,'r-')