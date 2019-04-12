%%upload image
clc;
close all;
[fname, path] = uigetfile('*.jpg', 'Select an Image');
fname = strcat(path,fname);
im = imread(fname);
im2 = im2double(imread(fname));


%gaussian_noise(im);     %add gaussian noise
%saltPepper_noise(im);   %add salt and pepper noise
%medianFilter(im,4);     %removed gaussian and salt&pepper noise
%periodic_noise_and_removed(im);%periodic noise and removed periodic noise