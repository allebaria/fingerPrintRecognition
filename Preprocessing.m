I=imread('Empreinte.bmp');
Ig=rgb2gray(I);
figure(1)
imshow(Ig)
Ibin=imbinarize(Ig,0.6);
figure(2)
imshow(Ibin)
Ithin=bwmorph(not(Ibin),'thin','inf');
figure(3)
imshow(not(Ithin))
figure(4)
imshow(~Ithin)


