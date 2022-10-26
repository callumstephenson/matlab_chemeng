function [diffusion_coefficient] = diffusion_coeff(mol_flux, diff_path, pressure, pressure_sat, T)
    numerator = mol_flux * (diff_path / 1000) * T * 8.31;
    denominator = pressure * 100000 * (log(1) - log(pressure_sat / pressure));
    diffusion_coefficient = numerator / denominator;
end

