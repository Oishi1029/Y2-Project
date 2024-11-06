area_copperWire = [0,0,0,0,0]
A_core = 1.22e-5; %TN13
numOfTurn = 17;

%initialize array
fillFactor = [0,0,0,0,0];

for i = 1:5
    area_copperWire(i) = pi*(diameter_copperWire(i)/2)^2
    fillFactor(i) = (3*numOfTurn*area_copperWire(i))/A_core
end
