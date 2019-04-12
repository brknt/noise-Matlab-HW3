%-removes salt and pepper noise from image.
%-removes gaussian noise from image.
%With median filter, gaussian and salt and pepper noise are removed

function out = medianFilter(Im,n)
[height,width] = size(Im);
Im1 = double(Im);
out = Im1;
center = round((n+1)/2);
for i = 1:height-n+1
	for j = 1:width-n+1
		temp = Im1(i:i+n-1,j:j+n-1);
		ele = temp(1,:);
		for count = 2:n
			ele = [ele,temp(count,:)];
		end
		med = median(ele);
		out(i+center,j+center) = med;
	end
end

out = uint8(out);
figure
subplot(2,1,1)
imshow(Im)
subplot(2,1,2)
imshow(out)
xlabel('median filtering(remove noise)')
end