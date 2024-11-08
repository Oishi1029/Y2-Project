%ungapped core

A_core_inMM = 97.1;
A_core_inM = 97.1*10^-6;
A_l = 2600e-9; %tolerance not included yet
f_operating = 100e3;
T_operating = 1/f_operating;
Vout = 8; 
Vin = 35;
d = Vout/Vin;
Vs = 35;
fluxDensity_max = 0.7*(200e-3);
inductor_rms_current = 2.64584; %obtained from simulation
magnetising_rms_current = 0.1*inductor_rms_current;


VTA = Vs*d*T_operating

Lmag = VTA/magnetising_rms_current

N = sqrt(Lmag/A_l)






%not using it
length_core_inMM = 78.6;
length_core_inM = 78.6*10^-3;
relative_permeability = 1670;
permeability = 4*pi*10^-7;
reluctance = length_core_inM/(A_core_inM*permeability*relative_permeability)
