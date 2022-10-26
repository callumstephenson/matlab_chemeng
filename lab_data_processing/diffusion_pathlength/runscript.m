% physical constants
acetone = [16.6513, 2940.46, -35.93];
npentane = [15.8333, 2477.07, -39.94];
cyclopentane = [15.8574, 2588.48, -41.79];

% data
% [time1(s), time2, time3, path_len(mm), temp_before(K), temp_after(K)]
acetone_data_2ml = [205, 215, 211, 123.86, 22+273.15, 22+273.15];
acetone_data_5ml = [181, 164, 167, 96.86, 22+273.15, 22+273.15];
acetone_data_8ml = [150, 153, 164, 69.95, 22+273.15, 22+273.15];

npentane_data_5ml = [76, 88, 83, 96.86, 21+273.15, 21+273.15];
cyclopentane_data_5ml = [105, 125, 109, 96.86, 21+273.15, 20+273.15];

cylinder_csa = pi * (0.0055).^2;
pressure = 0.999;

% psat calc 
p_sat_acetone = psat(acetone_data_5ml(5), acetone);
p_sat_npentane = psat(npentane_data_5ml(5), npentane);
p_sat_cyclopentane = psat(cyclopentane_data_5ml(5), cyclopentane);

%average calc
acetone_2ml_avg = t_avg(acetone_data_2ml);
acetone_5ml_avg = t_avg(acetone_data_5ml);
acetone_8ml_avg = t_avg(acetone_data_8ml);
npentane_5ml_avg = t_avg(npentane_data_5ml);
cyclopentane_5ml_avg = t_avg(cyclopentane_data_5ml);

acetone_mol_flux_2ml = (0.002 / 58) / (cylinder_csa * acetone_2ml_avg);
acetone_mol_flux_5ml = (0.002 / 58) / (cylinder_csa * acetone_5ml_avg);
acetone_mol_flux_8ml = (0.002 / 58) / (cylinder_csa * acetone_8ml_avg);
cpent_mol_flux = (0.002 / 70) / (cylinder_csa * cyclopentane_5ml_avg);
npent_mol_flux = (0.002 / 72) / (cylinder_csa * npentane_5ml_avg);

% diffusivity calculations
acetone_diffusion_2ml = diffusion_coeff(acetone_mol_flux_2ml, acetone_data_2ml(4), pressure, p_sat_acetone, acetone_data_2ml(5));
acetone_diffusion_5ml = diffusion_coeff(acetone_mol_flux_5ml, acetone_data_5ml(4), pressure, p_sat_acetone, acetone_data_5ml(5));
acetone_diffusion_8ml = diffusion_coeff(acetone_mol_flux_8ml, acetone_data_8ml(4), pressure, p_sat_acetone, acetone_data_8ml(5));
npentane_diffusion = diffusion_coeff(npent_mol_flux, npentane_data_5ml(4), pressure, p_sat_npentane, npentane_data_5ml(5));
cpentane_diffusion = diffusion_coeff(cpent_mol_flux, cyclopentane_data_5ml(4), pressure, p_sat_cyclopentane, cyclopentane_data_5ml(5));