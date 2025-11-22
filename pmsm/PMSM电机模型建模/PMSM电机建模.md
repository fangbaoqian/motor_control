# PMSM电机建模

## 1.数学模型

表贴式电机dq轴方程(SPMSM):
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

$$

$$
