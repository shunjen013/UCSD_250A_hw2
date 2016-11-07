clc;

%% 6.1 dino
% clear all;
% load('dino2.mat');
% 
% nCorners = 20;
% smoothSTD = 1;
% windowSize = 10;
% corners_1 = CornerDetect(dino01, nCorners, smoothSTD, windowSize);
% corners_2 = CornerDetect(dino02, nCorners, smoothSTD, windowSize);
% 
% figure;
% showMarker1(dino01, corners_1);
% figure;
% showMarker1(dino02, corners_2);

%% 6.1 warrior
clear all;
load('warrior2.mat');

nCorners = 20;
smoothSTD = 1;
windowSize = 10;
corners_1 = CornerDetect(warrior01, nCorners, smoothSTD, windowSize);
corners_2 = CornerDetect(warrior02, nCorners, smoothSTD, windowSize);

figure;
showMarker1(warrior01, corners_1);
figure;
showMarker1(warrior02, corners_2);

%% 6.1 matrix
clear all;
load('matrix2.mat');

nCorners = 20;
smoothSTD = 3;
windowSize = 10;
corners_1 = CornerDetect(matrix01, nCorners, smoothSTD, windowSize);
corners_2 = CornerDetect(matrix02, nCorners, smoothSTD, windowSize);

figure;
showMarker1(matrix01, corners_1);
figure;
showMarker1(matrix02, corners_2);

%% 6.2 6.3 dino
% clear all;
% load('dino2.mat');
% 
% nCorners = 10;
% smoothSTD = 1;
% windowSize = 10;
% corners_1 = CornerDetect(dino01, nCorners, smoothSTD, windowSize);
% corners_2 = CornerDetect(dino02, nCorners, smoothSTD, windowSize);
% 
% R = 20;
% SSDth = 70;
% corsSSD = naiveCorrespondanceMatching(dino01, dino02, corners_1, ...
%     corners_2, R, SSDth);
% 
% figure;
% showMatching(dino01,dino02,corners_1,corsSSD);

%% 6.2 6.3 warrior
clear all;
load('warrior2.mat');

nCorners = 10;
smoothSTD = 1;
windowSize = 10;
corners_1 = CornerDetect(warrior01, nCorners, smoothSTD, windowSize);
corners_2 = CornerDetect(warrior02, nCorners, smoothSTD, windowSize);

R = 20;
SSDth = 100;
corsSSD = naiveCorrespondanceMatching(warrior01, warrior02, corners_1, ...
    corners_2, R, SSDth);

figure;
showMatching(warrior01,warrior02,corners_1,corsSSD);

%% 6.2 6.3 matrix
clear all;
load('matrix2.mat');

nCorners = 10;
smoothSTD = 3;
windowSize = 10;
corners_1 = CornerDetect(matrix01, nCorners, smoothSTD, windowSize);
corners_2 = CornerDetect(matrix02, nCorners, smoothSTD, windowSize);

R = 20;
SSDth = 190;
corsSSD = naiveCorrespondanceMatching(matrix01, matrix02, corners_1, ...
    corners_2, R, SSDth);

figure;
showMatching(matrix01,matrix02,corners_1,corsSSD);

%% 6.4 dino
% clear all;
% load('dino2.mat');
% FMatrix = fund(cor1, cor2);
% epiLine_1 = [];
% epiLine_2 = [];
% for i = 1:size(cor1, 1)
%     line_1 = linePts(FMatrix' *[cor2(i,:),1]', [1, size(dino01, 2)], ...
%         [1, size(dino01, 1)]);
%     epiLine_1 = [epiLine_1; line_1(1,:), line_1(2,:)];
%     line_2 = linePts(FMatrix  *[cor1(i,:),1]', [1, size(dino02, 2)], ...
%         [1, size(dino02, 1)]);
%     epiLine_2 = [epiLine_2; line_2(1,:), line_2(2,:)];
% end
% 
% figure;
% img_1 = insertShape(dino01,'Line',epiLine_1,'LineWidth',5);
% showMarker1(img_1, cor1);
% figure;
% img_2 = insertShape(dino02,'Line',epiLine_2,'LineWidth',5);
% showMarker1(img_2, cor2);

%% 6.4 warrior
clear all;
load('warrior2.mat');
FMatrix = fund(cor1, cor2);
epiLine_1 = [];
epiLine_2 = [];
for i = 1:size(cor1, 1)
    line_1 = linePts(FMatrix' *[cor2(i,:),1]', [1, size(warrior01, 2)], ...
        [1, size(warrior01, 1)]);
    epiLine_1 = [epiLine_1; line_1(1,:), line_1(2,:)];
    line_2 = linePts(FMatrix  *[cor1(i,:),1]', [1, size(warrior02, 2)], ...
        [1, size(warrior02, 1)]);
    epiLine_2 = [epiLine_2; line_2(1,:), line_2(2,:)];
end

