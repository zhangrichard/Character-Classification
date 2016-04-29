function [ q,output ] = plotFourier( filename )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
figure
f  = imread(filename);
z = fft2(double(f)); % do fourier transform
q = fftshift(z); % puts u=0,v=0 in the centre
Magq = abs(q); % magnitude spectrum
Phaseq=angle(q); % phase spectrum
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Usually for viewing purposes:
output  =q;
imagesc(log(abs(q)+1));
colorbar;
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% w = ifft2(ifftshift(q)); % do inverse fourier transform
% imagesc(w); 



end

