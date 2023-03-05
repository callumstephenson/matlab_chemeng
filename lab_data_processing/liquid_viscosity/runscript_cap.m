clear

% data
c = 3;
c_err_frac = 0.07 / 3;

times = [268.5, 270.7, 271.5, 275.5, 274.7];
times_err_frac = times.^(-1); % allowing 1 second for human error.

rho = 958;

times_cum = 0;
times_cum_err = 0;
for i = 1:length(times)
    times_cum = times_cum + times(i);
    times_cum_err = times_cum_err + times_err_frac(i);
    if i == 5
        times_avg = times_cum / 5;
        times_avg_err = times_cum_err / 5;
    end
end

cp_err_frac = sqrt((0.07/3).^2 + (1/958).^2);
mu = rho * c * 10^(-6) * times_avg;
mu_err = mu * sqrt(cp_err_frac.^2 + times_avg_err.^2);
z = mu_err / mu;