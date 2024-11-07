%Al_max = (Al + 0.2*1015)*10^-9;
%Al_min = (Al - 0.2*1015)*10^-9;
Al = 1170*10^-9;
A_core = 1.22e-5; %TN13

delta_B = 300e-3; %obtain by obtaining average between 250 and 350 @https://electronics.stackexchange.com/questions/535955/how-to-calculate-number-of-turns-n-for-a-gate-driver-transformer
D = 0.23;
D2 = 0.45;
f_resonant = 10e3;
f_operating = 100e3;
f_turnOn = 1/(6.4*10^-9);
Vs = 15;

VTA = (D2*Vs)/f_operating;

N = VTA/(delta_B * A_core)

Lmag = Al*N^2
permeability = 4*pi*10^-7;
relative_permeability = 2300;
length_core = 0.0301;

reluctance = length_core/(A_core*permeability*relative_permeability)
L_mag2 = N^2/reluctance

C1 = 1/(4*(pi^2)*(f_resonant^2)*Lmag)

R1 = 50
R2=10*10^3

tau = 0.45 * (1/f_operating)
C2 = tau / (R1+R2)
