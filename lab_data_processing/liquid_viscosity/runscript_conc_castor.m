clear

% data
conc_visco_strain = [6.65, 9.52, 13.6, 19.5, 27.9, 39.9,...
    57.2, 81.9, 117, 168, 240, 343, 492, 704, 1010];
conc_visco_strain_err = [0.01, 0.01, 0.1, 0.1, 0.1, 0.1...
    0.1, 0.1, 1, 1, 1, 1, 1, 1, 1];
conc_castor = [5, 6, 9, 12, 19, 26, 36, 52, 73, ...
    107, 154, 222, 319, 454 640];
conc_shear_castor = conc_castor * 1.141;
calib_err_frac = 0.005 / 1.141;

for i = 1:length(conc_castor)
    app_visco(i) = conc_shear_castor(i) / conc_visco_strain(i);
    conc_shear_castor_err(i) = conc_shear_castor(i) * sqrt((calib_err_frac).^2 +...
        (0.5 /conc_castor(i)).^2);
    app_visco_err(i) = app_visco(i) * sqrt((conc_shear_castor_err(i) / conc_shear_castor(i)).^2 +...
        (conc_visco_strain_err(i)/conc_visco_strain(i)).^2);
end

hold on 

yyaxis left
plot(conc_visco_strain, conc_shear_castor)
errorbar(conc_visco_strain, conc_shear_castor, conc_shear_castor_err,...
    conc_shear_castor_err, conc_visco_strain_err, conc_visco_strain_err)
xlabel("Strain Rate / s^{-1}")
ylabel("Shear Stress / Pa")

yyaxis right
plot(conc_visco_strain, app_visco)
errorbar(conc_visco_strain, app_visco, app_visco_err, app_visco_err,...
    conc_visco_strain_err, conc_visco_strain_err)
ylabel("Viscosity / Pa.s")