R  = 3.2;
L  = 0.9 * 10^(-3);
J  = 4.7 * 10^(-6);
mu = 9.0 * 10^(-5);
Kt = 0.47;
Ke = 4.9 * 10^(-3);

C = 10^(0.2);
P = Kt/( L*J*s^3 + (R*J + L*mu)*s^2 + (R*mu + Ke * Kt)*s );
L = P * C;
Y = L / (1 + L);
c_sys = syslin('c', Y);

t = 0:0.001:0.5;
y1 = csim('step', t, c_sys);

K = 10^(0.2);
alpha = 0.8;
T = 8 / (43.875 * alpha);
C = K* (1 + T * s) / (1 + alpha * T * s);
P = Kt/( L*J*s^3 + (R*J + L*mu)*s^2 + (R*mu + Ke * Kt)*s );
L = P * C;
Y = L / (1 + L);
c_sys = syslin('c', Y);

y2 = csim('step', t, c_sys);

K = 10^(0.2);
deg2rad = %pi/180;
phi = 57.132 - 40; // Y(s))
alpha = -(sin(deg2rad* phi )+1)/(sin(deg2rad* phi )-1);
T = 1 / (2 * %pi * 140 * sqrt(alpha)); //Y(s))
C = K* (1 +  alpha * T * s) / (1 + T * s);
P = Kt/( L*J*s^3 + (R*J + L*mu)*s^2 + (R*mu + Ke * Kt)*s );
L = P * C;
Y = L / (1 + L);
c_sys = syslin('c', Y);

y3 = csim('step', t, c_sys);

plot2d(t, y1, 1);
plot2d(t, y2, 2);
plot2d(t, y3, 5);
legend(["ゲイン補償器", "位相遅れ", "位相進み"],4);
