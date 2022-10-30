diameter = [0.025, 0.025, 0.025, 0.05, 0.05, 0.05, 0.075, 0.075, 0.075];
density = [1000, 1030, 1066, 1000, 1030, 1066, 1000, 1030, 1066];
viscosity = [1, 1.15, 2.27, 1, 1.15, 2.27, 1, 1.15, 2.27];
v_crit = [0.15, 0.14, 0.16, 0.18, 0.22, 0.21, 0.27, 0.26, 0.27];

for i = 1:length(diameter)
    vcrit_group(i) = v_crit(i) / sqrt(diameter(i)*9.81);
    visco_group(i) = viscosity(i) / (density(i) * sqrt(diameter(i).^3 * 9.81));
end

plot(visco_group, vcrit_group, '*')
xlabel("dimensionless viscosity")
ylabel("dimensionless vcritical")