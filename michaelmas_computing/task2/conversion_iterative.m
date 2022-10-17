function best_iterative = conversion_iterative(~)
    d = 5.6;
    x = linspace(0,20,101);
    for i = 1:length(x)
        best_iterative(i) = fminsearch(@(y) (atan((x(i)-d/2)/y) - atan((x(i)+d/2)/y)), 0);
    end
    x1 = [0:0.1:best_iterative(101)];
    y1 = x1;
    plot(x,best_iterative,x1,y1,'r');
end

