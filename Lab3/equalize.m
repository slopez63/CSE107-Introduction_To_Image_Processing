function [outputArg1] = equalize(image)
%Equalize 
%   Takes in as input a grayscale image 256 bits and returns the histogram
%   equalized version.

%gets index sizes
 mn = size(image);
 m = mn(1);
 n = mn(2);
 
%create a matrix for final processed image
finalImage = zeros(m,n);

%store probability values on a 256 vector
histogram = compute_histogram(image);

%get transformation vector that is size 256
transformation = histogram_transform(compute_histogram(image));

%plot calculated values to final image
for i = 1:m
    for j = 1:n
       finalImage(i,j) = transformation(image(i,j)+1);
    end
end

%calculate histogram of final transformed image
histogram2 = compute_histogram(finalImage);

finalImage = uint8(finalImage);

%PLOT EVERYTHING
figure;
subplot(2,2,1),plot_histogram(histogram);
subplot(2,2,2),plot_histogram(histogram2);

subplot(2,2,3),imshow(image);
subplot(2,2,4),imshow(finalImage);

image = double(image);
finalImage = double(finalImage);

disp("Mean Origianl")
disp(mean(image(:)))

disp("Standard Deviation Origianl")
disp(std(image(:)))

disp("Mean Equalized")
disp(mean(finalImage(:)))

disp("Standard Deviation Equalized")
disp(std(finalImage(:)))

outputArg1 = 0;

%PRINT MEAN AND STANDARD DEVIATION

end