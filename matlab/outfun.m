function stop = outfun(x, optimValues, state)
stop = false;
hold on;
%global xvals;
xvals= [xvals, x];
%global yvals;
yvals= [yvals, optimValues.fval];
% plot(x(1),optimValues.fval,'.');
% drawnow