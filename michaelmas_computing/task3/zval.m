function output = zval(tr, pr)
    A = (27*pr)/(64*tr^2);
    B = (pr)/(8*tr);
    coeff_vector = [1, -(B+1), A, -A*B];
    solutions = roots(coeff_vector);
    solution = max(solutions(imag(solutions)==0));
    if tr < 1 && solution <= 0.375*(pr/tr)
        output = NaN;
    else
        output = solution;
end