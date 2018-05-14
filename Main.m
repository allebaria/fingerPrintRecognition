%clear all clc
%Get image
%im=imread('./DB1_B/101_1.tif');


% %Preprocessing
% [Ithin, MinutaeMatrixComplex] = ext_finger(im,1);
% 
% 
% %Processing
% %Translating and Getting Minutiaes from original image
% center=findCenter(MinutaeMatrixComplex);
% Ithin=imageTranslation(center,Ithin);
% [Bifurcations,Terminations,BifCentr,TermCentr]=getMinutaes(Ithin);
% minMat_templ=[BifCentr;TermCentr];

%Getting and Preprocessing second image
im2=imread('./DB1_B/106_5.tif');
[Ithin2,MinutaeMatrixComplex2] = ext_finger(im2,1);


%Translating second image to match with the original one
center2=findCenter(MinutaeMatrixComplex2);
Ithin2=imageTranslation(center2,Ithin2);


%Get Minutiaes from second image
[Bifurcations2,Terminations2,BifCentr2,TermCentr2]=getMinutaes(Ithin2);
minMat_curr=[BifCentr2;TermCentr2];

%Matching
n_min_templ=size(minMat_templ(:,1));
n_min_curr=size(minMat_curr(:,1));
tic
c=matching(minMat_templ,minMat_curr,0.8*min(n_min_templ,n_min_curr));
toc
c