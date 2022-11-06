function error = linear_error_calc(find_error , function_of, uncertainty)
    for i = 1:length(find_error)
        error(i) = (uncertainty / function_of(i)) * find_error(i);
    end
end

