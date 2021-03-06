%%
clear;
close all;
clc;
%%

%%
%Cargo la imagen y normalizo
I = im2double(imread('dataset/GER7TH/GER1.bmp'));
GT = im2double(imread('dataset/GER7-GTTH/GER1-GT.png'));

Inorm = (I-min(I(:)))/(max(I(:))-min(I(:)));

%%
%Calculo la mascara
I2=Inorm + Inorm;
mask=I2;
mask(I2 > (30/255))=1;
mask(I2 <= (30/255))=0;
%%
%Preproceso
[preprocessed,background] = preprocess_v1(I,mask);

filter = fspecial('average',9);
noise = filter2(filter,preprocessed);
preprocessed=preprocessed - noise;
preprocessed=adapthisteq(preprocessed);

%filter = fspecial('gaussian',9,300);
%noise = filter2(filter,preprocessed);
%preprocessed=medfilt2(preprocessed,[20 20]);
figure,
imshow(preprocessed), title('Imagen preprocesada');
%%
filtered_image = CoherenceFilter(preprocessed,struct('T',40,'rho',2,'sigma',0.25,'Scheme','O','eigenmode',0,'lambda_c',1,'lambda_e',0,'lambda_h',0.15));
%%
segm = adapthisteq(filtered_image);
threshold=graythresh(segm);
segm = 1-segm;
segm(filtered_image <= threshold) = 0;
segm(filtered_image > threshold) = 1;
se = strel('disk',2);
erodedmask = imerode(mask,se);
segm(erodedmask < 1) = 0;

segm=logical(segm);
figure,
imshow(segm), title('Imagen 3,10');
%%
[area,error,threshold]=area_roc(GT,segm);
%%
area
error
threshold

%%
figure,
subplot(1,2,1),imshow(preprocessed), title('Imagen preprocesada');
subplot(1,2,2),imshow(filtered_image), title('Imagen filtrada');