% data
clear

rho = 998;
mu = 0.001;
D = 0.0885;
omega = 293.2;
diameter = 0.088;
depth = 0.006;

back_times = [13.2, 14.9, 15.9, 17.3, 29.8, 72.8, 109.0, 213.0];
back_deltap = [88, 90, 92.6, 94, 97, 100.8, 102, 105.2] * 1000;
front_times = [17, 18, 18.2, 20.8, 25.8, 54, 65.2, 167.2];
front_deltap = [58.6, 60.1, 62.5, 67, 73.7, 90, 92.9, 103.2] * 1000;

delta_back = 0;
delta_front = 0;

for i = 1:length(back_times)
    back_fr(i) = 0.0133 / back_times(i);
    front_fr(i) = 0.0133 / front_times(i);

    back_diml_pr(i) = back_deltap(i) / (rho * omega.^2 * D.^2);
    front_diml_pr(i) = front_deltap(i) / (rho * omega.^2 * D.^2);

    back_diml_fr(i) = back_fr(i) / (omega * D.^3);
    front_diml_fr(i) = front_fr(i) / (omega * D.^3);

    dp_ideal_back(i) = rho * omega.^2 * (diameter.^2) - ((rho * omega * back_fr(i)) / (2 * pi * depth * tan(1.13446)));
    dp_ideal_front(i) = rho * omega.^2 * (diameter.^2) - ((rho * omega * front_fr(i)) / (2 * pi * depth * tan(2.007)));

    delta_back = delta_back + (back_deltap(i) / dp_ideal_back(i));
    delta_front = delta_front + (front_deltap(i) / dp_ideal_front(i));
end

delta_back = delta_back / 8;
delta_front = delta_front / 8;

% linreg
front_linreg  = polyfit(front_diml_fr, front_diml_pr, 1);
back_linreg = polyfit(back_diml_fr, back_diml_pr, 1);

plot(back_fr, back_deltap, 'k*', front_fr, front_deltap, 'kx')
legend("Backwards, Fully Shrouded","Forwards, Fully Shrouded")
ylabel("\Delta P / Pa")
xlabel("Flow Rate / m^3s^{-1}")


plot(back_diml_fr, back_diml_pr, 'k*', front_diml_fr, front_diml_pr, 'kx')
legend("Backwards, Fully Shrouded","Forwards, Fully Shrouded")
ylabel("Dimensionless Pressure")
xlabel("Dimensionless Flowrate")
