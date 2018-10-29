x = dlmread('amplitudes.dat'); % Read list of amplitudes from a data file 
N = length(x);
X = zeros(N,1); % Initializing X with a matrix of N-by-1

t=0:N-1;
k=t;
tic
W=exp(-j*2*pi/N*(t'*k)); % Twiddle factors matrix
X=W*x'; % Compute the DFT as a product of the twiddle factors matrix with input vector x
timeElapsed = toc

subplot(311); % divides the current figure into a 3-by-1 grid and creates axes for position 1
stem(t,x); % Plot discrete sequence data
xlabel('Time (s)'); % show label on x axis
ylabel('Amplitude'); % show label on y axis
title('Time domain - Input sequence') % show title of graph


subplot(312); 
stem(t,X); 
xlabel('Frequency');
ylabel('|X(k)|');
title('Frequency domain - Magnitude response')

subplot(313); 
stem(t,angle(X)); 
xlabel('Frequency');
ylabel('Phase');
title('Frequency domain - Phase response');

X         % to check |X(k)|
angle(X)  % to check phase
csvwrite('output.txt',X);
