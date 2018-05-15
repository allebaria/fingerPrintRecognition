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

%TODO: Posar text de color verd quan match correcte i vermell quan no
%TODO: Pintar minucies a la imatge processada
%TODO: Vigilar amb el none
f = figure('Name', 'Programa de matching per empremtes dactilars','Visible','off', 'NumberTitle', 'off');
popup = uicontrol('Style', 'popup',...
           'String', {'None','Albert_1','Albert_2','Albert_3','Albert_4', 'Amadeu_1','Amadeu_2','Amadeu_3','Amadeu_4','Anna_1','Anna_2','Anna_3', 'Elena_1','Elena_2','Elena_3','Elena_4','Elena_5', 'Guille_1','Guille_2','Guille_3','Guille_4','Guille_5','Guille_6', 'Marta_1', 'Marta_2', 'Teresa_1', 'Teresa_2','Teresa_3','Teresa_4', 'Xavier_1', 'Xavier_2' 'Xavier_3' 'Xavier_4' 'Xavier_5'},...
           'Position', [20 340 100 50],...
           'Tag','popup_captured',...
           'UserData',struct('Image',''),...
           'Callback', @setList);
popup2 = uicontrol('Style', 'popup',...
           'String', {'None','Albert_1','Albert_2','Albert_3','Albert_4', 'Amadeu_1','Amadeu_2','Amadeu_3','Amadeu_4','Anna_1','Anna_2','Anna_3', 'Elena_1','Elena_2','Elena_3','Elena_4','Elena_5', 'Guille_1','Guille_2','Guille_3','Guille_4','Guille_5','Guille_6', 'Marta_1', 'Marta_2', 'Teresa_1', 'Teresa_2','Teresa_3','Teresa_4', 'Xavier_1', 'Xavier_2' 'Xavier_3' 'Xavier_4' 'Xavier_5'},...
           'Position', [440 340 100 50],...
           'Tag','popup_database',...
           'UserData', struct('Image',''),...
           'Callback', @setList2);
runButton = uicontrol('Style', 'pushbutton','String','Comparar les empremtes!',...
           'Position', [200 360 150 50],...
           'Callback', @startMatching);
       
txtInformation = uicontrol('Style','text',...
     'Position',[220 45 160 40],...
     'Tag','text_for_information',...
     'String','Selecciona dues imatges i pitja el botó per comparar les imatges');
       
f.Visible = 'on';

function startMatching(source, event)
popup_1 = findobj('Tag','popup_captured');
popup_2 = findobj('Tag','popup_database');
pathCapturedImage = sprintf('./DB1_B/%s.tif', popup_1.UserData.Image);
pathDataBaseImage = sprintf('./DB1_B/%s.tif', popup_2.UserData.Image);
if(strcmp(popup_1.UserData.Image,'')|| strcmp(popup_2.UserData.Image,'') || strcmp(popup_1.UserData.Image,'None')|| strcmp(popup_2.UserData.Image,'None'))
    f = msgbox('Per tal de poder fer el matching no poden haver cap paràmetre a "None"','Mala selecció');
else
    txt_info = findobj('Tag', 'text_for_information');
    txt_info.String = 'Processant algorisme...'
    txt_info.ForegroundColor = 'black';

    %Getting and Preprocessing captured image
    im2=imread(pathCapturedImage);
    [Ithin2,MinutaeMatrixComplex2] = ext_finger(im2,1);


    %Translating second image to match with the original one
    center2=findCenter(MinutaeMatrixComplex2);
    Ithin2=imageTranslation(center2,Ithin2);


    %Get Minutiaes from second image
    [Bifurcations2,Terminations2,BifCentr2,TermCentr2]=getMinutaes(Ithin2);
    minMat_curr=[BifCentr2;TermCentr2];

    %Matching
    minMat_templ = TemplateImageProcessing(pathDataBaseImage);
    n_min_templ=size(minMat_templ(:,1));
    n_min_curr=size(minMat_curr(:,1));
    tic
    c=matching(minMat_templ,minMat_curr,0.8*min(n_min_templ,n_min_curr));
    toc
    c

    subplot(1,2,1), subimage(Ithin2)
    title('Imatge capturada processada amb minutes')

    if(c)
        txt_info.String = 'Matching Correcte!!!';
        txt_info.ForegroundColor = 'green';
    else
        txt_info.String = 'Matching Incorrecte...';
        txt_info.ForegroundColor = 'red';


    end
end


end

function setList(source,event)
    val = source.Value;
    images = source.String;
    newImage = images{val};
    source.UserData.Image = newImage;
    if(val ~= 1)
        im=imread(sprintf('./DB1_B/%s.tif', newImage));
        subplot(1,2,1), subimage(im)
        title('Imatge acabada de capturar')
    end 
    
end

function setList2(source,event)
    val = source.Value;
    images = source.String;
    newImage = images{val};
    source.UserData.Image = newImage;
    if(val ~= 1)
        im=imread(sprintf('./DB1_B/%s.tif', newImage));
        subplot(1,2,2), subimage(im) 
        title('Imatge de la base de dades')
    end 
    
end

