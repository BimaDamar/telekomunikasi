clear;
clc;

%% Generate Signal
x=round(rand(1,8));

y = mydigplot(x);

t = 1/100:1/100:length(x);
figure(1);
subplot(5,1,1);
plot(t,y);grid on;
ylim([-0.5 1.5]);
xlim([0 length(x)]);
title('Digital Information Signal');

%% FSK Modulation
fc0 = 3000;
fc1 = 6000;
f = 6000;
A = 4;
t2 = 0.1/99:0.1/99:0.1;

m = myfskmod(x,A,fc1,fc0,t2)

t3 = 1/99:1/99:length(x);
subplot(5,1,2);
plot(t3,m);
title('FSK Modulated Signal');

%% AWGN
gn = awgn(m,20,'measured');
subplot(5,1,3);
plot(t3,gn);
title('FSK Modulated Signal with AWGN');

%% FSK Demodulation
bp = 0.1;

mn = myfskdemod(m,t2,bp,A,fc1,fc0);
y = mydigplot(mn);

t4=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(5,1,4);
plot(t4,y);grid on;
ylim([-0.5 1.5]);
title('FSK Demodulated Signal');

%% FSK Demodulation with AWGN
mnn = myfskdemod(gn,t2,bp,A,fc1,fc0);
y = mydigplot(mnn);

subplot(5,1,5);
plot(t4,y);grid on;
ylim([-0.5 1.5]);
title('FSK Demodulated Signal with AWGN');