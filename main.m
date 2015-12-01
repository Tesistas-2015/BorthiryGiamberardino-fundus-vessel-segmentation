myDir = '/home/dorian/Documentos/Tesis/matlab/dataset/GER7';
ext_img = '*.png';
a = dir([myDir ext_img]);
nfile = max(size(a));  % number of image files
for i=1:nfile
  img = imread([myDir a(i).name]);
  imshow(img);
end