
clc; clear; close all;

fs = 2000;                  
t  = 0:1/fs:1;              
fm = 5;                     
fc = 100;                   
mu = 0.8;                   

message = sin(2*pi*fm*t);
carrier = cos(2*pi*fc*t);

am_signal = (1 + mu * message) .* carrier;

rectified   = abs(am_signal);
demodulated = smooth(rectified, 80) * (pi/2) - 1; 

figure('Color', 'w');

subplot(3,1,1);
plot(t, message, 'b', 'LineWidth', 1.5);
title('1. Baseband Message Signal (5 Hz)');
ylabel('Amplitude'); grid on;

subplot(3,1,2);
plot(t, am_signal, 'r');
title('2. Amplitude Modulated (AM) Signal (Carrier = 100 Hz, \mu = 0.8)');
ylabel('Amplitude'); grid on;

subplot(3,1,3);
plot(t, demodulated, 'g', 'LineWidth', 1.5);
title('3. Recovered (Demodulated) Message Signal');
xlabel('Time (seconds)'); ylabel('Amplitude'); grid on;

saveas(gcf, 'am_waveforms.png');