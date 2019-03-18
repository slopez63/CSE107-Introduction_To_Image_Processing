function [histogram] = compute_histogram(image)
%Compute Histogram
%   Takes in grayscale image and outputs a vector histogram of size 256

 mn = size(image);
 m = mn(1);
 n = mn(2);
 
 %create empty matrix for final values
 prob = zeros(1,256);
 
 %calculate probabilities
 for i = 1:m
     for j = 1:n
         prob(image(i,j)+1) = prob(image(i,j)+1) + 1;
     end
 end
 
 for f = 1:256
         prob(f) = ((prob(f))/(m*n));
 end

 histogram = prob;
end