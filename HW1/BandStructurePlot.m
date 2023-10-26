function [] = BandStructurePlot(k, E, a, b, figtitle)
% BandStructurePlot Summary of this function goes here
%{
    Input: k(wave vector), E(corresponding energy), a(width of Region II),
    b(width of Region I), figtitle(title of plot);
    Output: E-k(band structure).
%}
figure(Name=figtitle+":(a+b)k")
scatter([-k k],[E E],1);
Xmax = ceil(max(abs(k))/pi);
X = (-Xmax : Xmax)*pi;
xlab = [];
for i = -Xmax : Xmax
    if i == -1
        xlab = [xlab "-\pi"];
    elseif i == 0
        xlab = [xlab "0"];
    elseif i == 1
        xlab = [xlab "\pi"];
    else 
        xlab = [xlab num2str(i)+"\pi"];
    end
end
xlim([-Xmax*pi Xmax*pi]);
xticks(X);
xticklabels(xlab);
title(figtitle);
subtitle("lattice constant is a+b="+num2str((a+b)*1e10)+" A .");
xlabel("(a+b)k");
ylabel("Energy/eV");

figure(Name=figtitle+":k")
scatter([-k k]/(a+b),[E E],1);
xlim([-Xmax*pi/(a+b) Xmax*pi/(a+b)]);
xticks(X/(a+b));
for i = 1:length(xlab)
    if xlab(i) ~= "0"
        xlab(i) = xlab(i) + "/(a+b)";
    end
end
xticklabels(xlab);
title(figtitle);
subtitle("lattice constant is a+b="+num2str((a+b)*1e10)+" A .");
xlabel("k-wave vector/m^{-1}");
ylabel("Energy/eV");
end