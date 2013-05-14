%Anwendung:     Simplex-Downhill Algorithmus
%Datum:         03.05.2013
%Author:        Selina Malacarne, Raphael Nestler
close all; 
clear all; 

xBorder = 10;       %Grenze Zielgebiet 
iteration = 20;     %Anzahl Iterationen Simplex


%Funktionsberechnung mit gegebenen x-Werten sowie Meshgrid für späteren
%Plot
x = (-xBorder:0.1:xBorder); 
y = (-xBorder:0.1:xBorder); 
[xx, yy] = meshgrid(x,y);
funHB = himmelblau(xx,yy); 

x_HB1 = [9,9];   %Startwert erstes Simplex
z_HB1 = 0; 
x_HB2 = [-9,-9]; %Startwert zweites Simplex
z_HB2 = 0; 

%Speicherplatz für neue Simplexwerte
x_valHB1 = zeros(2,2*iteration+1); 
z_valHB1 = zeros(1,2*iteration+1); 
x_valHB2 = zeros(2,2*iteration+1); 
z_valHB2 = zeros(1,2*iteration+1); 

%Optionen für fminsearch
options = struct('MaxIter',3);

for i=1:(2*iteration+1)
     %Rechne Simplex und speichere neue "bessere" Werte
     [x_HB1 z_HB1] = fminsearch(@himmelblau,x_HB1,options);
     x_valHB1(1,i) = x_HB1(1,1);
     x_valHB1(2,i) = x_HB1(1,2); 
     z_valHB1(i) =  z_HB1; 
   
     %Rechne Simplex und speichere neue "bessere" Werte
     [x_HB2 z_HB2] = fminsearch(@himmelblau,x_HB2,options);
     x_valHB2(1,i) = x_HB2(1,1);
     x_valHB2(2,i) = x_HB2(1,2); 
     z_valHB2(i) =  z_HB2; 
end

%Plotte Kontur mit Höhenlinien
figure; 
contour(xx,yy,funHB,70);
hold on; 
for i=1:length(x_valHB1)
    plot(x_valHB1(1,i),x_valHB1(2,i),'-*r'); 
    plot(x_valHB2(1,i),x_valHB2(2,i),'-*k'); 
    pause(0.1)
end
xlabel('x1');
ylabel('x2');
hold off; 

%Plotte 3D Ansicht der Funktion sowie der beiden Simplexe
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
 
