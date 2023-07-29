R  = 3.2;
L  = 0.9 * 10^(-3);
J  = 4.7 * 10^(-6);
mu = 9.0 * 10^(-5);
Kt = 0.47;
Ke = 4.9 * 10^(-3);

K = 3.5;
alpha = 0.3;

T = 8 / (2 * %pi * 26 * alpha);
C = K* (1 + alpha * T * s) / (1 + T * s);

P = Kt/( L*J*s^3 + (R*J + L*mu)*s^2 + (R*mu + Ke * Kt)*s );
L = P * C;
Y = L / (1 + L);
c_sys = syslin('c', C);

bode([c_sys],['C(s)']);
