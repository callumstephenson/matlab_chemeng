function zvals = zval_vector(~)
    tr = linspace(0.2,2,10);
    pr = linspace(0,3,101);
    for i = 1:length(tr)
        for j = 1:length(pr)
            A = (27*pr(j))/(64*tr(i)^2);
            B = (pr(j))/(8*tr(i));
            temp_val = fzero(@(Z) Z^3 - (B+1)*Z^2 + A*Z - A*B, 0.2);
            temp_val = temp_val(imag(temp_val)==0);
            if tr < 1 & temp_val < (0.375*(pr/tr))
                zvals(i,j) = NaN;
            else
                zvals(i,j) = max(temp_val);
            end
        end
    end
    plot(pr, zvals)
end