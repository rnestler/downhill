function [ ret ] = banana (x,y)
    if nargin < 2
        ret = 100.*(x(2)-x(1).^2).^2+(1-x(1)).^2;
    else
        ret = 100.*(y-x.^2).^2+(1-x).^2;
    end
end
