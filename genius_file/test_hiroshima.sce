// test_hiroshima-univ
// https://home.hiroshima-u.ac.jp/saeki/Appendix/ClassicalControl_Scilab.pdf
// p14
a = 1;
s = poly(0, 's');

P = syslin('c', 1/((s+1)^2));
K = syslin('c', a/s);
L = P*K;
pcl = L/(1+L);

//bode([pcl;L],['pcl';'L']);

t = 0:0.001:30;
y1 = csim('step', t, L);
y2 = csim('step', t, pcl);
//plot2d(t, y1, 1);
plot2d(t, y2, 1);
