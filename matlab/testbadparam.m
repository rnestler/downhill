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

txH = [-5:0.1:5];
tyH = [-5:0.1:5];
[xx, yy] = meshgrid (txH, tyH);


fun = @himmelblau;

zz = fun(xx,yy);

[opt, parts, labels] = downhill(2, fun, 0.01, [1 1; 0 1; 1 0; ], 0.5, 0.1, 1.5);
for i=1:min(30,size(parts,2))
	f = figure('Name', sprintf('%d', i))
	contour(xx,yy,zz, 15)
	hold on
	partx = parts{i}(:,1); partx = [partx; partx(1)];
	party = parts{i}(:,2); party = [party; party(1)];
	plot(partx, party, '-*r');
	xlabel(labels{i})
	for n=1:3
		text(-3, 1.5-n/3, sprintf('p%i: (%1.3f, %1.3f) = %1.3f', n, partx(n), party(n), fun(partx(n), party(n))));
	end
end

