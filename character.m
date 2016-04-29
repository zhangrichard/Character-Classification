
% for i =1:10
%     string = {'characters/T';'.GIF'};
%     file = strcat(string(1),int2str(i),string(2));
%     plotFourier(char(file));
% %     z = fft2(double(f));
% %     q = fftshift(z);
% %     figure
% %     imagesc(log(abs(q))+1);
% %     colorbar;
% %     hold off;
% end 
% 
% f = imread('characters/S4.GIF');
% [M N] =size(f)
% % v = imread('characters/V1.GIF');
% % t = imread('characters/T1.GIF');
% % 
% z=fft2(double(f));
% q=fftshift(z);
% Magq = abs(q);
% logMag = log(abs(q));
% Phaseq = angle(q);
% % % hold off
% figure (1);
% magimg = log(abs(q)+1);
% 
% imagesc(Magq);
% colorbar;
% hold off
% figure
% imagesc(log(abs(q)+1));
% colorbar;
% hold off
% plotFourier('characters/S1.GIF');
% x= [140:160];
% y=[200:250];
% plotFourier('characters/T1.GIF');
% plotFourier('characters/V1.GIF');
% w = ifft2(ifftshift(q));
% figure;
% imagesc(Magq);
% size(w)
% http://www.cs.cf.ac.uk/Dave/CM0268/PDF/09_CM0268_Frequence_Space.pdf
% image = zeros(M,N);
% box = ones(64,64);
% % box at centre
% image(97:160,97:160) = box;
% figure(1);
% imshow(image);
% hold off
% u0 =100;
% u = 0:(M-1);
% v = 0:(N-1);
% idx = find(u>M/2);
% idy = find(v>N/2);
% u(idx) = u(idx)-M;
% v(idy) = v(idy)-N;
% [V,U] = meshgrid(v,u);
% D = sqrt(U.^2+V.^2);

figure(9)
% inner diameter, outer diameter center, and image size.
% First create the image.
imageSizeX = 640;
imageSizeY = 400;
[columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Next create the circle in the image.
centerX = 320;
centerY = 200;
innerRadius = 100;
outerRadius = 140;
array2D = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2;
circlePixels = array2D >= innerRadius.^2 & array2D <= outerRadius.^2;
figure
imshow(circlePixels,[]);
% circlePixels = (circlePixels);
% circlePixels is a 2D "logical" array.
% Now, display it.

% http://matlab.wikia.com/wiki/FAQ#How_do_I_create_a_ring.3F
magas = reshape(magimg,[640 400]);
result = (circlePixels).*magimg;
imagesc(result);
w = real(ifft2(ifftshift(circlePixels.*q)));
figure(10);
imshow(w);
% colormap([0 0 0; 1 1 1]);
title('Binary Image of a Ring', 'FontSize', 25);
% H = double(D<=u0);
% figure(3)
% imshow(fftshift(H));
% % low pass filter
% G  = z.*H;
% 
% g = real(ifft2(double(G)));
% figure(4);
% imshow(g);
% 
% F = fft2(double(image));
% figure(2);
% imshow(abs(fftshift(F)/256));
% figure(5);
% imhist(z);
% sober 
% A = imread('characters/A1.GIF');
% 
% fx = [-1 0 1;-2 0 2;-1 0 1];
% fy = [1 2 1; 0 0 0; -1 -2 -1];
% gx = conv2(double(A),double (fx))/8
% gy = conv2(double(A),double(fy))/8;
% mag = sqrt((gx).^2+(gy).^2);
% ang = atan(gy./gx);
% figure;imagesc(mag);
% axis off;colormap gray;
% feature  = [mag(1,:) mag(2,:)];

% figure; imagesc(ang); axis off; colormap gray;