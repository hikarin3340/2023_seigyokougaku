R  = 3.2;
L  = 0.9 * 10^(-3);
J  = 4.7 * 10^(-6);
mu = 9.0 * 10^(-5);
Kt = 0.47;
Ke = 4.9 * 10^(-3);
C = 10^(0.4);

P = Kt/( L*J*s^3 + (R*J + L*mu)*s^2 + (R*mu + Ke * Kt)*s );
L = P * C;
Y = L / (1 + L);
c_sys = syslin('c', Y);

[gm,  fg] = g_margin(c_sys);
[phm, fp] = p_margin(c_sys);
printf('ゲイン余裕[dB]:%f\r\n',gm);
printf('位相交差周波数[Hz]:%f\r\n',fg);
printf('位相余裕[deg]:%f\r\n',phm);
printf('ゲイン交差周波数[Hz]:%f\r\n',fp);

bode(c_sys);
