X = imread('processedData.bmp');
X=double(X);
[a,b]=size(X);
xSize = a;
ySize = b;

%  测量矩阵生成(已知)
M=190;
R=randn(M,a);

%  小波变换矩阵生成
ww=DWT(a);

%  信号小波变换
X1=ww*X*ww';

%  测量(已知)，在小波域测量
Y=R*X1;



%  OMP??
X2=zeros(a,a);  %  ????
for i=1:a  %  ???       
    rec=omp(Y(:,i),R,a);
    X2(:,i)=rec;
end



%%  CS????

%  ????
figure(1);
imshow(uint8(X1));
title('original pic');

%  ????
figure(2);
imshow(uint8(X2));
title('');

%  ?????????
figure(3);
X3=ww'*sparse(X2)*ww;  %  ?????
X3=full(X3);
imshow(uint8(X3));
title('???????');

%  ??(PSNR)
errorx=sum(sum(abs(X3-X).^2));        %  MSE??
psnr=10*log10(255*255/(errorx/a/b))   %  PSNR

