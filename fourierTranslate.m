function [ output ] = fourierTranslate( filename )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

f  = imread(filename);
z = fft2(double(f)); % do fourier transform
q= fftshift(z); % puts u=0,v=0 in the centre
output = q;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% w = ifft2(ifftshift(q)); % do inverse fourier transform
% imagesc(w); 



end
