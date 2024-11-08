L = 1.9286e-4;
g = 0.5e-3 ;
AL = 251e-9;
permeability_air = 4*pi*10^-7
effectiveMagneticCrossSection_inM2 = 97.1e-6
B_max = 400e-3;

N = sqrt(L/AL)

I_max = B_max/sqrt((permeability_air*L)/(g*effectiveMagneticCrossSection_inM2))

I_rms = 1.64
J = 5.2*10^6

A_turn = I_rms/J

A_cu = (N*I_rms)/J

A_cu_inMM2 = A_cu*10^6

A_windingWindow_inMM2 = 122;

Kfill = A_cu_inMM2/A_windingWindow_inMM2

diameter_copperWire_inM = sqrt((4*A_turn)/pi)
diameter_copperWire_inMM = diameter_copperWire_inM * 10^3
