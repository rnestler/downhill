%Anwendung:     Simplex-Downhill Algorithmus
%Datum:         03.05.2013
%Author:        Selina Malacarne, Raphael Nestler
close all; 
clear all; 

xBorder = 10; 

x = (-xBorder:1:xBorder);
yA = (-xBorder:1:xBorder); 

xH = (0:0.1:3); 
yH = (0:0.1:3); 

funSquare = square(x); 
[xx, yy] = meshgrid(xH,yH);
funHimmelblau = rastrigin(xx,yy); 

xSquare = square(x);
ySquare = square(yA);
% zSquare = square(z); 

funSphere = sphere(1,2,3); 
%plot(x,fun);
x_newSquare = 20; %Startwert
y_newSquare = 0;
x_valuesSquare = zeros(2*xBorder+1); 
y_valuesSquare = zeros(2*xBorder+1); 

x_newHimmelblau = [0.4,1]; %Startwert

x_temp = [0 0];
z_temp = 0; 
x_valuesHimmelblau = zeros(2,2*xBorder+1); 
z_valuesHimmelblau = zeros(1,2*xBorder+1); 

options1 = struct('MaxIter',10,'PlotFcns',@optimplotfval);
options2 = struct('MaxIter',3);
%w = waitforbuttonpress; 

for i=1:(2*xBorder+1)
    [x_newSquare y_newSquare] = fminsearch(@square,x_newSquare,options2);
    x_valuesSquare(i) = x_newSquare; 
    y_valuesSquare(i) = y_newSquare;
    
     [x_newHimmelblau z_temp] = fminsearch(@rastrigin,x_newHimmelblau,options2);
     x_valuesHimmelblau(1,i) = x_newHimmelblau(1,1);
     x_valuesHimmelblau(2,i) = x_newHimmelblau(1,2); 
     z_valuesHimmelblau(i) =  z_temp; 
end
 
figure; 
plot(x,funSquare,'r','linewidth',2);
xlabel('y')
ylabel('y')
%title('Angular velocity with r = 1m')
hold on; 
for i=1:length(x_valuesSquare)
 plot(x_valuesSquare(i), y_valuesSquare(i), '*')
 pause(0.5)
end
hold off; 
grid on; 
% set(gca, 'GridLineStyle', '-');
% grid(gca,'minor');

figure; 
grid on; 
contour(xx,yy,funHimmelblau,50);
hold on; 
for i=1:length(x_valuesHimmelblau)
    plot(x_valuesHimmelblau(1,i),x_valuesHimmelblau(2,i),'-*r'); 
    pause(0.5)
end

hold off; 

figure; 
mesh(xx,yy,funHimmelblau);
hold on; 
plot3(x_valuesHimmelblau(1,:),x_valuesHimmelblau(2,:),z_valuesHimmelblau(:),'r','linewidth',4); 
hold off; 
grid on; 
 
