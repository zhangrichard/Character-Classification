[f,map] = imread('characters/V1.GIF');    
z = fft2(double(f));
q = fftshift(z);
% twoFeature = [];
mag = abs(q);
logMag = log(mag+1);
log1 = logMag;
figure
imagesc(logMag);
colorbar;
hold off;
for i =2:10
    string = {'characters/V';'.GIF'};
    file = strcat(string(1),int2str(i),string(2));
%     plotFourier(char(file));
    logMag  = logMag+log(abs(fftshift(fft2(double(imread(char(file))))))+1);
%     z = fft2(double(f));
%     q = fftshift(z);
%     figure
%     imagesc(log(abs(q))+1);
%     colorbar;
%     hold off;

end 
aveq  = logMag/10;
figure
% imagesc(log(abs(aveq)+1));
imagesc(aveq);


colorbar;
hold off;


% select region 
% 100 150 400 500
% seperate t   from v s
data = aveq(100:150,400:500).^2;
feature1 = sum(data(:));



% ring seperate v from s

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

circleSelect = circlePixels.*aveq;
data2 = circleSelect.^2;
feature2 = sum(data2(:));
figure 

imagesc(circleSelect);
colorbar;
hold off

twoFeature = [twoFeature;feature1 feature2];