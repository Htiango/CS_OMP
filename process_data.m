X = imread('160402-2-1-1w.bmp');
[a , b] = size(X);
% if(a < b)
%     X = imresize(X , [a,a]);
%  elseif(a > b)
%     X = imresize(X, [b, b]);
% end
% imwrite(X, 'processedData.bmp');

Y = imread('recovery image.bmp');
Y = imresize(Y, [a,b]);
imwrite(Y, 'finalRecover.bmp');