function minus_theta = rugby_conversion(x,y)
    d = 5.6;
    minus_theta = atan((x-d/2)/y) - atan((x+d/2)/y);
end

% y_best = fminsearch(@(y) rugby_conversion(10,y), 9) to show 9.6 is the
% best