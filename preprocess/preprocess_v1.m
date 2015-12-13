function [y,diffused] = preprocess_v1(x,mask)
    
    % Version 1 de preprocesamiento
    % 
    % * Remover el fondo
    
    filter = fspecial('average',30);
    diffused=filter2(filter,x);
    %med_30=medfilt2(x,[40 40]);
    
    without_background = x - diffused;
    without_background(mask<1)=0;
    filter = fspecial('average',9);
    noise = filter2(filter,without_background);
    preprocessed=without_background - noise;
    preprocessed=adapthisteq(preprocessed);
    %preprocessed(mask<1)=0;
    y=preprocessed;
end