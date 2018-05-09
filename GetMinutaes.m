%First of all we need to get a matrix in which every pixel of a ridge will
%be studied in order to know if is a minutae.
%1: Termination
%2: Part of the crest
%3: Bifurcation

MinutaeMatrix = nlfilter(Ithin,[3 3],@minutie);

%Then we find only the bifurcations to plot them above the image of the
%fingerprint
%To do it, we get only the pixels tagged with a '1' after the first
%filtering. After that, we get the coordinates of these pixels by measuring
%the property of centroid of each of them. Finally, we concatenate the
%array given by the 'regionprops' function and plot the result into the
%fingerprint image
Terminations = (MinutaeMatrix==1);
TermCentr=regionprops(Terminations,'Centroid');
TermCentr=cat(1,TermCentr(:).Centroid);
hold on
plot(TermCentr(:,1),TermCentr(:,2),'ro')

%Now we apply the same algorithm to find and plot the bifurcations.
Bifurcations = (MinutaeMatrix==3);
BifCentr=regionprops(Bifurcations,'Centroid');
BifCentr=cat(1,BifCentr(:).Centroid);
plot(BifCentr(:,1),BifCentr(:,2),'bo')
hold off

%By this moment, we have all the bifurcations and temrinations, but not all
%of them are going to be studied. The reason is to avoid minutaes that were
%recognized by mistake. The minutaes to be removed have to accomplish one of the three conditions below:
%1. The distance betweenn a bifurcation and a termination is smaller than X
%2. The distance betweenn two bifurcations is smaller than X
%3. The distance betweenn two terminations is smaller than X
%First of all we have to sort the Bifurcations and Terminations Cen