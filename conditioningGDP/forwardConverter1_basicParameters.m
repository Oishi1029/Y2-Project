


fsw = 100*10^3;
T = 1/fsw;
Vout = 8; 
Vin = 35;
voltage_ripple = 0.1*Vout;

D = Vout/Vin;
R_min = 5;
R_rated = 1.25;

Lcrit = ((1-D)*R_rated)/(2*fsw);
L = 10* Lcrit

Ipp_inductor = (Vout*(1-D)*T)/L;
Ipp_capacitor = Ipp_inductor/2;


C = ((1/2)*(T/2)*(Ipp_capacitor))/(voltage_ripple)

turnRatio = Vout/(D*Vin); % at page 32 haider lecture 4

Iq_max=12;

N1 = 1; 
N2 =1;

Iout = Vout/R_min;

I_inductor_max = (Ipp_inductor/2)+Iout;

Imag_max = Iq_max - (N2/N1)*I_inductor_max;

Ipp_mag = Imag_max;

L_mag = (D*T*Vin)/Ipp_mag


























