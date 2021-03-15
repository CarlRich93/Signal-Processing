clear all; close all; clc;

% discrete time
N =200; 
n = transpose(0:N-1);

% Tx signal s[n]
M = 20;
height = 1;
s = zeros(200,1);
s(1:M) = height; 

% Rx Signal with additive noise normally distributed, 0 mean and 0.25 variance 
n0 = 50; % delay
x = zeros(200,1);
x(n0+2:n0+M-1) = height;
x = x + 0.25*randn(200,1);

% Plotting data
figure(1);
plot(n,s,'b');
hold on
plot(n, x,'g');
title('Tx and Rx Signals');
xlabel('Time Samples');
legend('Tx Signal','Rx Signal');

% MLE
s_data = zeros(200,1);
J_vect = {};

for n0_est = 0:N-M-1
    s_data = circshift(s,n0_est);
    J = transpose(x-s_data)*(x-s_data);
    J_vect = [J_vect, J];
end

% find index of J_vect which corresponds to its minimum value
J_vect = cell2mat(J_vect);
[min, min_index] = min(J_vect)

% plotting MLE criteria
n0_est = 0:N-M-1;
figure(2);
plot(n0_est,J_vect,'r');
hold on
scatter(min_index,min,'bl');
title('MLE Objective Function');
xlabel('Lag, n0');
ylabel('J'); 