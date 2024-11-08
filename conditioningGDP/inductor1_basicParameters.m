L = 4.8214e-05;
g = 0.5e-3;
AL = 251e-9;
permeability_air = 4*pi*10^-7
effectiveMagneticCrossSection_inM2 = 97.1e-6

N = sqrt((g*L)/(permeability_air*effectiveMagneticCrossSection_inM2)) %%%

I_max = 8.68654;

B_max = sqrt((permeability_air*L)/(g*effectiveMagneticCrossSection_inM2))*I_max %%%

I_rms = 5.84 %%%

diameter_copperWire_withMaxTolerance = [0.892,0.796,0.636,0.371,0.316]; 
A_turn = [0,0,0,0,0]
J = [0,0,0,0,0]

for i = 1:5
    display(i)
    A_turn(i) = pi*(diameter_copperWire_withMaxTolerance(i)/2)^2
    J(i) = I_rms/A_turn(i)
end


A_turn_prefer_inMM2 = A_turn(1)

A_cu_prefer_inMM2 = N*A_turn_prefer_inMM2

width_inMM = 25.4 - 13.4
height_inMM = 20.9
A_windingWindow_inMM2 = width_inMM*height_inMM 
%A_windingWindow_inMM2 = 122; %%%

Kfill = A_cu_prefer_inMM2/A_windingWindow_inMM2 %%%

diameter_copperWire_inM = sqrt((4*A_turn)/pi)
diameter_copperWire_inMM = diameter_copperWire_inM * 10^3

N
B_max

A_turn_prefer_inMM2
