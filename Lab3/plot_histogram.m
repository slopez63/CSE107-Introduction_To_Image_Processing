function [outputArg1] = plot_histogram(histogram)
%Plot Histogram
%   Takes in a histogram and plots it into a graph

 bar(histogram);
 
 %Graph labels
 xlabel("Intensity Value");
 ylabel("PMF");

outputArg1 = 0;
end