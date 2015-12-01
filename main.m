myDir = 'dataset/GER7/';
ext_img = '*.bmp';
a = dir([myDir ext_img]);
nfile = max(size(a))  % number of image files
for i=1:nfile
  my_img(i).img = imread([myDir a(i).name]);
  imshow(my_img(i).img);
end

