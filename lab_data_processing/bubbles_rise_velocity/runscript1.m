clear
% data
% exp1
volume = [0.5, 1, 2, 5, 10, 20, 50];

raw_half = [3.13, 3.05, 3.07, 3.27, 3.25];
raw_one = [2.81, 2.75, 2.91, 2.88, 2.9];
raw_two = [2.56, 2.62, 2.62, 2.70, 2.57];
raw_five = [2.3, 2.42, 2.4, 2.38, 2.4];
raw_ten = [2.06, 2.1, 2.05, 2.14, 2.12];
raw_twenty = [1.84, 1.97, 1.81, 1.94, 1.99];
raw_fifty = [1.8, 1.76, 1.82, 1.71, 1.76];

time(1) = average(raw_half);
time(2) = average(raw_one);
time(3) = average(raw_two);
time(4) = average(raw_five);
time(5) = average(raw_ten);
time(6) = average(raw_twenty);
time(7) = average(raw_fifty);

for i = 1:length(time)
    velocity(i) = 0.705 / time(i);
    velocity_prediction = 0.798 * sqrt(9.81) * (volume*10e-6).^(1/6);
end

y = polyfit(log(volume * 10e-6), log(velocity_prediction), 1);
z = polyfit(log(volume * 10e-6), log(velocity), 1);
x1 = linspace(0, 50, 100);
y1 = 0.25*x1.^(0.1283);

plot(log(volume), log(velocity), 'kx', log(volume), log(velocity_prediction), log(x1), log(y1), 'b')
xlabel("Volume / cm^3")
ylabel("Velocity / ms^{-1}")
legend("Experimental Data", "Predicted Velocities", "Linear Regression Best Fit")