function z_vals = zvalue(tr, pr)
    A = (27*pr)/(64*tr^2);
    B = (pr)/(8*tr);
    z_vals = fzero(@(Z) Z^3 - (B+1)*Z^2 + A*Z - A*B, 0.2);
    z_vals = z_vals(imag(z_vals)==0);
    z_vals = max(z_vals);
end