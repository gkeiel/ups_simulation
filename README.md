# UPS simulation and control

A program for simulation and control of uninterruptible power supply (UPS) systems. Considering an output stage comprising a half-bridge voltage source inverter (VSI) and output LC filter, it allows evaluating the operation of such electronic device under high-frequency switching and for different load conditions.

<div align="center">
<img width="620" height="248" alt="output_stage_ups" src="https://github.com/user-attachments/assets/a1fe8c03-079d-476c-b0bf-8c1114b15f5c"/>
</div>

The program contains the following file types:
- MATLAB scripts for settings and controller design
- Simulink implementation for control simulation
- PSIM implementation for UPS system simulation

Main file named as 'run_ups.m'.

##

An improved version of this program was used to design/evaluate efficient digital controllers before implementing them in real UPS systems.

The following figures show the UPS output voltage, $$v_o(t)$$, and output current, $$i_o(t)$$, waveforms considering a controller with excellent steady-state performance. The following reponse was obtained for linear load:

<div align="center">
<img width="480" height="384" alt="ups_h4_lin" src="https://github.com/user-attachments/assets/7ac7fb53-5727-496b-afc3-b964aec5bdd8"/>
</div>

The following reponse was obtained for non-linear load:
<div align="center">
<img width="480" height="384" alt="ups_h4_nlin" src="https://github.com/user-attachments/assets/3c69d625-a854-43f9-887c-3efc26e1bac3"/>
</div>

In sequence, the harmonic content distribution and THD obtained for the nonlinear load are presented, demonstrating the efficiency of disturbance rejection.
