function [theta_out, rho_out, accumulator] = hough_transform(i_edge)
%hough_transform 
%   Determines whether edge points lie on specific boundaries of objects.
%   This function is specifically only for lines
%
%INPUT: Edge Image (Sobel, Canny)
%
%Output: theta = normal angle most repeated
%        rho = nornal ditance most repeated
%        accumulator = matrix that portrays all possible line intersections
%

%gets size of image
imageSize = size(i_edge);
imageRow = imageSize(1);
imageColumn = imageSize(2);

points = ones(imageRow+imageColumn, 2);
%points are negative if they do not exist
points = points*-1;

%find points that are edges
points_count = 1;
for i = 1:imageRow
    for j = 1:imageColumn
        if(i_edge(i,j) == 255)
            points(points_count,1) = i;
            points(points_count,2) = j;
            points_count = points_count + 1;
        end
    end
end

%get diagonal distance of image
x = imageRow;
y = imageColumn;
D = round(sqrt(x^2+y^2));

%create empty accumulator matrix
accumulator_matrix = zeros(2*D+1,180);

    %find all possible sinusoid curves
    for i = 1 : points_count-1
        for theta = -89:90
             rho = points(i,1) * cosd(theta) + points(i,2) * sind(theta); 
             accumulator_matrix(round(rho)+D+1,theta+90) = accumulator_matrix(round(rho)+D+1,theta+90) + 1;
        end
    end
    
    %find which sinusoid intersects the most
    temp = 0;
    for j = 1 : 2*D+1
        for k = 1:180
            
             if(accumulator_matrix(j,k) > temp)
                 
                 temp = accumulator_matrix(j,k);
                 theta_out = k - 90;
                 rho_out = j - D - 1;
                 
             end
        end
    end
  
    accumulator = accumulator_matrix;
end