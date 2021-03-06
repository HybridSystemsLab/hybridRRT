clc
clear all
close all

K = inf;

switch(1)
    case 1 
        loadfilepath = 'bouncingball';
    case 2 
        loadfilepath = 'biped_simplified';
end
addpath(loadfilepath);
initialization;
addpath(genpath('patch'));
%% model parameters

AlgorithmInit;

% pn = 0.9;% biped example
pn = 0.5;% bouncing ball example

tic
for k = 1:K
    n = rand;
    if (n < pn)
        x_rand = sampleInC(N);
        [T, I_new, isextended, edge_map, reachedset, x_new, psi_new] = extend(T, x_rand, edge_map, reachedset, 0);
    else
        x_rand = sampleInD(N);
        [T, I_new, isextended, edge_map, reachedset, x_new, psi_new] = extend(T, x_rand, edge_map, reachedset, 1);
    end
    if isextended && Xf(T.get(I_new))
        t = toc
        fprintf('Find the solution!\n')
        motionplan = getmotionplan(T, I_new, edge_map);
        postprocess;
        return;
    end
end

fprintf('Fail to find the solution!\n')