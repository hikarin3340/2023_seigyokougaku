R  = 3.2;
L  = 0.9 * 10^(-3);
J  = 4.7 * 10^(-6);
mu = 9.0 * 10^(-5);
Kt = 0.47;
Ke = 4.9 * 10^(-3);
C = 10^(0.2);

P = Kt/( L*J*s^3 + (R*J + L*mu)*s^2 + (R*mu + Ke * Kt)*s );
L = P * C;
Y = L/.(1);
c_sys = syslin('c', L);

[gm,  fp] = g_margin(c_sys);
[phm, fg] = p_margin(c_sys);
printf("L(s)\r\n");
printf('ゲイン余裕 Gm[dB]:%f\r\n',gm);
printf('位相交差周波数 fp[Hz]:%f\r\n',fp);
printf('位相余裕 Pm[deg]:%f\r\n',phm);
printf('ゲイン交差周波数 fg[Hz]:%f\r\n',fg);

bode([c_sys],['L(s)']);
