function out = h(x)
%H Summary of this function goes here
%   Detailed explanation goes here
global params
thetap = x(1,1);
out = params.phis - thetap;
end

