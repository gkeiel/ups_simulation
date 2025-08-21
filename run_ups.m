clc; clear; close all;

% design specifications
n_h   = 1;         % number of resonant modes
xi    = 0;         % damping factor of resonant modes
alpha = 200;        % smallest real part of closed-loop poles 
pnlt  = 3;         % state penalty on guaranteed-cost

% general specifications
load  = 1;         % select load [1 linear, 2 nonlinear]
f     = 60;        % voltage reference frequency [Hz]
fa    = 10020;     % sampling frequency [Hz]
fs    = fa;        % switching frequency [Hz]
Ts    = 1/(100*fa);% fundamental sampling period [s] (simulation step-size)
T     = 1/fa;      % sampling period [s]
t_end = 2;         % simulation time [s]
t_ini = 0.8333; 
t_fin = 1.1667;       

% settings
ups_settings

% controller design and discretization
ups_controller_design

% run simulation
open_system('ups_control')
sim ups_control

% results: figures and tables
ups_results