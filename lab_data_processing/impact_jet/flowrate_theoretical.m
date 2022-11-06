function flowrate_theoretical = flowrate_theoretical(theta, force)
    theta_rad = theta * pi / 180;
    density = 998;
    area = 16 * pi / 1000000;
    for i = 1:length(force)
        flowrate_theoretical(i) = (force(i)*area) / (density * (1 - cos(theta_rad)));
    end
end

