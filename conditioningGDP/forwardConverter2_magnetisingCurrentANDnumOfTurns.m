%ungapped core

A_core_inMM = 97.1;
A_core_inM = 97.1*10^-6;
A_l = 2600e-9; %tolerance not included yet
f_operating = 100e3;
T_operating = 1/f_operating;
d = 0.45;
Vs = 35;
fluxDensity_max = 0.7*(200e-3);

VTA = Vs*d*T_operating
numOfTurn = VTA / (fluxDensity_max*A_core_inM)



length_core_inMM = 78.6;
length_core_inM = 78.6*10^-3;



relative_permeability = 1670;
permeability = 4*pi*10^-7;

reluctance = length_core_inM/(A_core_inM*permeability*relative_permeability)

Lmag = ((numOfTurn)^2)*A_l

magnetisingCurrent = (Vs*d*T_operating)/Lmag
