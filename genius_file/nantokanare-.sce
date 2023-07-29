R  = 3.2;
L  = 0.9 * 10^(-3);
J  = 4.7 * 10^(-6);
mu = 9.0 * 10^(-5);
Kt = 0.47;
Ke = 4.9 * 10^(-3);

P = Kt/( L*J*s^3 + (R*J + L*mu)*s^2 + (R*mu + Ke * Kt)*s );
L = P;

c_sys = syslin('c', L);

[gm,  fg] = g_margin(c_sys);
[phm, fp] = p_margin(c_sys);

disp('ゲイン余裕[dB]',gm);
disp('位相交差周波数[Hz]',fg);
disp('位相余裕[dB]',phm);
disp('ゲイン交差周波数[Hz]',fp);
