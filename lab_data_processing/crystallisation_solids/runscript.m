% constants

toluene_mr = 92.14;
nhexane_mr = 86.17;
napthalene_mr = 128.17;
toluene_density = 867/1000;  
nhexane_density = 659/1000;

% data

vol_added = [5, 7, 9, 11, 13, 15, 17];
toluene_temps = [62, 57, 53, 47, 44, 42, 40]+ 273.15;
nhexane_temps = [56, 54, 49, 47, 42, 39, 37] + 273.15;

% runscript

napth_mol_tol = 14.3 / napthalene_mr;
napth_mol_nhex = 4 / napthalene_mr;

for i = 1:length(vol_added)
    toluene_mol(i) = ((vol_added(i) * toluene_density) / toluene_mr);

    nhexane_mol(i) = (vol_added(i) * nhexane_density) / nhexane_mr;
end

for i = 1:length(vol_added)
    toluene_frac(i) = 1 - (toluene_mol(i) / (toluene_mol(i) + napth_mol_tol));

    nhexane_frac(i) = 1 - (nhexane_mol(i) / (nhexane_mol(i) + napth_mol_nhex));
end

x = linspace(0.01,1,101);

for i = 1:length(x)
    t_f(i) = (1/((1 / 353.3) - ((8.31*log(x(i))/18800))));
end

plot(nhexane_frac, nhexane_temps, '-b.', toluene_frac, toluene_temps, '-rx', x, t_f, '-k');
xlabel("Mole fraction of solvent");
ylabel("Temperature for first crystal / K");
legend("n-hexane", "toluene-experimental", "toluene-predicted")