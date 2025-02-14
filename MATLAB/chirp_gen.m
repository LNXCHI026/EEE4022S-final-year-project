fs=205900;
f0=38e3;
f1=42e3;
ts=1/fs;
B=f1-f0;
T=100/B;
N=round(T/ts);
t =(0:ts:(T-ts));
y=round(chirp(t,f0,t(end),f1)*2000+2047);
% y=round(((2^11)/1.1-1)*(cos(2*pi*(fc*(t - T/2) + 0.5*K*(t - T/2).^2) ).* rect( (t - T/2)/T )+1.1));
s=sprintf('%d, %d, %d, %d, %d, %d, %d, %d, \n',y);
disp(s);
plot(t,y);
frequency=(-N/2:1:(N/2-2))*fs/N;
f=fftshift(fft(y));
figure(2);plot(frequency,20*log10(abs(f)));