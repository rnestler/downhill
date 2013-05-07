%tx = [-1:0.1:2];
tx = [-2:0.1:5];

%fun = @square;
fun = @(x)x.*sin(x)+5;
y = fun(tx);

[opt, parts, labels] = downhill(1, fun, 0.01, [-2; 2.1]);
for i=1:min(10,size(parts,2))
	f = figure('Name', sprintf('%d', i))
	plot(tx, y, parts{i}(:), fun(parts{i}(:)), '-*')
	xlabel(labels{i})
	for n=1:2
		text(0, 2-n/4, sprintf('p%i: %1.3f = %1.3f', n, parts{i}(n), fun(parts{i}(n))));
	end
	print(f, sprintf('../bilder/sinxx/sinx_x%3i.png',i));
end

