%% Experiment Two: Modeling of Mass Spring Damper System

%% Variables
F = 1;
k = 1;
b = 0.9;
m = 2;

%% Transfer Function
num = [1/m];
den = [1 b/m k/m];
H = tf(num,den)

%% Poles
pole(H)

%% Zeros, Poles, Gain
[z p k] = tf2zp(num,den)

%% Pole Zero Plot
pzmap(H)

%% Bode Plot
bode (H)

%% Step Plot
stepplot(H)

%% Transfer Function
syms s;
H = 0.5 / (s^2 + 0.45*s + 0.5);
h = ilaplace(H);
h = vpa(h,3)

%% Step Response
X = 0.5 / (s^3 + 0.45*s^2 + 0.5*s);
x = ilaplace(X);
x = vpa(x,3)

%% Credits
% 
% * *Muhammad Abdullah*
% * *2015-EE-166*
% 
