clear all clc
%Get image
im=imread('./DB1_B/105_3.tif');
figure(1)
imshow(im)
title('Original Image 1')


%Preprocessing
[Ithin, MinutaeMatrixComplex] = ext_finger(im,1);
figure(2)
imshow(Ithin)
title('Thinned Image 1')


%Processing
%Get Minutiaes from original image
[Bifurcations,Terminations,BifCentr,TermCentr]=getMinutaes(Ithin);


%Getting and Preprocessing second image
im2=imread('./DB1_B/105_8.tif');
[Ithin2,MinutaeMatrixComplex2] = ext_finger(im2,1);
figure(3)
imshow(Ithin2)
title('Thinned Image 2')


%Translating second image to match with the original one
center=findCenter(MinutaeMatrixComplex);
center2=findCenter(MinutaeMatrixComplex2);
Ithin2=imageTranslation(center,center2,Ithin2);
figure(4)
imshow(Ithin2)
title('Thinned Image 2 Translated')


%Get Minutiaes from second image
[Bifurcations2,Terminations2,BifCentr2,TermCentr2]=getMinutaes(Ithin2);



