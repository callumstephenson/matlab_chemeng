function zvals = zval_vector(~)
    tr = linspace(0.2,2,10);
    pr = linspace(0,3,101);
    for i = 1:length(tr)
        for j = 1:length(pr)
            A = (27*pr(j))/(64*tr(i)^2);
            B = (pr(j))/(8*tr(i));
            coeff_vector = [1, -(B+1), A, -(A*B)];
            temp_val = roots(coeff_vector);
            temp_val = temp_val(imag(temp_val)==0);
            temp_val = max(temp_val);
            disp(temp_val);
            if tr < 1 & temp_val < (0.375*(pr(j)/tr(i)))
                zvals(i,j) = NaN;
            else
                zvals(i,j) = temp_val;
            end
        end
    end
    plot(pr, zvals)
    xlabel("Pressure / Pressure Crit")
    ylabel("Value of Z")
end