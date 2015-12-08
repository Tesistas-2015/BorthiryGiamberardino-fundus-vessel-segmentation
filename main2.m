%%
%Cargo la imagen
I = im2double(imread('dataset/GER7/GER1.bmp'));
Inorm = (I-min(I(:)))/(max(I(:))-min(I(:)));
I2=Inorm + Inorm;

mask=I2;
mask(I2 > (30/255))=1;
mask(I2 <= (30/255))=0;

filter = fspecial('gaussian',3,0.25);
fil
realzada = imfilter(Inorm,filter);
diff = anisodiff2D(Inorm,15,0.01,10,1);
% diff = adapthisteq(diff);

treshold=0.58;
segm=diff;
segm(segm<treshold)=0;
segm(segm>=treshold)=1;
figure,
subplot(1,3,1),imshow(realzada),title('');
subplot(1,3,2),imshow(diff),title('');
subplot(1,3,3),imshow(segm),title('');