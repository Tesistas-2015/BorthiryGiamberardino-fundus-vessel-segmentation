function y = preprocess(x)
    %Preprocessing function.
    %Here we go to make all the preprocessing steps.
%     gaussian = fspecial('gaussian',5,0.5);
%     y = filter2(gaussian,x);
    
    y=medfilt2(x,[20 20]);
    
end