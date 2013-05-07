function [opt, parts, text] = downhill(dim, fun, eta, start)
	NP = dim; % dimension des problems
	a=1.1; b=0.5; c=2; % alpha, beta, gamma

	xi = zeros(NP+1,NP); % NP+1 Punkte mit NP Werten
	yi = zeros(NP+1,1); % NP+1 Ausgabewerte
	
	if nargin < 4
	for n=1:NP+1
		for d=1:NP
			xi(n,d) = n*2;
		end
	end
	else
	xi = start;
	end

	parts = cell(1,1);
	text = cell(1,1);
	text{1} = 'start';
	for limit=1:1000
		for n=1:NP+1
			yi(n) = fun(xi(n,:));
		end
		[ysort,idx] = sort(yi);
		xmin = xi(idx(1),:);
		ymin = ysort(1);
		parts{limit} = xi;
		xmax = xi(idx(end),:);
		ymax = ysort(end);
		if ymin < eta
			opt = xmin
			return
        end
		xm = mean(xi);
		xref = xm+a*(xm-xmax);
		yref = fun(xref);

		if yref < ymin
			xe = xref +c*(xref-xm);
			ye = fun(xe);
			if ye < ymin
				xi(idx(end),:) = xe; % expansion
				text{limit+1} = 'expansion';
			else
				xi(idx(end),:) = xref; % reflexion
				text{limit+1} = 'reflexion';
            end
		else
			if yref < ysort(end-1)
				xi(idx(end),:) = xref; % reflexion
				text{limit+1} = 'reflexion';
			else
				if yref < ymax
					xmax = xref;
                end
				xcon = xm - b*(xmax-xm);
				ycon = fun(xcon);
				if ycon < ymax
					xi(idx(end),:) = xcon; % kontraktion
					text{limit+1} = 'kontraktion';
				else
					for n=1:NP+1
						xi(n,:) = (xi(n,:)+xmin)*b; % komprimierung
                    end
                end
            end
        end

	end
	opt = xmin
    end

