function output = rachford_rice(T, z1, vf)
    benzene = [15.9008, 2788.51, -52.36];
    pxylene = [16.0963, 3346.65, -57.84];
    z2 = 1 - z1;
    psat1 = 0.00133322*exp(benzene(1) - benzene(2)/(T+benzene(3)));
    psat2 = 0.00133322*exp(pxylene(1) - pxylene(2)/(T+pxylene(3)));
    output = ((z1*(psat1 - 1))/(1 + (psat1 - 1) * (vf))) + ((z2*(psat2 - 1))/(1 + (psat2 - 1) * (vf)));
end
