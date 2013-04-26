## Copyright (C) 2013 Raphael Nestler
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

tx = [-5:0.1:5];
ty = [-5:0.1:5];
[xx, yy] = meshgrid (tx, ty);

zz = himmelblau(xx,yy);

% simplex parameter
NP = 2; % dimension des problems
NA=1; NB=0.5; NC=2; % alpha, beta, gamma

par = zeros(NP+1,NP+1); % NP+1 Punkte mit NP+1 Werten

for n=1:NP+1
	par(n,1) = n;
	par(n,2) = n;
	par(n,3) = himmelblau(n,n);
end
par

mesh(xx,yy,zz)
hold on
plot3(par(:,1), par(:,2), par(:,3), 'r')

