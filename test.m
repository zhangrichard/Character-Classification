


S = getFeature({'characters/S';'.GIF'});
V = getFeature({'characters/V';'.GIF'});
T = getFeature({'characters/T';'.GIF'});
trainings = [S;V;T]
group = [repmat(1,10,1);repmat(2,10,1);repmat(3,10,1)]
% test1= inputSample({'test/test';'.gif'},3);
% rand1 = knnclassify(test1,trainings,group);
% test2= inputSample({'test/test';'.gif'},4);
% rand2 = knnclassify(test2,trainings,group);
f = imread('characters/A1.GIF'); %read in image
z = fft2(double(f)); % do fouriertransform
q = fftshift(z); % puts u=0,v=0 in the centre 
figure
imagesc(log(abs(q)+1));
colorbar;
title('A')

f = imread('characters/B1.GIF'); %read in image
z = fft2(double(f)); % do fouriertransform
q = fftshift(z); % puts u=0,v=0 in the centre 
figure
imagesc(log(abs(q)+1));
colorbar;
title('B')

 A = fftshift(fft2(double(imread(['characters/A1.GIF']))));
    MagA = abs(A); %Magnitude
    f1A = MagA([50:100],[300:350]).^2;
    f2A = MagA([100:150],[350:400]).^2;
    Au = [log(sum(f1A(:))),log(sum(f2A(:)))];

 B = fftshift(fft2(double(imread(['characters/B1.GIF']))));
    MagB = abs(B); %Magnitude
    f1B = MagB([50:100],[300:350]).^2;
    f2B = MagB([100:150],[350:400]).^2;
    Bu = [log(sum(f2B(:))),log(sum(f2B(:)))];
  
testData = zeros(15,2);
for i =1:15
    testData (i,:) = inputSample({'test/test';'.gif'},i);
    
end

index = knnclassify(testData,trainings,group,3);
figure
aT = testData(index==1,:)
bT = testData(index==2,:)
cT = testData(index==3,:)
% voronoi ploting  with distinct color
% scatter(aT(:,1),aT(:,2),'r','x')
% hold on 
% scatter(bT(:,1),bT(:,2),'g','x')
% hold on 
% scatter(cT(:,1),cT(:,2),'b','x')
% hold on 




meanFeature = [mean(S);mean(V);mean(T)];

scatter(S(:,1),S(:,2),'r');
hold on
scatter(V(:,1),V(:,2),'b');
hold on 
scatter(T(:,1),T(:,2),'v');
hold on 
% voronoi(meanFeature(:,1),meanFeature(:,2));
hold off



// http://www.peteryu.ca/tutorials/matlab/visualize_decision_boundaries

training = cell(3,1);
training{1} = S;
training{2} = V;
training{3} = T;
sample_means = cell(length(training),1);
for i=1:length(training),
    sample_means{i} = mean(training{i});
end

% set up the domain over which you want to visualize the decision
% boundary
xrange = [11 17];
yrange = [12 17];
% step size for how finely you want to visualize the decision boundary.
inc = 0.1;
 
% generate grid coordinates. this will be the basis of the decision
% boundary visualization.
[x, y] = meshgrid(xrange(1):inc:xrange(2), yrange(1):inc:yrange(2));
 
% size of the (x, y) image, which will also be the size of the 
% decision boundary image that is used as the plot background.
image_size = size(x);
 
xy = [x(:) y(:)]; % make (x,y) pairs as a bunch of row vectors.
xy = [reshape(x, image_size(1)*image_size(2),1) reshape(y, image_size(1)*image_size(2),1)]

numxypairs = length(xy); % number of (x,y) pairs
 
% distance measure evaluations for each (x,y) pair.
dist = [];
 
% loop through each class and calculate distance measure for each (x,y)
% from the class prototype.
for i=1:length(training),
 
    % calculate the city block distance between every (x,y) pair and
    % the sample mean of the class.
    % the sum is over the columns to produce a distance for each (x,y)
    % pair.
    disttemp = sum(abs(xy - repmat(sample_means{i}, [numxypairs 1])), 2);
 
    % concatenate the calculated distances.
    dist = [dist disttemp];
 
end
 
