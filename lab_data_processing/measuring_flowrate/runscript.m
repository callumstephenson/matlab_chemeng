clear

%data
measured_height = [0.1, 0.1, 0.1, 0.15, 0.15, 0.2, 0.2, 0.2, 0.2, 0.25, 0.25];
times = [123, 94, 74, 93, 79, 96, 83, 74, 64, 76, 70];
rotameter_setting = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
weir_height = [11, 14, 16, 20, 22, 24, 27, 29, 31, 33, 35] / 1000;

venturi = [2.0, 2.3, 2.9, 3.6, 4.2, 5.3, 6.3, 7.4, 8.7, 10.1, 11.8] - 1.3;
orifice = [0.3, 1.4, 2.8, 4.8, 6.7, 9.1, 12.0, 15.2, 18.7, 23.0, 27.3] + 1.2 ;
pitot = [0.8, 0.9, 1.2, 1.4, 1.7, 2.1, 2.5, 3.0, 3.5, 4.1, 4.8] - 0.5;

%manipulation
for i = 1:length(measured_height)
    vol_filled(i) = 0.187*measured_height(i);
    flow_rate(i) = vol_filled(i) / times(i);


    log_weir(i) = log(weir_height(i));
    log_flowrate(i) = log(flow_rate(i));

    log_venturi(i) = log(venturi(i)* 1000);
    log_orifice(i) = log(orifice(i)* 1000);
    log_pitot(i) = log(pitot(i)* 1000);
end


plot(log_venturi, log_flowrate, 'k*', log_orifice, log_flowrate, 'bx', log_pitot, log_flowrate, 'r+');
legend("Venturi Plot", "Orifice Plot", "Pitot Plot")
xlabel("\Delta P / Pa")
ylabel("Flow Rate / m^3s^{-1}")

weir_linreg = polyfit(log_weir, log_flowrate, 1);
c_d_weir = exp(weir_linreg(2)) * (0.3386427 / 0.051);

venturi_linreg = polyfit(log_flowrate, log_venturi, 1);
orifice_linreg = polyfit(log_flowrate, log_orifice, 1);
pitot_linreg  = polyfit(log_flowrate, log_pitot, 1);

ba_area_ratio = 0.0127.^2 / 0.01905.^2;
z = 1 - ba_area_ratio.^2;
c_d_orifice = (exp(-12.4968) * sqrt(998 * 0.8025) ) / (0.0127.^2 * pi * sqrt(2));