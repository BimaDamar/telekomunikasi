clear;
clc;

%% Generate Signal
x = round(rand(1,8));
y = mydigplot(x);
t = 1/100:1/100:length(x);
figure(3);
subplot(5,1,1);
plot(t,y);grid on;
ylim([-0.5 1.5]);
xlim([0 length(x)]);
title('Digital Information Signal');

%% PSK Modulation
bp = 0.1;
A=5;                                          % Amplitude of carrier signal 
br=1/bp;                                                         % bit rate
f=br*2;                                                 % carrier frequency 
t2=bp/99:bp/99:bp;

m = mypskmod(x,A,f,t2);

t3=bp/99:bp/99:bp*length(x);
subplot(5,1,2);
plot(t3,m);
title('PSK Modulated Signal');

%% AWGN
gn = awgn(m,20,'measured');
subplot(5,1,3);
plot(t3,gn);
title('PSK Modulated Signal with AWGN');

%% PSK Demodulation
mn = mypskdemod(m,t2,bp,f);

yd = mydigplot(mn);

t4=1/100:1/100:100*length(mn)*(1/100);
subplot(5,1,4)
plot(t4,yd);grid on;
ylim([-0.5 1.5]);
xlim([0 length(x)]);
title('PSK Demodulated Signal');

%% PSK Demodulation with AWGN
mnn = mypskdemod(gn,t2,bp,f);

yda = mydigplot(mnn);

subplot(5,1,5)
plot(t4,yda);grid on;
ylim([-0.5 1.5]);
xlim([0 length(x)]);
title('PSK Demodulated Signal with AWGN');