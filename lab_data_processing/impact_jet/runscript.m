%data
mass_cumulative = [99.7, 99.1, 99.5, 99.2, 99.0, 99.4, 99.6, 99.2] / 1000;

deflector_170_vol = [10, 10, 10, 15, 15, 20, 20, 20];
deflector_170_time = [59.66, 42.71, 33.4, 45.18, 39.75, 47.61, 43.98, 41.28];

deflector_120_vol = [10, 10, 15, 15, 20, 20, 20];
deflector_120_time = [51.9, 38.22, 43.20, 39.29, 46.95, 43.68, 39.74];

deflector_90_vol = [10, 15, 15, 20, 20, 25];
deflector_90_time = [44.18, 45.09, 38.85, 43.69, 39.08, 44.32];

% calc 
vsq_170 = flowrate_calc(deflector_170_vol, deflector_170_time);
vsq_120 = flowrate_calc(deflector_120_vol, deflector_120_time);
vsq_90 = flowrate_calc(deflector_90_vol, deflector_90_time);

force_cumulative = 0;

for i = 1:length(mass_cumulative)
    force_cumulative = force_cumulative + (mass_cumulative(i) * 9.81);
    force(i) = force_cumulative;
end

theoretical_170 = flowrate_theoretical(170, force);
theoretical_120 = flowrate_theoretical(120, force(1:7));
theoretical_90 = flowrate_theoretical(90, force(1:6));


% error calc
v_err_170 = linear_error_calc(sqrt(vsq_170), deflector_170_vol, 0.1);
v_err_120 = linear_error_calc(sqrt(vsq_120), deflector_120_vol, 0.1);
v_err_90 = linear_error_calc(sqrt(vsq_90), deflector_90_vol, 0.1);

force_err = linear_error_calc(force, (force / 9.81), 0.0001);

vsq_170_err = square_error_calc(vsq_170, v_err_170);
vsq_120_err = square_error_calc(vsq_120, v_err_120);
vsq_90_err = square_error_calc(vsq_90, v_err_90);

% plotting , force, theoretical_170
plot(force, vsq_170, force, theoretical_170);
e = errorbar(force, vsq_170, vsq_170_err / 2, vsq_170_err / 2, force_err / 2, force_err / 2, 'kx');
e.LineStyle = 'none';
xlabel("Force Applied / N");
ylabel("Volumetric Flowrate ^2 / M^6.S^-2");
hold on
plot(force, theoretical_170);
legend("170 Degree Data", "Theoretical Values");
hold off
plot(force(1:7), vsq_120, force(1:7), theoretical_120);
e = errorbar(force(1:7), vsq_120, vsq_120_err / 2, vsq_120_err / 2, force_err(1:7) / 2, force_err(1:7) / 2, 'kx');
e.LineStyle = 'none';
xlabel("Force Applied / N");
ylabel("Volumetric Flowrate ^2 / M^6.S^-2");
hold on
plot(force(1:7), theoretical_120);
legend("120 Degree Data", "Theoretical Values");
hold off
plot(force(1:6), vsq_90);
e = errorbar(force(1:6), vsq_90, vsq_90_err / 2, vsq_90_err / 2, force_err(1:6) / 2, force_err(1:6) / 2, 'kx');
e.LineStyle = 'none';
xlabel("Force Applied / N");
ylabel("Volumetric Flowrate ^2 / M^6.S^-2");
hold on
plot(force(1:6), theoretical_90);
legend('90 Degree Data', 'Theoretical Values');