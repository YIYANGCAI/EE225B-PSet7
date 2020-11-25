clc;
clear;
close all;

% Perform a uniform quantization
img = imread('Fig1.1.jpg');
q1 = img / 16 - 1;
q1 = q1 * 16;

figure;
imshow(img);title('Original image');

figure;
imshow(q1);title('Uniform quantized image');
imwrite(q1, './uniform_res.jpg');

% Perform a improved grayscaled (IGS) quantization
[a,b]=size(img);
q2 = img;
for i=1:a
    % From every row set previous value to 0
    previous = uint8(0);
    for j=1:b
        pixel = img(i,j);
        % Add the 4 least significant value of previous 
        new_pixel_sum = pixel + (previous-(previous/16-1)*16); 
        new_pixel = (new_pixel_sum / 16 -1) * 16;
        q2(i,j) = new_pixel;
        % Update the sum variable
        previous = new_pixel_sum;
    end
end
figure;
imshow(q2);title('Improved grayscale quantized image');
imwrite(q2, './igs_res.jpg');

% Compute the rmse sqar_snr and display the values
snr1 = SQAR_SNR(q1, img);
snr2 = SQAR_SNR(q2, img);
rmse1 = RMSE(q1, img);
rmse2 = RMSE(q2, img);
fprintf('Uniform quantization result sqr_snr: %f \n',snr1);
fprintf('Uniform quantization result rmse: %f \n',rmse1);
fprintf('ISG quantization result sqr_snr: %f \n',snr2);
fprintf('ISG quantization result rmse: %f \n',rmse2);