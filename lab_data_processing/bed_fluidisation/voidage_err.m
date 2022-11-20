function err = voidage_err(voidage, vol_bed, volbed_err, vol_par, volpar_err)
    num_err = (volbed_err.^2 + volpar_err.^2).^0.5;
    err = voidage * sqrt((num_err / vol_bed - vol_par).^2 + (volbed_err/vol_bed).^2);
end

