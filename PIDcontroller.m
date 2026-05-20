s = tf('s');
G = 5 / ((s+2)*(s+4)*(s+6));

[gm, pm, wg, wc] = margin(G);
Ku = gm;             
wu = wg;            
Pu = 2*pi/wu;     
fprintf('Ultimate Gain (Ku): %.2f\n', Ku);
fprintf('Oscillation Frequency (wu): %.2f rad/s\n', wu);

% P Controller
Kp_p = 0.5 * Ku;
C_p = Kp_p;

% PI Controller
Kp_pi = 0.45 * Ku;
Ti_pi = Pu / 1.2;
C_pi = Kp_pi * (1 + 1/(Ti_pi*s));

% PID Controller
Kp_pid = 0.6 * Ku;
Ti_pid = Pu / 2;
Td_pid = Pu / 8;
C_pid = Kp_pid * (1 + 1/(Ti_pid*s) + Td_pid*s);

sys_p = feedback(C_p*G, 1);
sys_pi = feedback(C_pi*G, 1);
sys_pid = feedback(C_pid*G, 1);

step(sys_p, sys_pi, sys_pid);
legend('P','PI','PID');
title('Step Response Comparison');
grid on;

margin(C_pid*G);