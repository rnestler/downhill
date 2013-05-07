function [ret] = rastrigin(x,y)
	A =10;
    if nargin < 2
		ret = A + x(1)^2 - A*cos(2*pi*x(1)) + x(2)^2 - A*cos(2*pi*x(2));
    else
		ret = A + x.^2 - A*cos(2*pi*x) + y.^2 - A*cos(2*pi*y);
    end
end
