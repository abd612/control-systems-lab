%% Experiment Five: Time Response of First and Second Order Systems

%% First Order Systems: Single Case

%%
% *Variables*
R1 = 1e3;
C1 = 0.1e-6;

%%
% *Transfer Function*
num1 = [1/(R1*C1)];
den1 = [1 1/(R1*C1)];
H1 = tf(num1,den1)

%% 
% *Poles*
p = pole(H1)

%%
% *Pole Zero Plot*
pzmap(H1)

%% 
% *Bode Plot*
bode(H1)

%%
% *Step Response Equation*
syms s t;
V1 = (poly2sym(num1,s)/poly2sym(den1,s))/s;
v1 = ilaplace(V1,t);
v1 = vpa(v1,3)

%% 
% *Step Plot*
step(H1)

%%
% *Parameters*
S1 = stepinfo(H1)
Tc1 = R1*C1

%% Second Order Systems: Case 1 (Under Damped)

%% 
% *Variables*
R3 = 250;
L3 = 99e-3;
C3 = 0.1e-6;

%% 
% *Transfer Function*
num3 = [1/(L3*C3)];
den3 = [1 R3/L3 1/(L3*C3)];
H3 = tf(num3,den3)

%%
% *Poles*
p = pole(H3)

%%
% *Pole Zero Plot*
pzmap(H3)

%%
% *Bode Plot*
bode(H3)

%%
% *Step Response Equation*
syms s t;
V3 = (poly2sym(num3,s)/poly2sym(den3,s))/s;
v3 = ilaplace(V3,t);
v3 = vpa(v3,3)

%%
% *Step Plot*
step(H3)

%%
% *Parameters*
S3 = stepinfo(H3, 'RiseTimeLimits', [0,1])

%% Second Order Systems: Case 2 (Critically Damped)

%%
% *Variables*
R4 = 2e3;
L4 = 99e-3;
C4 = 0.1e-6;

%%
% *Transfer Function*
num4 = [1/(L4*C4)];
den4 = [1 R4/L4 1/(L4*C4)];
H4 = tf(num4,den4)

%%
% *Poles*
p = pole(H4)

%%
% *Pole Zero Plot*
pzmap(H4)

%%
% *Bode Plot*
bode(H4)

%%
% *Step Response Equation*
syms s t;
V4 = (poly2sym(num4,s)/poly2sym(den4,s))/s;
v4 = ilaplace(V4,t);
v4 = vpa(v4,3)

%%
% *Step Plot*
step(H4)

%%
% *Parameters*
S4 = stepinfo(H4, 'RiseTimeLimits',[0,1])

%% Second Order Systems: Case 3 (Over Damped)

%%
% *Variables*
R5 = 4e3;
L5 = 99e-3;
C5 = 0.1e-6;

%%
% *Transfer Function*
num5 = [1/(L5*C5)];
den5 = [1 R5/L5 1/(L5*C5)];
H5 = tf(num5,den5)

%%
% *Poles*
pole(H5)

%%
% *Pole Zero Plot*
pzmap(H5)

%%
% *Bode Plot*
bode(H5)

%%
% *Step Response Equation*
syms s t;
V5 = (poly2sym(num5,s)/poly2sym(den5,s))/s;
v5 = ilaplace(V5,t);
v5 = vpa(v5,3)

%%
% *Step Plot*
step(H5)

%%
% *Parameters*
S5 = stepinfo(H5,'RiseTimeLimits',[0,1])

%% Second Order Systems: Overview

%% 
% *Pole Zero Map*
pzmap(H3,H4,H5)

%% Credits
% 
% * *Muhammad Abdullah*
% * *2015-EE-166*
% 