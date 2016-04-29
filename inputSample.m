function  [sampleFeatureS]  =inputSample( string ,i)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
sampleFeatureS = zeros(1,2);
% avgV = zeros(400,640);
    file =  strcat(string(1),int2str(i),string(2));
%     display(char(file));
    data = fourierTranslate(char(file));
   
    mag = abs(data);
    f1 =mag(50:100,300:350).^2;
    f2= mag(100:150,350:400).^2;
    feature1 = log(sum(f1(:)));
    feature2 = log(sum(f2(:)));
     
    sampleFeatureS(1,:) =  [feature1 feature2];
    
   
end