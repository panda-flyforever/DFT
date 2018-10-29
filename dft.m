% program: dtf.m
% author: Rahul Sharma
% course: CS 827
% date: 2018/10/29
% assignment #2
% description: this program shows how to calculate DFT of a signal using twiddle  
% factor W and the matrix calculation in MATLAB. Input of this program is amplitudes.dat  
% file which contains all the amplitudes. Output is plotting of graphs along with the  
% frequencies calculates are expoirted to an output.txt file.
%---------------------------------------------------------------------------------------

x = dlmread('amplitudes.dat'); % Read list of amplitudes from a data file 
N = length(x);
X = zeros(N,1)
tic
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1)*exp(-j*pi/2*n*k)
    end
end
timeElapsed = toc
t = 0:N-1
subplot(311)
stem(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time domain - Input sequence')

subplot(312)
stem(t,X)
xlabel('Frequency');
ylabel('|X(k)|');
title('Frequency domain - Magnitude response')

subplot(313)
stem(t,angle(X))
xlabel('Frequency');
ylabel('Phase');
title('Frequency domain - Phase response')

X         % to check |X(k)|
angle(X)  % to check phase