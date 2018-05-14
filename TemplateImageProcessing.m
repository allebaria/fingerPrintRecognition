clear all clc
%Get image
im=imread('./DB1_B/106_2.tif');


%Preprocessing
[Ithin, MinutaeMatrixComplex] = ext_finger(im,1);


%Processing
%Translating and Getting Minutiaes from original image
center=findCenter(MinutaeMatrixComplex);
Ithin=imageTranslation(center,Ithin);
[Bifurcations,Terminations,BifCentr,TermCentr]=getMinutaes(Ithin);
minMat_templ=[BifCentr;TermCentr];
