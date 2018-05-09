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

%Get the ROI image of the original
Iclosed = imclose(Ithin,strel('square',7));
Iclosed = imfill(Iclosed,'holes');
Iclosed=bwareaopen(Iclosed,5);
Iclosed([1 end],:)=0;
Iclosed(:,[1 end])=0;
Iroi=imerode(Iclosed,strel('disk',10));

figure(5)
imshow(Iroi)

%TODO: apply the roi region to the original image

