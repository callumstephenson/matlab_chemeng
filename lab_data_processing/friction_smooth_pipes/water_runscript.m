clear
% exp data
m_1 = [6, 8, 14, 20, 28, 40, 53, 59, 70, 85, 90, 95, 110, 119, 135, 158,...
    175, 204, 215, 232, 238] * 0.001;
m_2 = [11, 13, 17, 19, 22, 26, 29, 32, 35, 52, 64, 64, 75, 83, 92, 107,...
    117, 133, 141, 152, 156] * 0.001;

% phys data
rho_water = 998;
mu_water = 1e-3;
d_pipe = 0.007;
d_orifice = 0.0041;
beta = d_orifice / d_pipe;
L = 1.5;

for i = 1:length(m_1)

    % vel calc
    u(i) = 0.7 * beta.^2 * sqrt((2 * m_1(i) * 9.81 * rho_water)/ (rho_water * (1-beta.^2)));
    u_err(i) = u(i) * (0.0005/m_1(i));

    % re calc
    re(i) = rho_water * u(i) * d_pipe / mu_water;
    re_err(i) = re(i) * (0.0005/m_1(i));

    % cf calc
    cf(i) = (m_2(i) * 9.81 * 0.007 * rho_water) / (rho_water * 2 * L * u(i).^2);
    cf_err(i) = cf(i) * sqrt((0.001/m_2(i)).^2 + (u_err(i)/u(i)).^2);

        
    if re <= 2500
        cf_theoretical(i) = 16/re(i);
    else
        cf_theoretical(i) = 0.079 * re(i).^(-0.25);
    end
end

hold on
errorbar(re, cf, cf_err, cf_err, re_err, re_err, Color='#0072BD');
loglog(re, cf_theoretical, '-o', Color='#D95319');
set(gca, 'XScale','log', 'YScale','log')
xlabel("Reynold's Number")
ylabel("Moody Friction Factor")
grid on
legend("Experimental Data","Theoretical Calculation")