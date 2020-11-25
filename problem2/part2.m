clear;
clc;
close all;
img1 = imread('Fig1.2(a).jpg');
% self written function of image entropy
res1 = EntropySelf(img1);
fprintf('Self written entropy function result on fig1: %f\n', res1);
% matlab integrated function of image entropy
res2 = entropy(img1);
fprintf('Integrated entropy function result on fig1: %f\n', res2);

img2 = imread('Fig1.2(b).tif');
% self written function of image entropy
res1 = EntropySelf(img2);
fprintf('Self written entropy function result on fig2: %f\n', res1);
% matlab integrated function of image entropy
res2 = entropy(img2);
fprintf('Integrated entropy function result on fig2: %f\n', res2);
