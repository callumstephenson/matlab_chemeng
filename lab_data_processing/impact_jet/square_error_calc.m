function [absl_error] = square_error_calc(square_list, err_in_lin)
    for i = 1:length(square_list)
    absl_error(i) = 2 * sqrt(square_list(i)) * err_in_lin(i);
    end
end

