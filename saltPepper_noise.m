function out = saltPepper_noise(im)
J = im;
p3= 0.05;
x = rand(size(J));%n*n boyutun 0-1 arasý elemanlarý olan matrix üretir
d = find(x < p3/2);%find() sýfýr olmayan indisleri verir 
J(d) = 0; %Minimum valued
d= find(x >= p3/2 & x < p3);
J(d) = 255; %Maximum(saturated) valueimshow(J)

imwrite(J, 'salt&pepper.jpg', 'quality', 95);%%salt and pepper noise image save

figure;
subplot(121)
imshow(im)
title('Original Image')
subplot(122)
imshow(J)
title('Salt&Pepper Noise')
end