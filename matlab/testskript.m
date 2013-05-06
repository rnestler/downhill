% Copyright (C) 2013 Raphael Nestler
% 
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with Octave; see the file COPYING.  If not, see
% <http://www.gnu.org/licenses/>.

tx = [-1:0.1:2];
%ty = [-5:0.1:5];
%[xx, yy] = meshgrid (tx, ty);

%zz = himmelblau(xx,yy);

fun = @square;

y = fun(tx);

[opt, parts, text] = downhill(1, fun, 0.01, [1; 2])
for i=1:size(parts,1)
	figure('Name', sprintf('%d', i))
	plot(tx, y, parts(i,:), fun(parts(i,:)), '-*')
%	xlabel(text{i})
end


%f = figure;
%mesh(xx,yy,zz)
%hold on
%plot3(par(:,1), par(:,2), par(:,3), 'r')

%print(f, "himmelblau.png")

