clear
% exp data
m_1 = [19, 25, 30, 35, 46, 55, 63, 75, 84, 99, 117, 128, 142, 159, 180,...
    193, 230, 258, 280, 305, 311, 342, 348, 369, 418] * 0.001;
m_2 = [14, 16, 19, 20, 21, 23, 25, 28, 32, 50, 66, 70, 80, 83,...
    94, 100, 120, 129, 137, 148, 155, 161, 171, 183, 203] * 0.001;

% phys data
rho_air = 1.20;
mu_air = 1.82e-5;
d_pipe = 0.007;
d_orifice = 0.004;
beta = d_orifice / d_pipe;
L = 1.5;

for i = 1:length(m_1)

    % vel calc
    u(i) = 0.7 * beta.^2 * sqrt((2 * m_1(i) * sind(20) * 9.81)/(1-beta.^2));
    u_err(i) = u(i) * (0.0005/m_1(i));

    % re calc
    re(i) = rho_air * u(i) * d_pipe / mu_air;
    re_err(i) = re(i) * (0.0005/m_1(i));

    % cf calc
    cf(i) = (m_2(i) * sind(20) * 9.81 * 0.07) / (2 * L * u(i).^2);
    cf_err(i) = cf(i) * sqrt((0.001/m_2(i)).^2 + (u_err(i)/u(i)).^2);
end

hold on
errorbar(re, cf, cf_err, cf_err, re_err, re_err);
set(gca, 'XScale','log', 'YScale','log')