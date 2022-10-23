% data
theta_vals = [...

    0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100,...
    110, 120, 140, 160, 180, 200, 220, 240, 250, 260, 270,...
    280, 290, 300, 310, 320, 330, 340, 350, 360 ...

];

thirteen_volt_m2 = [...

    6.35, 6.35, 6.35, 6.1, 5.6, 5, 4.5, 4.05, 4.1,...
    4.4, 4.45, 4.3, 4.5, 4.45, 4.3, 4.3, 4.35,...
    4.35, 4.4, 4.5, 4.35, 4.3, 3.9, 4.05, 4.7,...
    5.6, 6.05, 6.25, 6.35, 6.4, 6.35, 6.35...
    
 ];

ten_volt_m2 = [...

    6.1, 6.1, 6, 5.7, 5.15, 4.8, 4.4, 4.4, 4.7, 4.65,...
    4.65, 4.6, 4.7, 4.6, 4.65, 4.65, 4.6, 4.7, 4.8, 4.65,...
    4.65, 4.5, 4.6, 4.9, 5.4, 5.8, 6, 6.1, 6.1, 6.15, 6.1...
    
];

seven_volt_m2 = [...

    6, 5.85, 5.7, 5.5, 5.3, 5.1, 5, 5.1, 5.15, 5.2, 5.1,...
    5.1, 5.05, 5.1, 5, 5, 5.1, 5.05, 5, 5, 5.1, 4.9, 5.0,...
    5.25, 5.5, 5.6, 5.75, 5.8, 5.9, 5.85, 5.9...
    
];

seven_volt_m1 = 5.55;
ten_volt_m1 = 6.2; 
thirteen_volt_m1 = 6.95;

% runscript

y_thirteen = adjusted_pressure(thirteen_volt_m2, theta_vals, thirteen_volt_m1);
y_ten = adjusted_pressure(ten_volt_m2, theta_vals, ten_volt_m1);
y_seven = adjusted_pressure(seven_volt_m2, theta_vals, seven_volt_m1);

vertical_y = linspace(-0.5, 2, 101);
vertical_x = [];
for i = 1:length(vertical_y)
    vertical_x(i) = pi;
end

for i = 1:length(theta_vals)
    theta_vals_rads(i) = theta_vals(i)*pi / 180;
end


graph1 = plot(theta_vals_rads, y_thirteen, "k--", theta_vals_rads, y_ten, "k:", theta_vals_rads, y_seven, "k-.");
set(graph1,'LineWidth',1.5);
xlabel("Angle / Rad");
ylabel("Dimensionless pressure [P2 - P1 / Pa - P1] cos \theta");
legend("13 V Data","10 V Data","7 V Data");

% form fitting

fit_13v = fit(theta_vals_rads(:), y_thirteen(:), 'Poly4');
fit_10v = fit(theta_vals_rads(:), y_ten(:), 'Poly4');
fit_7v = fit(theta_vals_rads(:), y_seven(:), 'Poly4');

fun_13v = @(x) 0.02098*x.^4 - 0.2643*x.^3 + 1.11*x.^2 - 1.734*x + 0.9088;
fun_10v = @(x) 0.02237*x.^4 - 0.2843*x.^3 + 1.229*x.^2 -2.025*x + 1.09;
fun_7v = @(x) 0.01933*x.^4 - 0.2483*x.^3 + 1.209*x.^2 - 2.56*x + 1.821;

int_13v = integral(fun_13v, 0, pi)
fit_10v = integral(fun_10v, 0, pi)
fit_7v = integral(fun_7v, 0, pi)