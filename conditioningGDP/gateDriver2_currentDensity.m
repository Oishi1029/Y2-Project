%this file is to filter the 5 wire provided via calculating whether which wire produce current density below 3A/mm^2

f_operating = 100e3;

%to calculate skin depth
freeSpaceP = 4*pi*10^-7; 
relativeP_copperWire = 0.999994; % 3C90
resistivity_copperWire = 1.68e-8;
skinDepth = sqrt(resistivity_copperWire/(pi*f_operating*relativeP_copperWire*freeSpaceP))


L_magGateDriver = 349e-6;
Vs_gateDriver = 15;
d_gateDriver = 0.45;
T_gateDriver = 1/f_operating;
VTA = (Vs_gateDriver*d_gateDriver*T_gateDriver);
currentMagnetisingGateDriver = VTA/L_magGateDriver


diameter_copperWire = [0.884e-3,0.789e-3,0.63e-3,0.367e-3,0.312e-3];
conversion_factor = 1e6;  % 1,000,000 (10^6)

%initialize arrays
area_copperWire = [0,0,0,0,0]
area_skindepth = [0,0,0,0,0];
area_empty = [0,0,0,0,0];
radius_empty = [0,0,0,0,0];
radius_copperWire = [0,0,0,0,0];
debug = [0,0,0,0,0];
currentDensity_copperWire = [0,0,0,0,0];
currentDensity_copperWire_inMM = [0,0,0,0,0];

for i = 1:5
    display(i)
    
    radius_copperWire(i) = diameter_copperWire(i)/2

    radius_empty(i) = (diameter_copperWire(i)-2*skinDepth)/2

    debug(i) = radius_copperWire(i)-skinDepth

    area_copperWire(i) = pi*(diameter_copperWire(i)/2)^2

    area_empty(i) = pi*(radius_empty(i))^2

    area_skindepth(i) = area_copperWire(i) - area_empty(i)

    currentDensity_copperWire(i) = currentMagnetisingGateDriver./area_skindepth(i)

    currentDensity_copperWire_inMM(i) = currentDensity_copperWire(i) / conversion_factor
end








