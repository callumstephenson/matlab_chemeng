clear
% data
starts = [21.4, 21.4, 21.5, 21.8, 21.65];
middles = [42.59, 41.61, 41.97, 42.47, 42.04] - starts;
finishes = [64.5, 63.4, 64.7, 65, 64] - middles - starts;

% all simimlar therefore terminal velocity reached

distance = 0.05; %0
diameter = 0.00133; %pm0.01
rho = 2910; % pm10

dia_err_frac = 0.01 / 1.33;

vel_t = 3*distance / mean(finishes + middles + starts);
mu = (diameter.^2 * (2910 - 958) * 9.81) / (18 * vel_t);
delta_rho_err_frac = sqrt((10/2190).^2 + (1/958).^2);
mu_err = sqrt((3 * dia_err_frac).^2 + (1/mean(finishes + middles + starts)).^2);