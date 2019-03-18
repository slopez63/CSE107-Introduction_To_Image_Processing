function [finalEdges] = findEdges(image,threshold)
%findEdges 
%
%INPUT: Image and a threshold
%
%OUTPUT: Matrix of 0's and 255's. 
%
%255 or white essentialy tell you that
%theres an edge at that point. The threshold is a number that helps reduce
%noise depending on the image.

edgeImage = gradient_magnitude(image);

finalEdges = uint8(zeros(size(edgeImage)));

imageSize = size(image);
imageRow = imageSize(1);
imageColumn = imageSize(2);

for s = 1 : imageRow
    for c = 1 : imageColumn
        
        if(edgeImage(s,c) < threshold)
            finalEdges(s,c) = 0;
        else
            finalEdges(s,c) = 255;
        end
        
    end
end

imshow(finalEdges);
end

