R  = 3.2;
L  = 0.9 * 10^(-3);
J  = 4.7 * 10^(-6);
mu = 9.0 * 10^(-5);
Kt = 0.47;
Ke = 4.9 * 10^(-3);

t = 0:0.001:0.2;
P = Kt/( L*J*s^3 + (R*J + L*mu)*s^2 + (R*mu + Ke * Kt)*s );


C7 = 10^(0.2);
L7 = P * C7;
Y7 = L7 /.(1);
c_sys7 = syslin('c', Y7);
y7 = csim('step', t, c_sys7);


K8 = 10.88;
alpha8 = 0.1;
T8 = 8 / (2 * %pi * 26 * alpha8); 
C8 = K8* (1 + alpha8 * T8 * s) / (1 + T8 * s); //タクシを信じる
L8 = P * C8;
Y8 = L8 /.(1);
c_sys8 = syslin('c', Y8);
y8 = csim('step', t, c_sys8);


K9 = 10;
phi9 = 40 + 2.97; 
alpha9 = 5.28;
T9 = 1 / (2 * %pi * 140 * sqrt(alpha9));
C9 = K9* (1 +  alpha9 * T9 * s) / (1 + T9 * s);
L9 = P * C9;
Y9 = L9/.(1);
c_sys9 = syslin('c', Y9);

y9 = csim('step', t, c_sys9);

plot2d(t, y7, 1);
plot2d(t, y8, 2);
plot2d(t, y9, 5);
legend(["ゲイン補償器", "位相遅れ", "位相進み"],4);
