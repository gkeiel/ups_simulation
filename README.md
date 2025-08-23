# UPS simulation and analysis

A program for simulation and analysis of uninterruptible power supply (UPS) systems. Considering an output stage consisting of a half-bridge voltage source inverter (VSI) and output LC filter, it allows evaluating the operation of such electronic device for high-frequency switching and under different load conditions.

<img width="1609" height="636" alt="ups" src="https://github.com/user-attachments/assets/82600272-e3f4-4b00-b8b2-e3fdac74765d"/>

The program contains the following file types:
- **MATLAB** scripts for general settings and controller design
- **Simulink** implementation for digital-control simulation
- **PSIM** implementation for power-electronics simulation

Main file named as 'run_ups.m'.

## Voltage regulation

The voltage regulator in UPSs aims to maintain the supplied output-voltage at quality levels accepted by standards such as IEC 62040-3. One solution for designing such output-voltage regulators are controllers based on the internal model principle (IMP), which in case of UPSs yield to the multi-resonant and repetitive controllers.

Consider a proportional-multiple-resonant (PMR) controller with transfer function

$$C(s) = k_{e} +\sum_{i=1,3,\dots}^{h}\frac{k_{{2i-1}} +k_{{2i}}s}{s^{2} +2\xi_{i}\omega_{r_i} s +\omega_{r_i}^{2}}$$

where $k_{e}$, $k_{{2i-1}}$, and $k_{{2i}}$ are gains to be determined, $\xi_{i}$ is the damping factor of the $i$-th resonant mode and $\omega_{r_i}$ the $i$-th multiple of the fundamental frequency $\omega_0$.

An appropriate design of $C(s)$, considering a sufficient number of resonant modes, results in UPS controllers allowing to perfectly follow a sinusoidal voltage reference and reject disturbances at harmonic frequencies caused by the connection of non-linear loads.

## Experimental results

An improved version of this program was used to design/analyze efficient digital controllers before implementing them in real UPS systems. In this context, the experimental result presented below aims to validate the applicability of such simulation enviroment.

Consider a desired sinusoidal output voltage with $V_{rms} = 127$ V, $\omega_0 = 2\pi 60$ rad/s. Assuming a PMR controller with 4 resonant modes presenting the transfer function

$$C(s) = k_{e} +\frac{k_{{1}} +k_{{2}}s}{s^{2} +2\xi_{1}\omega_{r_1} s +\omega_{r_1}^{2}} +\frac{k_{{5}} +k_{{6}}s}{s^{2} +2\xi_{3}\omega_{r_3} s +\omega_{r_3}^{2}} +\frac{k_{{9}} +k_{{10}}s}{s^{2} +2\xi_{5}\omega_{r_5} s +\omega_{r_5}^{2}} +\frac{k_{{13}} +k_{{14}}s}{s^{2} +2\xi_{7}\omega_{r_7} s +\omega_{r_7}^{2}}
$$

where $\omega_{r_1} = \omega_0$, $\omega_{r_3} = 3\omega_0$, $\omega_{r_5} = 5\omega_0$, $\omega_{r_7} = 7\omega_0$ and $\xi_{1,3,5,7} = 0$. For this occasion, after tuning gains through a desired criteria and applying the Tustin approximation with $T = 0.998\ \mu s$, the following discrete-time transfer function was obtained

$$C(z)
=\frac{6.9976 (z-0.9659) (z-0.9239)}{(z^2 - 1.999z + 1)}
+\frac{(z^2 - 1.945z + 0.9533)}{(z^2 - 1.987z + 1)}
+\frac{(z^2 - 1.938z + 0.9669)}{(z^2 - 1.965z + 1)}
+\frac{(z^2 - 1.913z + 0.9753)}{(z^2 - 1.931z + 1)}.
$$

The figures in sequence show the UPS output voltage, $v_o(t)$, and output current, $i_o(t)$, measured waveforms considering the above internal model principle (IMP) controller in a real UPS. The following response was obtained for linear load:

<div align="center">
<img width="480" height="384" alt="ups_h4_lin" src="https://github.com/user-attachments/assets/7ac7fb53-5727-496b-afc3-b964aec5bdd8"/>
</div>

The following response was obtained for non-linear load:
<div align="center">
<img width="480" height="384" alt="ups_h4_nlin" src="https://github.com/user-attachments/assets/3c69d625-a854-43f9-887c-3efc26e1bac3"/>
</div>
