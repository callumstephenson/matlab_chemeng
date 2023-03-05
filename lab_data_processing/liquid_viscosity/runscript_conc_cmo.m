clear

% data
conc_visco_strain = [6.65, 9.52, 13.6, 19.5, 27.9, 39.9,...
    57.2, 81.9, 117, 168, 240, 343, 492, 704, 1010];
conc_visco_strain_err = [0.01, 0.01, 0.1, 0.1, 0.1, 0.1...
    0.1, 0.1, 1, 1, 1, 1, 1, 1, 1];
conc_cmo = [1, 1, 1, 2, 2, 3, 4, 6, 7, 10, 14, 20, 26, 35, 46];
conc_shear_cmo = conc_cmo * 1.141;
calib_err_frac = 0.005 / 1.141;

for i = 1:length(conc_cmo)
    app_visco(i) = conc_shear_cmo(i) / conc_visco_strain(i);
    conc_shear_cmo_err(i) = conc_shear_cmo(i) * sqrt((calib_err_frac).^2 +...
        (0.5 /conc_cmo(i)).^2);
    app_visco_err(i) = app_visco(i) * sqrt((conc_shear_cmo_err(i) / conc_shear_cmo(i)).^2 +...
        (conc_visco_strain_err(i)/conc_visco_strain(i)).^2);
end

hold on 

yyaxis left
plot(conc_visco_strain, conc_shear_cmo)
errorbar(conc_visco_strain, conc_shear_cmo, conc_shear_cmo_err,...
    conc_shear_cmo_err, conc_visco_strain_err, conc_visco_strain_err)
xlabel("Strain Rate / s^{-1}")
ylabel("Shear Stress / Pa")

yyaxis right
plot(conc_visco_strain, app_visco)
errorbar(conc_visco_strain, app_visco, app_visco_err, app_visco_err,...
    conc_visco_strain_err, conc_visco_strain_err)
ylabel("Viscosity / Pa.s")