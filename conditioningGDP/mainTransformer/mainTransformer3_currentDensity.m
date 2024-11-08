f_operating = 100e3;

%to calculate skin depth
freeSpaceP = 4*pi*10^-7; 
relativeP_copperWire = 0.999994; % 3C90
resistivity_copperWire = 1.68e-8;
skinDepth = sqrt(resistivity_copperWire/(pi*f_operating*relativeP_copperWire*freeSpaceP))


L_mag =  3.0236e-04;
Vout = 8; 
Vin = 35;
d = Vout/Vin;
T = 1/f_operating;
VTA = (Vs*d*T);
inductor_rms_current = 2.64584; %obtained from simulation
magnetising_rms_current = 0.1*inductor_rms_current;




diameter_copperWire = [0.884e-3,0.789e-3,0.63e-3,0.367e-3,0.312e-3];
diameter_copperWire_withMaxTolerance = [0.892e-3,0.796e-3,0.636e-3,0.371e-3,0.316e-3];
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
ratio = [0,0,0,0,0]

for i = 1:5
    display(i)
    
    radius_copperWire(i) = diameter_copperWire(i)/2
    
    if (diameter_copperWire(i)-2*skinDepth) > 0
    radius_empty(i) = (diameter_copperWire(i)-2*skinDepth)/2
    else
    radius_empty(i) = 0
    end
    debug(i) = radius_copperWire(i)-skinDepth

    area_copperWire(i) = pi*(radius_copperWire(i))^2

    area_empty(i) = pi*(radius_empty(i))^2

    area_skindepth(i) = area_copperWire(i) - area_empty(i)

    currentDensity_copperWire(i) = magnetising_rms_current./area_skindepth(i)

    currentDensity_copperWire_inMM(i) = currentDensity_copperWire(i) / conversion_factor

    if radius_copperWire(i)>skinDepth
    ratio(i) = area_skindepth(i)/area_copperWire(i)
    else
    ratio(i) = area_skindepth(i)/area_copperWire(i)
    end
end

skinDepth





