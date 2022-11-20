% data
flow_rate = [75, 150, 225, 300, 375, 450, 525, 600, 675,...
    750, 825, 750, 675, 600, 525, 450, 375, 300, 225, 150, 75] * 10.^(-6);
manometer_low = [51.3, 45.2, 37.5, 30.7, 24.9, 17.8, 20.2...
    14.7, 20.5, 19.3, 18.0, 19.5, 21.1, 21.8, 24.4, 30, 32.6...
    37.6, 43, 48.3, 53.6];
manometer_high = [63.7, 70, 77.6, 84.7, 90.7, 97.7...
    95.5, 100.9, 94.5, 96, 101.5, 96, 94.5, 93.8, 91.3...
    85.6, 83.0, 77.8, 72.4, 66.8, 61.5];
manometer_delta = manometer_high - manometer_low;

% g no err, 998 pm 2 [convert to metres from cm]
delta_p = manometer_delta * 0.01 * 998 * 9.81;
for i = 1:length(delta_p)
    p_err(i) = pressure_err(delta_p(i), manometer_delta(i)*0.01, 0.002, 998, 2);
    if i >= 9 && i <=13
        p_err(i) = p_err(i) + (0.01 * 998 * 9.81);
    end
end

%flowrate err
flow_rate_err = 4*10.^(-6);

% area error
% [m^2, err]
tube_dia = [49.6, 0.3];
area = 49.6.^2 * pi * 0.25;
area_err = (pi / 2) * 49.6 * 0.3;
tube_area = [area*10.^(-6), area_err*10.^(-6)]; % metres^2

% velocity & err
for i = 1:length(flow_rate)
    vel(i) = flow_rate(i) / tube_area(1);
    vel_err(i) = velocity_err(vel(i), flow_rate(i), flow_rate_err, tube_area(1), tube_area(2));
end

plot(vel(1:11), delta_p(1:11));
e = errorbar(vel(1:11), delta_p(1:11), p_err(1:11),...
    p_err(1:11), vel_err(1:11), vel_err(1:11), 'kx');
e.LineStyle = 'none';
xlabel("Superficial Velocity / m.s^{-1}");
ylabel("Frictional Pressure Drop / Pa");
hold off

% bed height
bed_min = [34.8, 34.8, 34.8, 34.8, 34.8,...
    34.8, 37, 37, 39.8, 41.3, 41.4] + 17.2;
bed_max = [34.8, 34.8, 34.8, 34.8, 34.8,...
    34.8, 37, 37, 42.8, 46.8, 49.3] + 17.2;

z = errorbar(vel(1:11), bed_min*0.01, 0.001, 0.001,...
    vel_err(1:11), vel_err(1:11),'bx');
hold on
p = errorbar(vel(1:11), bed_max*0.01,...
    0.001, 0.001, vel_err(1:11), vel_err(1:11), 'kx');

xlabel("Superficial Velocity / m.s^{-1}");
ylabel("Bed Height / m");
legend("Lower deviation")
