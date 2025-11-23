clc;
clear;

% motor param
Rs = 1.2;
Ld = 0.0057;
Lq = 0.0125;
Lambda_f = 0.03;
pole = 4;
J = 0.00016;
B = 0.0000028;

% control param
% ---------d轴-----------------
Nd = 1/Ld;
Dd = Rs/Ld;

wd = 1000; %d轴电流环带宽
Kp_id = wd/Nd;
Ki_id = Dd*wd/Nd;
fprintf("d轴:kp = %d, ki = %d\n", Kp_id, Ki_id);

% ---------q轴-----------------
Nq = 1/Lq;
Dq = Rs/Lq;
wq = 1000; %q轴电流环带宽
Kp_iq = wq/Nq;
Ki_iq = Dq*wq/Nq;
fprintf("q轴:kp = %d, ki = %d\n", Kp_iq, Ki_iq);

ws = 100; %速度环带宽
Ns = 1/J;
Ds = B/J;
Kp_w = ws/Ns;
Ki_w = Ds*ws/Ns;
fprintf("转速环:kp = %d, ki = %d\n", Kp_w, Ki_w);




