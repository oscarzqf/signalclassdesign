% 取样
figure(1);
wm = 1; %信号的最大频率
Ts = 2;%采样间隔
ws = 2 * pi/Ts; %信号的采样频率
wc = 1.1*wm;%滤波器的截止频率
N = 10;%时域采样点数
n = -N:N;
nTs = n * Ts;%采样数据的采样时间
fs = sinc(nTs/pi);%完成采样
subplot(311);
stem(nTs/pi,fs,'LineWidth',3);
xlabel("nTs");
ylabel("f(nTs)");
title("Ts=2时sa(t)的取样信号");
% 重建
Dt = 0.005;
t = -15:Dt:15;
fa = Ts*wc/pi * fs * sinc((wc/pi)*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));
subplot(312);
plot(t,fa,'LineWidth',3);
xlabel("t");
ylabel("f(t)");
title("由临界取样信号重构sa(t)");
% 展示误差
error = abs(fa-sinc(t/pi));
subplot(313);
plot(t,error,'LineWidth',3);
xlabel("t");
ylabel("error(t)");
title("重构信号与原信号的误差error(t)");