% for each (x,y) pair, find the class that has the smallest distance.
% this will be the min along the 2nd dimension.
[m,idx] = min(dist, [], 2);

decisionmap = reshape(idx, image_size);

figure;
 
%show the image
imagesc(xrange,yrange,decisionmap);
hold on;
set(gca,'ydir','normal');
 
% colormap for the classes:
% class 1 = light red, 2 = light green, 3 = light blue
cmap = [1 0.8 0.8; 0.95 1 0.95; 0.9 0.9 1]
colormap(cmap);
 
% plot the class training data.
plot(training{1}(:,1),training{1}(:,2), 'r.');
plot(training{2}(:,1),training{2}(:,2), 'go');
plot(training{3}(:,1),training{3}(:,2), 'b*'); 
AT =  testData(1:5,:);
BT =  testData(6:10,:);
CT =  testData(11:15,:);
plot(AT(:,1),AT(:,2),'bx');
plot(BT(:,1),BT(:,2),'gx');
plot(CT(:,1),CT(:,2),'rx');
 
 
% include legend
legend('trainingS', 'trainingV', 'trainingT','Location','NorthOutside', ...
    'Orientation', 'horizontal');
% legend('testS','testV','testT')
 
% label the axes.
xlabel('x');
ylabel('y');

% plot the test data




[X,Y] = meshgrid(12:0.05:17,10:0.05:17);
Grid = [Y(:) X(:)];
GridClass = knnclassify(Grid,trainings,group,1);
S1 = Grid(find (GridClass ==1),:);
T1 = Grid(find(GridClass ==2),:);
V1 = Grid(find(GridClass ==3),:);

figure ;
% plot(S(:,1),S(:,2),'o');
% hold off
cmap = [1 0.8 0.8; 0.95 1 0.95; 0.9 0.9 1]
colormap(cmap);
scatter(S1(:,1),S1(:,2),'filled');
hold on 
scatter(T1(:,1),T1(:,2),'filled');
hold on 
scatter(V1(:,1),V1(:,2),'filled');
hold on 

scatter(training{1}(:,1),training{1}(:,2), 'r','+');
hold on
scatter(training{2}(:,1),training{2}(:,2), 'g','+');
hold on
scatter(training{3}(:,1),training{3}(:,2), 'b','+'); 
hold on 
scatter(AT(:,1),AT(:,2),'b','*');
hold on 
scatter(BT(:,1),BT(:,2),'g','*');
hold on 
scatter(CT(:,1),CT(:,2),'r','*'); 
hold on 
scatter(Au(:,1),Au(:,2),'y','+')
hold on
scatter(Bu(:,1),Bu(:,2),'m','+')
legend('Class S','Class V','Class T','Train S','Train V','Train T','test S','test V','test T')
hold off

% [X,Y] = meshgrid(0:0.1:20,0:1:20);
% Grid = [Y(:) X(:)];
% GridClass = knnclassify(Grid,trainings,group,3);
% S = Grid(find (GridClass ==1),:);
% T = Grid(find(GridClass ==2),:);
% V = Grid(find(GridClass ==3),:);


%  k mean classifier 
figure(10)

Dists = pdist2(testData, meanFeature);
[MinDist TestClassInd] = min(Dists, [], 2);

TestClass1 = testData(find(TestClassInd == 1), :)
TestClass2 = testData(find(TestClassInd == 2), :)
TestClass3 = testData(find(TestClassInd == 3), :)

scatter(S(:,1),S(:,2),'r','*')
hold on
scatter(V(:,1),V(:,2),'b','*')
hold on
scatter(T(:,1),T(:,2),'g','*')
hold on
scatter(TestClass1(:,1),TestClass1(:,2),'r','+')
hold on
scatter(TestClass2(:,1),TestClass2(:,2),'b','+')
hold on
scatter(TestClass3(:,1),TestClass3(:,2),'g','+')
legend('Training S','Training T','Training V','Test S','Test T','Test V')
hold on 
r1 = scatter(Au(:,1),Au(:,2),'y','o')
hold on
r2 = scatter(Bu(:,1),Bu(:,2),'m','o')
legend([r1 r2],'TestA','TestB');
hold on
hold on 
voronoi(meanFeature(:,1), meanFeature(:,2))
