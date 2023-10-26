clear all;
clc;
close all;

run("Parameter_KPModel.m");
load("Parameter_KPModel.mat");
[k,E,ind] = KPModel(T, a, b, U0, E);

BandStructurePlot(k, E, a, b, "Simple Band Structure");

tic
d_ind = find(diff(ind) > 1);
shift_phase = (-1).^(1:length(d_ind)).*ceil((1:length(d_ind))./2).*(2*pi);

for i = 1:length(d_ind)-1
    k(d_ind(i)+1:d_ind(i+1)) = k(d_ind(i)+1:d_ind(i+1)) + shift_phase(i);
end
k(d_ind(end)+1:end) = k(d_ind(end)+1:end) + shift_phase(end);
toc

clear d_ind shift_phase;

clear i ind;
BandStructurePlot(k, E, a, b, "Complete Band Structure");




