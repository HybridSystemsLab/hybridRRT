% model prameters
global TSPAN_f
global JSPAN_f
global TSPAN_g
global JSPAN_g
global options
global tol
global U_D;
global U_C;
global Tm;
global xf;

%% hybrid model parameters
% barx2 = 0.5;
tol = 0.3;

% HyEQ simulator parameters
Tm = 0.2;
DeltaJ = 1;

options = odeset('RelTol',1e-6,'MaxStep',.01);

TSPAN_f=[0 Tm];
JSPAN_f = [0 1];


TSPAN_g=[0 20];
JSPAN_g = [0 1];

%% Motion planning problem data

x0 = [15; 0];
xf = [10; 0];

%% input library

U_D = 0:.1:4;

U_C = 0;
