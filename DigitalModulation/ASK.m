clear;
clc;

%% Generate Signal
x = round(rand(1,8));
y = mydigplot(x);
t = 1/100:1/100:length(x);
figure(2);
subplot(5,1,1);
plot(t,y);grid on;
ylim([-0.5 1.5]);
xlim([0 length(x)]);
title('Digital Information Signal');

%% ASK Modulation
bp = 0.1;
A1=10;                      % Amplitude of carrier signal for information 1
A0=5;                       % Amplitude of carrier signal for information 0
br=1/bp;                                                         % bit rate
f=br*10;                                                 % carrier frequency 
t2=bp/99:bp/99:bp;

m = myaskmod(x,A0,A1,f,t2)

t3=bp/99:bp/99:bp*length(x);
subplot(5,1,2);
plot(t3,m);
title('ASK Modulated Signal');

%% AWGN
gn = awgn(m,20,'measured');
subplot(5,1,3);
plot(t3,gn);
title('ASK Modulated Signal with AWGN');

%% ASK Demodulation
mn = myaskdemod(m,t2,bp,f);

yd = mydigplot(mn);

t4=1/100:1/100:100*length(mn)*(1/100);
subplot(5,1,4)
plot(t4,yd);grid on;
ylim([-0.5 1.5]);
xlim([0 length(x)]);
title('ASK Demodulated Signal');

%% ASK Demodulation with AWGN
mnn = myaskdemod(gn,t2,bp,f);

yda = mydigplot(mnn);

subplot(5,1,5)
plot(t4,yda);grid on;
ylim([-0.5 1.5]);
xlim([0 length(x)]);
title('ASK Demodulated Signal with AWGN');
