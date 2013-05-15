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

txH = [-3:0.1:4];
tyH = [-3:0.1:4];
[xx, yy] = meshgrid (txH, tyH);


fun = @(x)himmelblau(x)+rand*20;
fun2 = @(x,y)himmelblau(x,y)+rand(size(x))*20;

zz = fun2(xx,yy);
f = figure('Visible', 'Off');
mesh(xx,yy,zz)
print(f, sprintf('../bilder/HimmelblauRandom/himmelblauoverview.png',i),'-dpng');

zz = himmelblau(xx,yy);

a=2; b=0.5; c=2;
[opt, parts, labels] = downhill(2, fun, 0.01, [2 2; 0 2; 2 0; ], a, b, c);
opt
iterations = size(parts,2)
mkdir('../bilder/HimmelblauRandom')
fun(opt)
for i=1:min(20,size(parts,2))
	f = figure('Visible', 'Off');
	contour(xx,yy,zz, 25);
	hold on;
	partx = parts{i}(:,1); partx = [partx; partx(1)];
	party = parts{i}(:,2); party = [party; party(1)];
	plot(partx, party, '-*r');
	xlabel(labels{i})
	for n=1:3
		text(-3, 1.5-n/3, sprintf('p%i: (%1.3f, %1.3f) = %1.3f', n, partx(n), party(n), himmelblau(partx(n), party(n))));
	end
	print(f, sprintf('../bilder/HimmelblauRandom/himmelblau%03i.png',i),'-dpng');
end

f = figure('Visible', 'Off');
contour(xx,yy,zz, 25)
hold on
for i=1:size(parts,2)
	partx = parts{i}(:,1); partx = [partx; partx(1)];
	party = parts{i}(:,2); party = [party; party(1)];
	plot(partx, party, 'r-*');
end
print(f, sprintf('../bilder/HimmelblauRandom/himmelblauall.png',i),'-dpng');

