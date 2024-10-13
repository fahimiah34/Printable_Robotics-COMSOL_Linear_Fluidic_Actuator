clc
clear
close all 

% Importing analytical data

Analytical = 'Lab 4 Python Data.csv'; 

data = readtable(Analytical);  

P_analytical = data{:,1}; 
P_analytical_kpa = P_analytical / 1000; 
D_displacement = data{:,2};

% Pressure

P = 0:10:100; 

% Experimental Data 

D_experimental = [0, 1.55, 2.48, 3.27, 4.82, 5.85, 7.16, 8.23, 9.97, 10.96, 11.87];
D_linearized_exp = polyfit(P, D_experimental,1); 
D_linearized_exp_1 = polyval(D_linearized_exp, P);

% Comsol Data 

D_comsol = [0, 1.2535, 2.5070, 3.7605, 5.0139, 6.2674, 7.5209, 8.7744, 10.028, 11.281, 12.535]; 
D_linearized_comsol = polyfit(P, D_comsol,1); 
D_linearized_comsol_1 = polyval(D_linearized_comsol, P);


figure(1)
plot(P, D_linearized_exp_1); 
hold on 
plot(P_analytical_kpa, D_displacement); 
hold on 
plot(P, D_linearized_comsol_1); 
hold on 
legend('Experimental Data', 'Analytical Data', 'Numerical Data', 'Location','southeast')
xlabel('Pressure (kPa)')
ylabel('Displacement (mm)')
title('Displacement vs. Pressure of our Linear Actuator')



