%% Experiment One: Modeling of R-C Circuit

%% Variables
R = 10e3;
C = 0.1e-6;

%% Transfer Function
s = tf('s');
H = s /(s + 1/(R*C))

%% Zeros, Poles, Gain
[z p k] = zpkdata(H)

%% Step Response
step(H)

%% Transfer Function (T-Domain)
syms s t;
H = s /(s + 1000);
h = ilaplace(H,t)

%% Step Response (T-Domain)
G = 1 /(s + 1000);
g = ilaplace(G,t)

%% Credits
% 
% * *Muhammad Abdullah*
% * *2015-EE-166*
% 