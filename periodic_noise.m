function out = periodic_noise(im)
im2=double(im);
s=size(im);
[x,y]=meshgrid(1:s(1),1:s(2));
p=round(50*sin(x./3+y./5)+1);
im2(:,:,1)=im2(:,:,1)+p;
im2(:,:,2)=im2(:,:,2)+p;
im2(:,:,3)=im2(:,:,3)+p;
for i=1:s(1),
  for j=1:s(2),
      for k=1:s(3),
          if  im2(i,j,k) < 0;
              im2(i,j,k) = 0;
          end
          if  im2(i,j,k) > 255;
              im2(i,j,k) = 255;
          end
      end
  end
end
B=uint8(im2);

figure;
subplot(121)
imshow(im)
title('Original Image')
subplot(122)
imshow(B)
title('Periodic noise')
end