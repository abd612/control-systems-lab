%% Experiment Six: Introduction to PID Controller

%% Variables

m = 1;
b = 10;
k = 20;
F = 1;
t = 0:0.01:2;

%% Open Loop Response

s = tf('s');
P = 1 / (m*s^2 + b*s + k)
step(P,t)
stepinfo(P)
%%
bode(P)

%% Proprtional Controller

Kp = 300;
C = pid(Kp);
T = feedback(C*P,1)
step(T,t)
stepinfo(T)
%%
bode(T)

%% Proprtional Derivative Controller

Kp = 300;
Kd = 10;
C = pid(Kp,0,Kd);
T = feedback(C*P,1)
step(T,t)
stepinfo(T)
%%
bode(T)

%% Proprtional Integral Controller

Kp = 30;
Ki = 70;
C = pid(Kp,Ki);
T = feedback(C*P,1)
step(T,t)
stepinfo(T)
%%
bode(T)

%% Proprtional Integral Derivative Controller

Kp = 350;
Ki = 300;
Kd = 50;
C = pid(Kp,Ki,Kd);
T = feedback(C*P,1)
step(T,t)
stepinfo(T)
%%
bode(T)

%% Credits
% 
% * *Muhammad Abdullah*
% * *2015-EE-166*
% 