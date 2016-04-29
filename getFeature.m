function [ twoFeatureS ] = getFeature( string )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
twoFeatureS = zeros(10,2);
avgV = zeros(400,640);
for i  = 1:10
    file =  strcat(string(1),int2str(i),string(2));
%     display(char(file));
    data = fourierTranslate(char(file));
    avgV = data+avgV;
    dataL = log(abs(data)+1);
% case one
%     f1 =dataL(50:100,50:100);
%     f2= dataL(100:150,330:360);
%     feature1 = std(f1(:));
%     feature2 = std(f2(:));
%     twoFeatureS(i,:) =  [feature1 feature2];
    
% % feature one
%     data1 = dataL(100:150,400:500).^2;
%     feature1 = sum(data1(:));
%     
% %     feature two
% imageSizeX = 640;
% imageSizeY = 400;
% [columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% % Next create the circle in the image.
% centerX = 320;
% centerY = 200;
% innerRadius = 100;
% outerRadius = 140;
% array2D = (rowsInImage - centerY).^2 ...
%     + (columnsInImage - centerX).^2;
% circlePixels = array2D >= innerRadius.^2 & array2D <= outerRadius.^2;
% 
% circleSelect = circlePixels.*dataL;
% data2 = circleSelect.^2;
% feature2 = sum(data2(:));
%  twoFeatureS(i,:) =  [feature1 feature2];
% case two
    mag = (abs(data));
%     f1 =mag(10:50,10:50).^2;
f1 = mag(50:100,300:350).^2;
    f2= mag(100:150,350:400).^2;
    feature1 = log(sum(f1(:)));
    feature2 = log(sum(f2(:)));
    twoFeatureS(i,:) =  [feature1 feature2];
%     
end

end
function  output  = fourierTranslate( filename )
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


