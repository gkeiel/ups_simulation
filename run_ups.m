clc; clear; close all;

% controller specifications
n_h   = 4;         % number of resonant modes
xi    = 0;         % damping factor of resonant modes
alpha = 250;       % smallest real part of closed-loop poles 
pnlt  = 3;         % state penalty on guaranteed-cost

% general specifications
load  = 2;         % select load [1 linear, 2 nonlinear]
f     = 60;        % voltage reference frequency [Hz]
fa    = 10020;     % sampling frequency [Hz]
fs    = fa;        % switching frequency [Hz]
Ts    = 1/(100*fa);% fundamental sampling period [s] (simulation step-size)
T     = 1/fa;      % sampling period [s]
t_end = 2;         % simulation time [s]
t_ini = 50/f +1/(4*f); 
t_fin = 70/f +1/(4*f);       

% settings
ups_settings

% controller design and discretization
ups_controller_design

% run simulation
open_system('ups_control')
sim ups_control

% results: figures and tables
ups_results