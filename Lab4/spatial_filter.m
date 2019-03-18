function [output] = spatial_filter(image,filter)
%spatial_filter 
%
%INPUT: Grayscale Image (type double) and a filter
%
%OUTPUT: Matrix of gradient magnitude
%
%filters an image with a specific filter. Edges are avoided by using zero
%padding.
%

image = double(image);

imageSize = size(image);
imageRow = imageSize(1);
imageColumn = imageSize(2);
 
filterSize = size(filter);
filterRow = filterSize(1);
filterColumn = filterSize(2);

paddedImage = padarray(image, [filterRow, filterColumn] ,'both');

filteredImage = zeros(size(image));

filterCalculation = 0;

for x = 1: imageRow
    for y = 1: imageColumn
        for i = -1:1
            for j = -1:1
                filterCalculation =  filterCalculation + (paddedImage(x+i+filterRow,y+j+filterColumn) * filter(i+2,j+2));
            end
        end
        filteredImage(x,y) = filterCalculation;
        filterCalculation = 0;
    end
end

output = double(filteredImage);
end

