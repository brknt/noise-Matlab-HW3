function [out] = periodic_noise_and_removed(im)
A = rgb2gray(im);
[w,q] = size (A);
[x, y] = meshgrid(1:q, 1:w);
s1 = 1 + sin ( x + y );
A2 = im2double(A) + s1 ;
tgpf = fftshift ( fft2 (A2) );
subplot(2,3,1); imshow(mat2gray (A*1.2)) ;title ('original gray') ;

subplot(2,3,2); imshow((A2/2));title('noisy image in Spatial domain');

subplot(2,3,3);imshow (mat2gray( log ( abs(tgpf) ) ) ) ; title('noisy image in Freq. domain ') ;

 k = sqrt ( ( x - q/2 ).^2 + ( y - w/2 ).^2 );
 F= ( k < 130 | k > 140 );
 resf = tgpf .* F ;
 resi = ifft2 ( resf );
subplot(2,3,4);
imshow (mat2gray( log (1+ abs(resf) ) ) ); 
title ('noisy image X Ring filter ') ;
subplot (2,3,5);
imshow (mat2gray ( log (1+ abs(resi) ) ) ) ; 
title('F= ( z < 130 | z > 140 );') ;

 F2= ( k < 30 | k > 200 );
 resf2 = tgpf .* F2 ;
 resi2 = ifft2 ( resf2 );
subplot(2,3,6);
imshow (mat2gray ( log (1+ abs(resi2) ) ) ) ; 
title('F2= ( z < 30 | z > 200 ); ') ;

end