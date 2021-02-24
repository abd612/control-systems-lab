%% Experiment Three: Modeling of Sallen-Key Low Pass Filter

%% Variables
R1 = 10e3;
R2 = 10e3;
R3 = 10e3;
R4 = 10;
RL = 1e3;

C1 = 10e-9;
C2 = 10e-9;

K = 1;

%% Transfer Function

num = [K/(R1*R2*C1*C2)];
den = [1 (R1*C1+R2*C1+R1*C2*(1-K))/(R1*R2*C1*C2) 1/(R1*R2*C1*C2)];

H = tf(num, den)

%% Poles, Zeros, Gain

[z,p,k] = tf2zp(num,den)

%% Pole Zero Plot

pzmap(H)

%% Bode Plot

bode(H)

%% State Space 2

[A,B,C,D] = tf2ss(num,den);
SS2 = ss(A,B,C,D)

size(SS2)

%% State Space 1

P = [0 1; -1e8 -2e4];
Q = [0; 1e8];
R = [1 0];
S = [0];

SS1 = ss(P,Q,R,S)

%% State Space to Transfer Function

[nu,de] = ss2tf(P,Q,R,S);

G = tf(nu,de)

%% Step Response

stepplot(H,0.001)

%% Credits
% 
% * *Muhammad Abdullah*
% * *2015-EE-166*
% 