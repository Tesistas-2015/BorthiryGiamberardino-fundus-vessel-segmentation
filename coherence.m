function I = coherence(image,iterations,rho,sigma)
    
    I2 = image + image;
    mask=I2;
    mask(I2 > 30)=1;
    mask(I2 <= 30)=0;
    
    %Calculo el fondo
    fondo = medfilt2(image,[20,20]);
 
    %Resto el fondo
    SF = image - fondo;
    SF = (SF-min(SF(:)))/(max(SF(:))-min(SF(:)));
    %Aplico el filtro de coherencia
    JO = CoherenceFilter(SF,struct('T',iterations,'rho',rho,'sigma',sigma,'Scheme','O','eigenmode',3));
    I=JO;
end