wm=1;%被采信号最大频率
wc=1.1*wm;%滤波器频率
Ts=2;%采样频率
ws=2*pi/Ts;%采样角频率
n=-10:10;%定义序列长度为21
nTs=n*Ts;%采样点
f=sinc(nTs/pi);%被采样信号
Dt=0.005;t=-10:Dt:10;
fa=f*Ts*wc/pi*sinc((wc/pi)*(ones(length(nTs),1)*t-nTs'*ones(1,length(t))));%信号重建
error=sinc(t/pi)-fa;%误差e(t)

%采样信号图
figure;
stem(nTs,f);%绘制离散序列
xlabel('kTs');
ylabel('f(kTs)');
title('Ts=2时sa(t)的采样信号');
grid ;

%频谱图
figure;
w=-10:0.001:10;
ft=pi/Ts*rectpuls(w,2)+pi/Ts*rectpuls(w-ws,2)+pi/Ts*rectpuls(w+ws,2)+pi/Ts*rectpuls(w-2*ws,2)+pi/Ts*rectpuls(w+2*ws,2);
plot(w,ft);
grid;
ylim([-2 4]);
title('Ts=2时采样信号频谱')

%采样信号重建图
figure;
plot(t,fa);%绘图
xlabel('t');
ylabel('fa(t)');
title('Ts=2时由sa(t)采样信号重建sa(t)');
grid;%显示网格

%误差图
figure;
plot(t,error);
xlabel('t');
ylabel('error(t)');
title('Ts=2时Sa(t)与重建信号误差error(t)');
grid;




