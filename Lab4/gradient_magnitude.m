function [gradientImage] = gradient_magnitude(image)
%gradient_magnitude 
%
%INPUT: Grayscale Image (type double)
%
%OUTPUT: Matrix of gradient magnitude
%
%Calculates the gradient filters for both horizontal and vertical edges.
%Calculates the gradient magnitude of both directions.
%

image = double(image);

%Sobel Filters

%Horizontal Filter

filterY = [-1,-2,-1; 
           0,0,0; 
           1,2,1];
       
%Vertical Filter
       
filterX = [-1,0,1; 
           -2,0,2; 
           -1,0,1]; 
       
imageSize = size(image);
imageRow = imageSize(1);
imageColumn = imageSize(2);

gradientImage = zeros(imageRow,imageColumn);

gradientImageX = spatial_filter(image,filterX);
gradientImageY = spatial_filter(image,filterY);

for s = 1 : imageRow
    for c = 1 : imageColumn
        gradientImage(s,c) = sqrt((gradientImageX(s,c)^2) + (gradientImageY(s,c)^2));
    end
end

gradientImage = double(gradientImage);
end

