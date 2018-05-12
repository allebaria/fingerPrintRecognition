clear all clc

%Preprocessing
im=imread('./DB1_B/105_3.tif');
figure(1)
imshow(im)
title('Original Image')
Ithin = ext_finger(im,1);
figure(2)
imshow(Ithin)

%Get the ROI image of the original
Iclosed = imclose(Ithin,strel('square',10));

Iclosed = imfill(Iclosed,'holes');

Iclosed=bwareaopen(Iclosed,5);

Iclosed([1 end],:)=0;
Iclosed(:,[1 end])=0;
Iroi=imerode(Iclosed,strel('disk',10));

figure(8)
imshow(Iroi)

%Processing
GetMinutaes
