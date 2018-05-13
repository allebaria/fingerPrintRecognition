function [translatedImage] = imageTranslation(modelCenter,translatedCenter,imageToTranslate)
tx=modelCenter(1)-translatedCenter(1);
ty=modelCenter(2)-translatedCenter(2);
translatedImage=imtranslate(imageToTranslate,[tx,ty]);
end

