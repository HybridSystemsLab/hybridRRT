function [value] = Xf(x)
%XF Summary of this function goes here
%   Detailed explanation goes here
global xf;
value = 0;
if (norm(x - xf) < 0.3)
    value = 1;
end
end

