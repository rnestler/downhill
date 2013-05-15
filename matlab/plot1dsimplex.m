tx = [-2:0.1:7];
fun = @(x)x.*sin(x)+5;

y = fun(tx);

[opt, parts, labels] = downhill(1, fun, 0.01, [2; 2.1]);
mkdir('../bilder/sinxx1')
for i=1:min(10,size(parts,2))
	f = figure('Name', sprintf('%d', i))
	plot(tx, y, 'linewidth', 5, parts{i}(:), fun(parts{i}(:)), '-*', 'linewidth', 10)
	xlabel(labels{i})
	for n=1:2
		text(0, 2-n/4, sprintf('p%i: %1.3f = %1.3f', n, parts{i}(n), fun(parts{i}(n))));
	end
	print(f, sprintf('../bilder/GlobMinima/sinx_x%03i.png',i));
end


[opt, parts, labels] = downhill(1, fun, 0.01, [2; 1.9]);
mkdir('../bilder/sinxx2')
for i=1:min(10,size(parts,2))
	f = figure('Name', sprintf('%d', i))
	plot(tx, y, 'linewidth', 5, parts{i}(:), fun(parts{i}(:)), '-*', 'linewidth', 10)
	xlabel(labels{i})
	for n=1:2
		text(0, 2-n/4, sprintf('p%i: %1.3f = %1.3f', n, parts{i}(n), fun(parts{i}(n))));
	end
	print(f, sprintf('../bilder/LokMinima/sinx_x%03i.png',i),'-dpng');
end


tx = [-6:0.1:6];
fun = @(x)x.^2;
y = fun(tx);
[opt, parts, labels] = downhill(1, fun, 0.01, [-6; -5]);
mkdir('../bilder/Quadrat')
for i=1:min(10,size(parts,2))
	f = figure('Name', sprintf('%d', i))
	plot(tx, y, 'linewidth', 5, parts{i}(:), fun(parts{i}(:)), '-*', 'linewidth', 10)
	xlabel(labels{i})
	for n=1:2
		text(0, 30-n, sprintf('p%i: %1.3f = %1.3f', n, parts{i}(n), fun(parts{i}(n))));
	end
	print(f, sprintf('../bilder/Quadrat/sinx_x%03i.png',i),'-dpng');
end
