function desy = lagrange_interp(measx, measy, desx)

desy = zeros(size(desx));

% Iterate across the Y balues of our given points
for iY = 1:length(measy)
    % Reset our numerators and denominators
    tempnum = 1; 
    tempden = 1;
    % Construct our numerator and denominators by iterating across measx
    for iX = 1:length(measx)
        if iX ~= iY     % Don't use the point we are at to avoid 0/0
            tempnum = tempnum.*(desx - measx(iX));
            tempden = tempden.*(measx(iY) - measx(iX));
        end
    end
    % Add our newest term onto our outputs
    desy = desy + measy(iY).*tempnum./tempden;
end