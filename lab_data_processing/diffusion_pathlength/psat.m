function [saturated_pressure] = psat(T, chemical)
    a = chemical(1);
    b = chemical(2);
    c = chemical(3);
    i = a - (b / (T+c));
    saturated_pressure = 0.00133322 * exp(i);
end

