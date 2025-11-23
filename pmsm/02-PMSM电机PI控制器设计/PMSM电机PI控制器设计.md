# PMSM电机控制

## 1.数学模型

电机dq轴方程:
$$
u_d = R_si_d+L_d\frac{di_d}{dt}-\omega_eL_qi_q
$$

$$
u_q = R_si_q+L_q\frac{di_q}{dt}+\omega_e(L_di_d+\Psi_r)
$$

转矩方程为:
$$
T_e = \frac{3}{2}\frac{P}{2}(\Psi_ri_q+(L_d-L_q)i_di_q)
$$
机械方程：
$$
T_{e}=J\frac{d\omega_e}{dt}+B\omega_e+T_L
$$

## 2.控制器设计

将电机dq轴模型重新整理：
$$
\frac{di_d}{dt}=\frac{1}{Ld}(-R_si_d+u_d+\omega_eL_qi_q)
$$

$$
\frac{di_q}{dt}=\frac{1}{Lq}(-R_si_q+u_q-\omega_e(L_di_d+\Psi_r))
$$
控制变量共有三个，分别是d轴电流、q轴电流和转子转速。

控制回路设计原则：

+ 由内而外：先设计内回路，再设计外回路。
+ 内回路的带宽为外葫芦带宽的5倍以上：以便于在设计外回路时，可以将内回路的传递函数看做1。



可以将电流回路划分为以下部分：

![image-20251123175005437](./assets/image-20251123175005437.png)

dq轴电流环设计思路：

1. 假设非线性耦合项已经被补偿掉，根据剩下线性部分设计PI控制器。
2. 使用前馈补偿掉非线性项。



控制参数matlab代码如下：

```matlab
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
```

simulink：

![image-20251123175134253](./assets/image-20251123175134253.png)
