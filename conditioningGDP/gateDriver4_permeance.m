%to calculate permeance of core

A_core = 1.22e-5; %TN13
Al = 1170*10^-9;
Lmag = Al*N^2
permeability = 4*pi*10^-7;
relative_permeability = 2300;
length_core = 0.0301;

reluctance = length_core/(A_core*permeability*relative_permeability)
permeance = 1/reluctance
