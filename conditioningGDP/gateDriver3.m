area_copperWire = [0,0,0,0,0];
diameter_windingWindow_MIN_inMM = 6.8 - 0.35;
diameter_windingWindow_MIN_inM = diameter_windingWindow_MIN_inMM*10^-3;
A_windingWindow = pi*(diameter_windingWindow_MIN_inM/2)^2

A_core = 1.22e-5; %TN13
numOfTurn = 17;

%initialize array
fillFactor = [0,0,0,0,0];
diameter_copperWire = [0.884e-3,0.789e-3,0.63e-3,0.367e-3,0.312e-3];
conditionA = [0,0,0,0,0];
conditionB = [0,0,0,0,0];

for i = 1:5
    area_copperWire(i) = pi*(diameter_copperWire(i)/2)^2
    fillFactor(i) = (3*numOfTurn*area_copperWire(i))/A_windingWindow
    
end
