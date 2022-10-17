function z_vals = zvalue(tr, pr)
    A = (27*pr)/(64*tr^2);
    B = (pr)/(8*tr);
    coeff_vector = [1, -(B+1), A, -(A*B)];
    temp_val = roots(coeff_vector);
    temp_val = temp_val(imag(temp_val)==0);
    if tr < 1 & temp_val < (0.375*(pr/tr))
        z_vals = NaN;
    else
        z_vals = max(temp_val);
    end
end