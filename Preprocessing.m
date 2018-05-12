I=imread('Prova.png');
Ig=rgb2gray(I);
figure(1)
imshow(Ig)
Ieq=histeq(Ig);
figure(10)
imshow(Ieq);
Ibin=imbinarize(Ieq,0.1);
simage=size(Ibin);
figure(2)
imshow(Ibin)

Ithin=bwmorph(not(Ibin),'thin','inf');
figure(3)
imshow(not(Ithin))

%Get the ROI image of the original
Iclosed = imclose(Ithin,strel('square',7));
Iclosed = imfill(Iclosed,'holes');
Iclosed=bwareaopen(Iclosed,5);
Iclosed([1 end],:)=0;
Iclosed(:,[1 end])=0;
Iroi=imerode(Iclosed,strel('disk',10));

figure(4)
imshow(Iroi)

%TODO: apply the roi region to the original image


