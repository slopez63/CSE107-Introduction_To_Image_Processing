function [transformation] = histogram_transform(histogram)
%Histogram Transform
%   Takes in a histogram as input and returns a transformation vector 256
%   bit

%create empty space to store values
transformation = zeros(1,256);

    %Iterate Sum all probabilities before i 
    for i = 1:256
        for j = 1:i
            transformation(i) = transformation(i) + histogram(j);
        end
    end
    
    %Multiply by total number of values
    for k = 1:256
       transformation(k) = round(transformation(k)*(255));    
    end

end
