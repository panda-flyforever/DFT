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
X = zeros(N,1); % Initializing X with a matrix of N-by-1
t=0:N-1;k=t;
tic
% Twiddle factor W and matrix calculation
W=exp(-j*2*pi/N*(t'*k)); 
X=W*x'; % Compute the DFT as a product of the twiddle factors matrix with input vector x
timeElapsed = toc

% divides the current figure into a 3-by-1 grid and creates axes for position 1
subplot(311); % plots entries in Time against corresponding entries of Amplitude
stem(t,x); % Plot discrete sequence data
xlabel('Time (s)'); % show label on x axis
ylabel('Amplitude'); % show label on y axis
title('Time domain - Input sequence') % show title of graph

subplot(312); % plots magnitude in frequency domain
stem(t,X); 
xlabel('Frequency');
ylabel('|X(k)|');
title('Frequency domain - Magnitude response')

subplot(313); % plots phase in frequency domain
stem(t,angle(X)); 
xlabel('Frequency');
ylabel('Phase');
title('Frequency domain - Phase response');

X         % to check |X(k)|
angle(X)  % to check phase
% saving the DFT output frequencies in a text file names output.txt
csvwrite('output.txt',X); 