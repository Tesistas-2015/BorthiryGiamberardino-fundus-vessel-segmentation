%%
%Cargo la imagen
I = im2double(imread('dataset/GER7/GER2.bmp'));
Inorm = (I-min(I(:)))/(max(I(:))-min(I(:)));
% img=preprocess(I);
img=Inorm;
img=adapthisteq(img);
figure,
subplot(1,1,1),imshow(img), title('Imagen 3,1');



%%
I2=Inorm + Inorm;

mask=I2;
mask(I2 > (30/255))=1;
mask(I2 <= (30/255))=0;
% figure,
% subplot(1,1,1),imshow(mask), title('Imagen 3,1');


img=coherence(img,5,15,0.25);

figure,
subplot(1,1,1),imshow(img), title('Imagen 3,1');

% figure,
% subplot(1,1,1),imshow(mask), title('Imagen 3,1');

%%
adapted = adapthisteq(img);
figure,
subplot(1,1,1),imshow(adapted), title('Imagen 3,1');
%%
media=preprocess(img);
media_realzada = adapthisteq(media);
figure,
subplot(1,1,1),imshow(media_realzada), title('Imagen 3,1');
%%
threshold=0.51;
segm = media_realzada;
segm = 1-segm;
segm(img <= threshold) = 0;
segm(img > threshold) = 1;
se = strel('disk',2);
erodedmask = imerode(mask,se);
segm(erodedmask < 1) = 0;

segm=logical(segm);
figure,
subplot(1,1,1),imshow(segm), title('Imagen 3,10');
%%
 % segm=imclose(segm,se);
img2=coherence(segm,20,2,0.25);
%%
segm=img2;
segm(img2 <= threshold) = 0;
segm(img2 > threshold) = 1;
segm(mask < 1) = 0;
figure, 
    subplot(1,1,1), 
        imshow(segm), 
        title('Imagen 3,10');
%%
