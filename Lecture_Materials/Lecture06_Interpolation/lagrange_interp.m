function desy = lagrange_interp(measx, measy, desx)

desy = zeros(size(desx));

for iX = 1:length(measx)
    tempnum = 1; 
    tempden = 1;
    for ii = 1:length(measx)
        if ii ~= iX
            tempnum = tempnum.*(desx - measx(ii));
            tempden = tempden.*(measx(iX) - measx(ii));
        end
    end
    desy = desy + measy(iX).*tempnum./tempden;
end