clear all clc
%Get image
im=imread('./DB1_B/105_3.tif');
figure(1)
imshow(im)
title('Original Image')

%Preprocessing
Ithin = ext_finger(im,1);
figure(2)
imshow(Ithin)


%Processing
GetMinutaes



