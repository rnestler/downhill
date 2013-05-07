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

% himmelblau

% Author: Raphael Nestler <roughl@tuxpad>
% Created: 2013-04-26

function [ ret ] = himmelblau (x,y)
    if nargin < 2
        ret = (x(1).^2 + x(2) -11).^2 + (x(1)+x(2).^2-7).^2;
    else
        ret = (x.^2 + y -11).^2 + (x+y.^2-7).^2;
    end
end
