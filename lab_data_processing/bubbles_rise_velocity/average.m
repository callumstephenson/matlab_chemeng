function x = average(input)
    sum = 0;
    for i = 1:length(input)
        sum = sum + input(i);
    end
    x = sum / length(input);
end

