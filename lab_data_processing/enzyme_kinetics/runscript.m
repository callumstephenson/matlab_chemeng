% data [1,2,3,4,5,6,7,8,9, ctrl]
buffer = [390, 375, 350, 325, 300, 250, 200, 150, 100, 100];
substrate = [10, 25, 50, 75, 100, 150, 200, 250, 300, 300];
absorbance = [0.02, 0.111, 0.178, 0.252, 0.425, 0.315, 0.341, 0.353, 0.439, 0.099];
delta_t = 600;
enzyme = 100;

for i = 1:length(substrate)
    substrate_conc(i) = (substrate(i) * 0.005) / 500;
    reciprocal_substrate_conc(i) = 1 / substrate_conc(i);
end

for i = 1:length(substrate_conc)
    background_absorbance(i) = absorbance(10) * substrate_conc(i) / substrate_conc(10);
end

for i = 1:length(background_absorbance)
    corrected_absorbance(i) = 2 * (absorbance(i) - background_absorbance(i));
    reaction_velocity(i) = corrected_absorbance(i) / (18300 * delta_t);
    reciprocal_reaction_velocity(i) = 1 / reaction_velocity(i);
end

plot(reciprocal_substrate_conc(2:9), reciprocal_reaction_velocity(2:9), "kx");

x = reciprocal_substrate_conc(2:9);
y = reciprocal_reaction_velocity(2:9);
p = polyfit(x, y, 1);

x_linspace = linspace(-1500, 4300, 1000);
y_linspace = (9.94e3 * x_linspace) + 1.26e7;
hold on
plot(x_linspace, y_linspace, '--k')
xlabel("Reciprocal [S] / M^{-1}")
ylabel("Reciprocal reaction velocity / s mol^{-1} ")
legend("Experimental Data", "Least Squares Regression Equation")
hold off

x_normal = linspace(-1500, 4300, 1000);
y_normal = (9.94e3 * x_linspace) + 1.26e7;

x_comp_inhibited = linspace(-1500, 4300, 1000);
y_comp_inhibited = (15e3 * x_linspace) + 1.26e7;

x_uncomp_inhibited = linspace(-1500, 4300, 1000);
y_uncomp_inhibited = (9.94e3 * x_linspace) + 2.26e7;

plot(x_normal, y_normal, 'k--', x_comp_inhibited, y_comp_inhibited, 'k', x_uncomp_inhibited, y_uncomp_inhibited,  'k-.');
xlabel("Reciprocal [S] / M^{-1}")
ylabel("Reciprocal reaction velocity / s mol^{-1} ")
legend('Uninhibited','Competitive Inhibition','Uncompetitive inhibition')