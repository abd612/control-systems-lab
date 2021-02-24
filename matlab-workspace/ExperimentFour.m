%% Experiment Four: Modeling of Inverted Pendulum

%% Variables

M = 0.5;
m = 0.2;
b = 0.1;
l = 0.3;
I = 0.006;
g = 9.8;

%% Transfer Function

num1 = [(m*l)/((M+m)*(I+m*l^2)-(m*l)^2) 0 0];
den1 = [1 (b*(I+m*l^2))/((M+m)*(I+m*l^2)-(m*l)^2) (-g*m*l*(M+m))/((M+m)*(I+m*l^2)-(m*l)^2) (-b*g*m*l)/((M+m)*(I+m*l^2)-(m*l)^2) 0];

H1 = tf(num1,den1);

num2 = [(I+m*l^2)/((M+m)*(I+m*l^2)-(m*l)^2) 0 (-m*g*l)/((M+m)*(I+m*l^2)-(m*l)^2)];
den2 = [1 (b*(I+m*l^2))/((M+m)*(I+m*l^2)-(m*l)^2) (-g*m*l*(M+m))/((M+m)*(I+m*l^2)-(m*l)^2) (-b*g*m*l)/((M+m)*(I+m*l^2)-(m*l)^2) 0];

H2 = tf(num2,den2);

num = [num1;num2];
den = den1;

H = [H1;H2]

%% Poles, Zeros, Gain

[z,p,k] = tf2zp(num,den)

%% Pole Zero Plot

pzmap(H)

%% Bode Plot

bode(H)

%% State Space

[A,B,C,D] = tf2ss(num,den);
SS1 = ss(A,B,C,D)

size(SS1)

%% Impulse Response

impulse(H,1)

syms s t;
Oi = poly2sym(num1,s)/poly2sym(den1,s);
Oi = vpa(Oi,3);
oi = ilaplace(Oi,t);
oi = vpa(oi,3)

Xi = poly2sym(num2,s)/poly2sym(den2,s);
Xi = vpa(Xi,3);
xi = ilaplace(Xi,t);
xi = vpa(xi,3)

%% Step Response

stepplot(H,1)

Os = (poly2sym(num1,s)/poly2sym(den1,s))/s;
Os = vpa(Os,3);
os = ilaplace(Os,t);
os = vpa(os,3)

Xs = (poly2sym(num2,s)/poly2sym(den2,s))/s;
Xs = vpa(Xs,3);
xs = ilaplace(Xs,t);
xs = vpa(xs,3)

%% Credits
% 
% * *Muhammad Abdullah*
% * *2015-EE-166*
%   