tr = linspace(0.2,2,10);
pr = linspace(0,3,101);
for i = 1:length(tr)
    for j = 1:length(pr)
        zvals(i,j) = zval(tr(i),pr(j));
    end
end
plot(pr, zvals)
xlabel("Pressure / Pressure Crit")
ylabel("Value of Z")