function err = pressure_err(pressure, delta_h, h_uncertainty, rho, rho_uncertainty)
    err = pressure * ( (h_uncertainty / delta_h).^2 + (rho_uncertainty / rho).^2 ).^0.5;
end

