clear all; close all; clc;
load('delay.mat');

[r, lags] = xcorr(y,u); %returns cross correlation and their corresponding lags
[max, max_index] = max(r); %finding maximum argument of cross-correlation array
max_lag = lags(max_index); %lag which maximised cross-correlation

figure(1);
plot(lags,r,'b');
hold on
scatter(max_lag, max);
title('Cross-Correlation of Tx and Rx Signals as a Function of the Lag');
xlabel('Lag');
ylabel('Cross-Correlation');