figure;
img_1 = insertShape(warrior01,'Line',epiLine_1,'LineWidth',5);
showMarker1(img_1, cor1);
figure;
img_2 = insertShape(warrior02,'Line',epiLine_2,'LineWidth',5);
showMarker1(img_2, cor2);

%% 6.4 matrix
clear all;
load('matrix2.mat');
FMatrix = fund(cor1, cor2);
epiLine_1 = [];
epiLine_2 = [];
for i = 1:size(cor1, 1)
    line_1 = linePts(FMatrix' *[cor2(i,:),1]', [1, size(matrix01, 2)], ...
        [1, size(matrix01, 1)]);
    epiLine_1 = [epiLine_1; line_1(1,:), line_1(2,:)];
    line_2 = linePts(FMatrix  *[cor1(i,:),1]', [1, size(matrix02, 2)], ...
        [1, size(matrix02, 1)]);
    epiLine_2 = [epiLine_2; line_2(1,:), line_2(2,:)];
end

figure;
img_1 = insertShape(matrix01,'Line',epiLine_1,'LineWidth',5);
showMarker1(img_1, cor1);
figure;
img_2 = insertShape(matrix02,'Line',epiLine_2,'LineWidth',5);
showMarker1(img_2, cor2);

%% 6.5 dino
% clear all;
% load('dino2.mat');
% 
% nCorners = 10;
% smoothSTD = 1;
% windowSize = 10;
% corners_1 = CornerDetect(dino01, nCorners, smoothSTD, windowSize);
% 
% FMatrix = fund(cor1, cor2);
% R = 20;
% SSDth = 70;
% corsSSD = correspondanceMatchingLine(dino01, dino02, corners_1, ...
%     FMatrix, R, SSDth);
% 
% figure;
% showMatching(dino01,dino02,corners_1,corsSSD);

%% 6.5 warrior
clear all;
load('warrior2.mat');

nCorners = 10;
smoothSTD = 1;
windowSize = 10;
corners_1 = CornerDetect(warrior01, nCorners, smoothSTD, windowSize);

FMatrix = fund(cor1, cor2);
R = 20;
SSDth = 90;
corsSSD = correspondanceMatchingLine(warrior01, warrior02, corners_1, ...
    FMatrix, R, SSDth);

figure;
showMatching(warrior01,warrior02,corners_1,corsSSD);

%% 6.5 matrix
clear all;
load('matrix2.mat');

nCorners = 10;
smoothSTD = 3;
windowSize = 10;
corners_1 = CornerDetect(matrix01, nCorners, smoothSTD, windowSize);

FMatrix = fund(cor1, cor2);
R = 20;
SSDth = 2000;
corsSSD = correspondanceMatchingLine(matrix01, matrix02, corners_1, ...
    FMatrix, R, SSDth);

figure;
showMatching(matrix01,matrix02,corners_1,corsSSD);

%% 6.6 dino
% clear all;
% load('dino2.mat');
% 
% nCorners = 50;
% smoothSTD = 1;
% windowSize = 10;
% corners_1 = CornerDetect(dino01, nCorners, smoothSTD, windowSize);
% 
% FMatrix = fund(cor1, cor2);
% R = 20;
% SSDth = 70;
% corsSSD = correspondanceMatchingLine(dino01, dino02, corners_1, ...
%     FMatrix, R, SSDth);
% 
% points3D = Triangulate(corners_1, corsSSD, proj_7, proj_8);
% 
% outlierTH = 20;
% [inlier, outlier] = findOutliers(points3D, proj_8, outlierTH, corsSSD);
% 
% figure;
% showMarker3(dino02, corsSSD, inlier, outlier);

%% 6.6 warrior
clear all;
load('warrior2.mat');

nCorners = 50;
smoothSTD = 1;
windowSize = 10;
corners_1 = CornerDetect(warrior01, nCorners, smoothSTD, windowSize);

FMatrix = fund(cor1, cor2);
R = 20;
SSDth = 90;
corsSSD = correspondanceMatchingLine(warrior01, warrior02, corners_1, ...
    FMatrix, R, SSDth);

points3D = Triangulate(corners_1, corsSSD, proj_warrior01, proj_warrior02);

outlierTH = 20;
[inlier, outlier] = findOutliers(points3D, proj_warrior02, ...
    outlierTH, corsSSD);

figure;
showMarker3(warrior02, corsSSD, inlier, outlier);

%% 6.6 matrix
clear all;
load('matrix2.mat');

nCorners = 50;
smoothSTD = 3;
windowSize = 10;
corners_1 = CornerDetect(matrix01, nCorners, smoothSTD, windowSize);

FMatrix = fund(cor1, cor2);
R = 20;
SSDth = 2000;
corsSSD = correspondanceMatchingLine(matrix01, matrix02, corners_1, ...
    FMatrix, R, SSDth);

points3D = Triangulate(corners_1, corsSSD, proj_matrix01, proj_matrix02);

outlierTH = 20;
[inlier, outlier] = findOutliers(points3D, proj_matrix02, ...
    outlierTH, corsSSD);

figure;
showMarker3(matrix02, corsSSD, inlier, outlier);

