% iron 3 is 0.075 M 
% thiosulfate is 0.1 M 
% KI is 0.4 M 
thiosulfate_vals = [2, 4, 6, 8, 10];
fe3_conc = 0.075 / 2;

for i = 1:length(thiosulfate_vals)
    thiosulfate_conc(i) = 0.5 * (thiosulfate_vals(i) / 100) * 0.1;
    fe3_excess(i) = fe3_conc - thiosulfate_conc(i);
end

t = [7.1, 16.9, 24.8, 33.2, 42.0] / 10.^2;
plot(t, log(fe3_excess), 'kx-')
xlabel("Time for colour change / s")
ylabel("Fe(iii) ion concentration at boundary mol / dm^3")

fit_fe3 = fit(t(:), log(fe3_excess(:)), 'Poly1');

delta = fe3_excess(1) / fe3_conc;

i_vals = [40, 50, 60, 65, 70];
for i = 1:length(i_vals)
    i_conc(i) = 0.5 * (i_vals(i) / 100) * 0.4;
end
time_2 = [34.1, 23, 15.7, 14.9, 9.5] / 10.^2;

plot(log(time_2), log(i_conc), 'kx-')
fit_iconc = fit(log(time_2(:)), log(i_conc(:)), 'Poly1');
xlabel("Time for colour change / s")
ylabel("Iodide ion concentration at boundary mol / dm^3")