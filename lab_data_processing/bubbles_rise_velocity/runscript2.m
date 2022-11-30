clear
% data
% exp2
diameter = [0.0116, 0.0254, 0.0508, 0.0679];

raw_one = [2.83, 2.83, 3.02, 3.03, 2.98];
raw_two = [3.34, 3.47, 3.39, 3.29, 3.36];
raw_three = [4.51, 4.46, 4.3, 4.7, 4.45];
raw_four = [7.48, 7.69, 7.32, 7.66, 7.87];

time(1) = average(raw_four);
time(2) = average(raw_three);
time(3) = average(raw_two);
time(4) = average(raw_one);

for i = 1:length(time)
    velocity(i) = 0.76 / time(i);
    constant(i) = velocity(i) / sqrt(9.81 * diameter(i));
    eotvos(i) = (9.81 * diameter(i).^2 * 996) / 0.073;
end

z = polyfit(sqrt(diameter * 9.81), velocity, 1);
x1 = linspace(0.3, 0.82, 100);
y1 = z(1)*x1 + z(2);
plot(sqrt(diameter * 9.81), velocity, 'kx', x1, y1, 'b');
xlabel("sqrt(Diameter * Gravitational Acceleration) / ms^{-1}")
ylabel("Velocity / ms^{-1}")
legend("Experimental Datapoints", "Linear Regression")
