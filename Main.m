%Program for Image / Picture Quality Measures Calculation

%Author : Athi Narayanan S
%M.E, Embedded Systems,
%K.S.R College of Engineering
%Erode, Tamil Nadu, India.
%http://sites.google.com/site/athisnarayanan/
%s_athi1983@yahoo.co.in

%Program Description
%This program is the main entry of the application.
%This program calculates the difference Image/Picture Quality Measures

%Clear Memory & Command Window
clc;
clear all;
close all;

%Read Original & Distorted Images
origImg = imread('.\OriginalImages\I07.bmp');
%distImg = imread('.\DistortedImages\tid2013\I07_16_4.bmp');
distImg = origImg;
%If the input image is rgb, convert it to gray image
noOfDim = ndims(origImg);
if(noOfDim == 3)
    origImg = rgb2gray(origImg);
end

noOfDim = ndims(distImg);
if(noOfDim == 3)
    distImg = rgb2gray(distImg);
end

figure(1);imshow(origImg)
figure(2);imshow(distImg)


%Size Validation
origSiz = size(origImg);
distSiz = size(distImg);
sizErr = isequal(origSiz, distSiz);
if(sizErr == 0)
    disp('Error: Original Image & Distorted Image should be of same dimensions');
    return;
end

%Mean Square Error 
MSE = MeanSquareError(origImg, distImg);
disp('Mean Square Error = ');
disp(MSE);

%Peak Signal to Noise Ratio 
PSNR = PeakSignaltoNoiseRatio(origImg, distImg);
disp('Peak Signal to Noise Ratio = ');
disp(PSNR);


K = [0.01 0.03];
%window = ones(8);
window = fspecial('gaussian', 11, 1.5);
L = 255;
[mssim, ssim_map] = ssim(origImg, distImg, K, window, L);
disp('SSIM = ');
disp(mssim);

cwssim = cwssim_index(origImg, distImg,2,16,0,0);
disp('CW-SSIM = ');
disp(cwssim);
