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
[Bifurcations,Terminations,BifCentr,TermCentr]=getMinutaes(Ithin);
im2=imread('./DB1_B/105_8.tif');
[Ithin2,MinutaeMatrixComplex2] = ext_finger(im2,1);
figure(3)
imshow(Ithin2)
title('Thinned Image 2')
center=findCenter(MinutaeMatrixComplex);
center2=findCenter(MinutaeMatrixComplex2);
Ithin3=imageTranslation(center,center2,Ithin2);
figure(4)
imshow(Ithin3)
title('Thinned Image 2 Translated')


