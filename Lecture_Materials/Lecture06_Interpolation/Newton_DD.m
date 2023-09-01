% Newton Divided Differences
%--------------------------------------------------------------------------

function [desy, coeffs] = Newton_DD(measx, measy, desx)
% Use Divided Differences to find coefficients for polynomial
coeffs = zeros(1,length(measx));
for iOrder = 1:length(measx)
    % Each order we go, we get one fewer divided difference
    temp = NaN(1,length(measx) - iOrder + 1);
    if iOrder == 1
        temp = measy;
    else
        for ii = 1:length(temp)
            temp(ii) = (divDiffs(ii+1) - divDiffs(ii))./ ...
                            (measx(ii + iOrder - 1) - measx(ii));
        end
    end
    divDiffs = temp;
    % All we need to store for coefficients is the divided difference with x_1
    coeffs(iOrder) = divDiffs(1);
end

% Use coefficients to calculate our y points using Hoerner's method
desy = Hoerner_poly(measx, coeffs, desx);

% This will also calculate the y points, but less efficiently
% for icoeff = 1:length(coeffs)
%     if icoeff == 1
%         desy = coeffs(1)*ones(size(desx));
%     else
%         temp = ones(size(desx));
%     for ii = 1:(icoeff-1)
%         temp = temp.*(desx - measx(ii));
%     end
%         desy = desy + coeffs(icoeff)*temp;
%     end
% end
end


function Y = Hoerner_poly(x, coeffs, X)
    if length(x) ~= 1
        Y = coeffs(1) + (X - x(1)).*Hoerner_poly(x(2:end),coeffs(2:end),X);
    else
        Y = coeffs(1);
    end
end