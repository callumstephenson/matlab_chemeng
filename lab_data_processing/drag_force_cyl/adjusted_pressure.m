function output = adjusted_pressure(m2_vals, theta_vals, m1_val)
        for i = 1:length(theta_vals)
            output(i) = ((m2_vals(i) - 5)/(m1_val - 5)) * (cos((theta_vals(i)*pi)/180));
        end
end
