clear;
close all;
clc;

img_in=imread('Fig1.3.jpg');
[Imgm,Imgn]=size(img_in);
Target = imcrop(img_in, [0,0,floor(Imgn/8)*8, floor(Imgm/8)*8]);% the times of 8
I=double(Target);
figure(1);
imshow(uint8(I));
title('Original image');

T=zeros(8,8);
% transform matrix
[m,n]=size(T);
for i=0:m-1
    for j=0:m-1
        if i==0
            a=sqrt(1/m);
        else
            a=sqrt(2/m);
        end
        T(i+1,j+1)=a*cos(pi*(j+0.5)*i/m);
    end
end
% tranformation process definition
fun = @(block_struct) T * block_struct.data * T';
%fun = @(block_struct) fft2(block_struct.data);
I1=blockproc(I,[8 8],fun);
%figure(2);
%imshow(uint8(I1));
%title('DCT Transformation');
a=[]; 
a0=ones(1,8); 
a1=zeros(1,8);

for coef = fliplr(1:1:8)
    for i=1:8   
        if i<=coef    
            a(i,:)=a0;   
        else
            a(i,:)=a1;
        end
    end
    fun = @(block_struct) a.*block_struct.data;
    areaCode=blockproc(I1,[8 8],fun); 
    %figure(3); 
    %imshow(uint8(I1)); 

    %decoding
    fun = @(block_struct) T' * block_struct.data * T;
    %fun = @(block_struct) ifft2(block_struct.data);
    areaCodeDecode=blockproc(areaCode,[8 8], fun); 
    figure((10-coef)); 
    img_out = uint8(areaCodeDecode);
    imshow(img_out);title(['DCT Decoding of ',num2str(coef)]);
    imwrite(img_out, [num2str(coef), '_dct.jpg'])
    rmse1 = RMSE(img_out, img_in);
    s_snr1 = SQAR_SNR(img_out, img_in);
    fprintf('%d retain coefficient condition rmse: %f\n', coef, rmse1);
    fprintf('%d retain coefficient condition s_snr: %f\n', coef, s_snr1);
end