% data

% all lengths in cm
bed_height = [45, 44.9, 45, 45, 45, 45.7, 46.4, 47.9, 58.8, 66.4, 77.4, 90.5, 106.0, 128.2];
manometer_high = [58.1, 60.1, 63.7, 66.6, 69.6, 70.0, 69.9, 69.9, 69.9, 70.0, 70.2, 70.3, 70.4, 70.4];
manometer_low = [41.3, 39.9, 36.6, 34.2, 32.1, 31.1, 31.4, 31.5, 31.4, 31.4, 31.4, 31.3, 31.2, 31.2];
manometer_delta = manometer_high - manometer_low;

% g no err, 998 pm 2 [convert to metres from cm]
delta_p = manometer_delta * 0.01 * 998 * 9.81;
for i = 1:length(delta_p)
    p_err(i) = pressure_err(delta_p(i), manometer_delta(i)*0.01, 0.002, 998, 2);
end

% flowrate & err  
% [m^3 / s, err]
flow_rate = [3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 60, 70] * 10.^-6;
flow_rate_err = 4*10.^(-7);

% area error
% [m^2, err]
tube_dia = [50.9, 0.3];
area = 50.9.^2 * pi * 0.25;
area_err = (pi / 2) * 50.9 * 0.3;
tube_area = [area*10.^(-6), area_err*10.^(-6)]; % metres^2

% velocity & err
for i = 1:length(flow_rate)
    vel(i) = flow_rate(i) / tube_area(1);
    vel_err(i) = velocity_err(vel(i), flow_rate(i), flow_rate_err, tube_area(1), tube_area(2));
end

% plot 

plot(vel, delta_p);
e = errorbar(vel, delta_p, p_err, p_err, vel_err, vel_err, 'kx');
e.LineStyle = 'none';
xlabel("Superficial Velocity / m.s^{-1}");
ylabel("Frictional Pressure Drop / Pa");
hold off

% bed voidage calc
particle_volume = 1.4 / 2500;
pvol_err = particle_volume * ((0.1 / 1.4).^2 + (10 / 2500).^2).^0.5;

for i = 1:length(bed_height)
    vol_bed(i) = tube_area(1) * bed_height(i) * 0.01;
    vbed_err(i) = velocity_err(vol_bed(i), tube_area(1), tube_area(2), bed_height(i)*0.01, 0.001);
    voidage(i) = (vol_bed(i) - particle_volume) / vol_bed(i);
    err_voidage = voidage_err(voidage(i), vol_bed(i), vbed_err(i), particle_volume, pvol_err);
end

x = log(voidage);
y = log(vel);
w = x(7:14);
z = y(7:14);
r = polyfit(x, y, 1);
z = errorbar(x, y, vel_err, vel_err, err_voidage, err_voidage, 'kx');
xlabel("Bed Voidage");
ylabel("Superficial Velocity / m.s^{-1}");
