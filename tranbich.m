fs = 44100;
t = 0 : 1/fs : 0.5;
f1 = 440;
f2 = 329;
f3 = 391;
f4 = 130;
f5 = 195;
f6 = 261;
f7 = 310;
A1 = .3;
A2 = A1/2;
A3 = A1/3;
A4 = A1/4;
A5 = A1/5;
A6 = A1/6;
A7 = A1/7;
w = 90;
y1 = A1*sin(2*pi*f1*t+w);
y2 = A2*sin(2*pi*f2*t+w);
y3 = A3*sin(2*pi*f3*t+w);
y4 = A4*sin(2*pi*f4*t+w);
y5 = A5*sin(2*pi*f5*t+w);
y6 = A6*sin(2*pi*f6*t+w);
y7 = A7*sin(2*pi*f7*t+w);
y = [y1 y2 y3 y4 y5 y6 y7 y7 y6 y5 y4 y3 y2 y1 y7 y5 y3 y1]
a = audioread('orig_input.wav');
b = a';
u = y + (b(1:length(y)));
audiowrite('melody.wav',u,44100);
sound(u,44100);
Y = fft(u);
plot(abs(Y))
N = length(u);
transform = fft(u,N)/N;
magTransform = abs(transform);
faxis = linspace(-N/2, N/2, N);
plot(faxis,fftshift(magTransform));
xlabel('Frequency (Hz)')
win = 128;
hop = win/2;
nfft = win;
spectrogram(u,win,hop,nfft,fs,'yaxis')
yt = get(gca, 'YTick');
set(gca,'YTickLabel',sprintf('%.0f|',yt))
title('Spectrogram');




