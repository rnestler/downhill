%Anwendung:     Simplex-Downhill Algorithmus
%Datum:         03.05.2013
%Author:        Selina Malacarne, Raphael Nestler
close all; 
clear all; 

xBorder = 20; 
iteration = 20; 

x = (-xBorder:1:xBorder);
y = (-xBorder:1:xBorder); 

funSquare = square(x); 

x_newSquare1 = 18; %Startwert
y_newSquare1 = 0;
x_valuesSquare1 = zeros(2*iteration+1); 
y_valuesSquare1 = zeros(2*iteration+1); 

x_newSquare2 = -18; %Startwert
y_newSquare2 = 0;
x_valuesSquare2 = zeros(2*iteration+1); 
y_valuesSquare2 = zeros(2*iteration+1); 

options = struct('MaxIter',2);

for i=1:(2*iteration+1)
    [x_newSquare1 y_newSquare1] = fminsearch(@square,x_newSquare1,options);
    x_valuesSquare1(i) = x_newSquare1; 
    y_valuesSquare1(i) = y_newSquare1;
    
    [x_newSquare2 y_newSquare2] = fminsearch(@square,x_newSquare2,options);
    x_valuesSquare2(i) = x_newSquare2; 
    y_valuesSquare2(i) = y_newSquare2;
end
 
figure; 
plot(x,funSquare,'r','linewidth',2);
xlabel('x')
ylabel('y')
hold on; 
for i=1:length(x_valuesSquare1)
 plot(x_valuesSquare1(i), y_valuesSquare1(i), '*b','linewidth',2)
  plot(x_valuesSquare2(i), y_valuesSquare2(i), '*k','linewidth',2)
 %pause(0.5)
end
hold off; 
grid on; 
set(gca, 'GridLineStyle', '-');
grid(gca,'minor');


 
