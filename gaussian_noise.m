function out = gaussian_noise(im)


J = im;
p3= 0;p4 = 0.05;
J = im2double(J);
b = J + sqrt(p4)*randn(size(J)) + p3;

imwrite(b, 'gaussian.jpg', 'quality', 95);%%gaussian noise image save

figure;
subplot(121)
imshow(im)
title('Original Image')
subplot(122)
imshow(b)
title('Gaussian Noise')


end