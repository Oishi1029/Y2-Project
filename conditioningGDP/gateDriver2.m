f_operating = 100e3;

%to calculate skin depth
freeSpaceP = 4*pi*10^-7; 
relativeP_copperWire = 1; % 3C90
resistivity_copperWire = 1.68e-8;
skinDepth = sqrt(resistivity/(pi*f_operating*relativeP*freeSpaceP))

L_magGateDriver = 349e-6;
Vs_gateDriver = 15;
d_gateDriver = 0.45;
T_gateDriver = 1/f_operating;
VTA = (Vs_gateDriver*d_gateDriver*T_gateDriver);
currentMagnetisingGateDriver = VTA/L_magGateDriver


diameter_copperWire = [0.8e-3,0.7e-3,0.56e-3,0.315e-3,0.25e-3];
conversion_factor = 1e6;  % 1,000,000 (10^6)

%initialize arrays
area_copperWire = [0,0,0,0,0]
area_skindepth = [0,0,0,0,0];
area_empty = [0,0,0,0,0];
radius_empty = [0,0,0,0,0];
currentDensity_copperWire = [0,0,0,0,0];
currentDensity_copperWire_inMM = [0,0,0,0,0];

for i = 1:5
    radius_empty(i) = (diameter_copperWire(i)-2*skinDepth)/2

    area_copperWire(i) = pi*(diameter_copperWire(i)/2)^2

    area_empty(i) = pi*(radius_empty(i))^2

    area_skindepth(i) = area_copperWire(i) - area_empty(i)

    currentDensity_copperWire(i) = currentMagnetisingGateDriver./area_skindepth(i)

    currentDensity_copperWire_inMM(i) = currentDensity_copperWire(i) / conversion_factor
end



