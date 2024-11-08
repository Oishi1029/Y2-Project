%format long
format short

%initialize array
area_copperWire = [0,0,0,0,0];
N_min = [0,0,0,0,0];
N_max = [0,0,0,0,0];
Kfill_calculated = [0,0,0,0,0]
result_calculated = [0,0,0,0,0]
result_required = [0,0,0,0,0]

%adjust the tolerance accordingly, can explain in report for different
%Kfill value
diameter_windingWindow_MIN_inMM = 6.8-0.35;  


diameter_windingWindow_MIN_inM = diameter_windingWindow_MIN_inMM*10^-3;
A_windingWindow = pi*(diameter_windingWindow_MIN_inM/2)^2

A_core = 1.22e-5; %TN13
numOfTurn_calculated = 18;

%adjust the tolerance accordingly, can explain in report for different
%Kfill value
diameter_copperWire = [0.884e-3,0.789e-3,0.63e-3,0.367e-3,0.312e-3];
diameter_copperWire_withMaxTolerance = [0.892e-3,0.796e-3,0.636e-3,0.371e-3,0.316e-3]; 

Kfill_min = 0.2;
Kfill_max = 0.4;

Kfill_required = [0,0,0,0,0.3]
numOfTurn_required = [0,0,0,0,0]


for i = 1:5
    display(i)
    area_copperWire(i) = pi*(diameter_copperWire_withMaxTolerance(i)/2)^2
    Kfill_calculated(i) =  (3*numOfTurn_calculated*area_copperWire(i))/A_windingWindow
    
    condition_left_required = Kfill_required(i)*A_windingWindow
    condition_right_required = 3*numOfTurn_calculated*area_copperWire(i)
    
    if condition_left_required > condition_right_required
    result_required(i) = 1
    else 
    result_required(i) = 0
    end
    
end
