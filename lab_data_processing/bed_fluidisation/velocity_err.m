function err = velocity_err(velocity, q, q_uncertainty, a, a_uncertainty)
    err = velocity * ( (q_uncertainty / q).^2 + (a_uncertainty / a).^2).^0.5;
end

