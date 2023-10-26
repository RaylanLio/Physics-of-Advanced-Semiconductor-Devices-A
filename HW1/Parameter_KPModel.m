m0 = 9.1e-31; %kg, mass of a electron
hbar = 6.582e-16; %eV * s, Planck's Constant
q = 1.6e-19;%C, the quantity of electric charge of a electron
T = 2*m0/(hbar ^ 2); %kg / (eV * s)^2
T = T/q;
clear m0 hbar q;

d = 5.43e-10; %m, lattice constant
b = 0.2*d; % width of region II
a = d - b; % width of region I, widthI : widthII = 1:4

clear d;

U0 = 5; %eV, Potential Energy in Region I
dE = 1e-5; %eV, Energy accuracy
E = 0:dE:5*U0; %eV, Energy sequence

clear dE;

save("Parameter_KPModel","T","a","b","U0","E");