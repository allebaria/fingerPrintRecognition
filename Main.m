clear all clc
im=imread('./DB1_B/102_1.tif');
figure(1)
imshow(im)
title('Original Image')
ret = ext_finger(im,1);