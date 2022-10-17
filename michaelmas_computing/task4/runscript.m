fzero(@(T) rachford_rice(T, 0.4, 0) , 273)
fzero(@(T) rachford_rice(T, 0.4, 1) , 375)

x = linspace(376.4,397.3,50);
for i = 1:length(x)
   list(i) = fzero(@(vf) rachford_rice(x(i), 0.4, vf), 0.5);
end
list
plot(x, list)