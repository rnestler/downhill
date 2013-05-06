%Anwendung:     Simplex-Downhill Algorithmus
%Datum:         03.05.2013
%Author:        Selina Malacarne, Raphael Nestler

xBorder = 100; 

x = (-xBorder:1:xBorder);
y = (-xBorder:1:xBorder); 
z = (-xBorder:1:xBorder);
funSquare = square(x); 
xSquare = square(x);
ySquare = square(y);
zSquare = square(z); 

funSphere = sphere(1,2,3); 
%plot(x,fun);
x_newSquare = 20; %Startwert
y_newSquare = 0;
x_valuesSquare = zeros(2*xBorder+1); 
y_valuesSquare = zeros(2*xBorder+1); 

x_newSphere = 20; %Startwert
y_newSphere = 10;
z_newSphere = 0; 
xy_valuesSphere = zeros(2,2*xBorder+1); 
z_valuesSphere = zeros(2*xBorder+1); 

options1 = struct('MaxIter',10,'PlotFcns',@optimplotfval);
options2 = struct('MaxIter',2);
for i=1:(2*xBorder+1)
    [x_newSquare y_newSquare] = fminsearch(@square,x_newSquare,options2);
    x_valuesSquare(i) = x_newSquare; 
    y_valuesSquare(i) = y_newSquare;
    
    [xy_newSphere z_newSphere] = fminsearch(@sphere,[x_newSphere,y_newSphere],options2);
    xy_valuesSphere(1,i) = xy_newSphere(1,:); 
    xy_valuesSphere(2,i) = xy_newSphere(2,:);
    z_valuesSphere(i) = y_newSquare;
end

%[x,fval,exitflag,output]=fminsearch(@square,x_new,options1)
plot(x,funSquare,'r','linewidth',2);
xlabel('t [s]')
ylabel('\omega [1/s]')
title('Angular velocity with r = 1m')
hold on; 
plot(x_valuesSquare(:), y_valuesSquare(:), '*')
hold off; 
grid on; 
set(gca, 'GridLineStyle', '-');
grid(gca,'minor')
