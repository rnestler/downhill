%Anwendung:     Simplex-Downhill Algorithmus
%Datum:         03.05.2013
%Author:        Selina Malacarne, Raphael Nestler
close all; 
clear all; 

xBorder = 10; 
teration = 20; 


x = (-xBorder:0.1:xBorder); 
y = (-xBorder:0.1:xBorder); 

[xx, yy] = meshgrid(x,y);
funHB = himmelblau(xx,yy); 

x_HB1 = [9,9]; %Startwert
z_HB1 = 0; 
x_HB2 = [-9,-9]; %Startwert
z_HB2 = 0; 


x_valHB1 = zeros(2,2*teration+1); 
z_valHB1 = zeros(1,2*teration+1); 
x_valHB2 = zeros(2,2*teration+1); 
z_valHB2 = zeros(1,2*teration+1); 

options1 = struct('MaxIter',3);
options2 = struct('MaxIter',6);

for i=1:(2*teration+1)
     [x_HB1 z_HB1] = fminsearch(@himmelblau,x_HB1,options1);
     x_valHB1(1,i) = x_HB1(1,1);
     x_valHB1(2,i) = x_HB1(1,2); 
     z_valHB1(i) =  z_HB1; 
     
     [x_HB2 z_HB2] = fminsearch(@himmelblau,x_HB2,options2);
     x_valHB2(1,i) = x_HB2(1,1);
     x_valHB2(2,i) = x_HB2(1,2); 
     z_valHB2(i) =  z_HB2; 
end

figure; 
contour(xx,yy,funHB,70);
hold on; 
for i=1:length(x_valHB1)
    plot(x_valHB1(1,i),x_valHB1(2,i),'-*r'); 
    plot(x_valHB2(1,i),x_valHB2(2,i),'-*k'); 
    pause(0.5)
end
xlabel('x1');
ylabel('x2');
hold off; 

figure; 
mesh(xx,yy,funHB);
hold on; 
plot3(x_valHB1(1,:),x_valHB1(2,:),z_valHB1(:),'r','linewidth',4); 
plot3(x_valHB2(1,:),x_valHB2(2,:),z_valHB2(:),'k','linewidth',4); 
hold off; 
xlabel('x1');
ylabel('x2');
zlabel('z');
grid on; 
 
