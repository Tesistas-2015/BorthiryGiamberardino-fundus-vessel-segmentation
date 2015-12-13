function y = segmentation(x,mask)
    %Preprocessing function.
    %Here we go to make all the preprocessing steps.
    
    segm=adapthisteq(x);
    threshold=graythresh(segm);
    segm = 1-segm;
    segm(x <= threshold) = 0;
    segm(x > threshold) = 1;
    se = strel('disk',2);
    erodedmask = imerode(mask,se);
    segm(erodedmask < 1) = 0;
    segm=logical(segm);
    y=segm;
    
end