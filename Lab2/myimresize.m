function [resizedImage] = myimresize(image, resize, interpolation)
%myimresize
%   Detailed explanation goes here
% Example: myimresize(imread('test.tif'), 300, "bilinear")

    %find matrix size for rows and columns 
    [xSize,ySize] = size(image);

    %create an empty matrix for resized image
    resizedImage = zeros([resize(1),resize(2)]);

    if interpolation == "nearest"

        disp('Computating nearest')

        %loop for going through all of the values needed for the new image
        for pixelX = 1:resize(1)
            for pixelY = 1:resize(2)

                %to find the closest x and y just round to nearest interger
                locatedXPixel = round((xSize)/(resize(1))*(pixelX - 0.5) + 0.5);
                locatedYPixel = round((ySize)/(resize(2))*(pixelY - 0.5) + 0.5);

                %place selected value to new resized matrix
                resizedImage(pixelX,pixelY) = image(locatedXPixel,locatedYPixel);

            end
        end

        %changed format of matrix to 256
        resizedImage = uint8(resizedImage)






    elseif interpolation == "bilinear"
        disp('computating bilinear')


        %loop for going through all of the values needed for the new image
        for pixelX = 1:resize(1)
            for pixelY = 1:resize(2)

                %find pixel location using ratios
                x = (xSize)/(resize(1))*(pixelX - 0.5) + 0.5;
                y = (ySize)/(resize(2))*(pixelY - 0.5) + 0.5;


                %set of rules to find surounding pixel values

                % X

                %If its an integer
                if mod(x,1) == 0
                    m1 = x
                    m2 = x
                else
                    if x < 1
                        m1 = 1
                        m2 = 2 
                    elseif x > xSize
                        m1= xSize-1
                        m2= xSize
                    else
                        m1 = floor(x)
                        m2 = ceil(x)
                    end
                end

                %Y

                %If its an integer
                if mod(y,1) == 0
                    n1=y
                    n2=y
                else
                    if y < 1
                        n1=1
                        n2=2 
                    elseif y > ySize
                        n1=ySize-1
                        n2=ySize
                    else
                        n1 = floor(y)
                        n2 = ceil(y)
                    end
                end

                pixelLocs1 = [m1,n1,m1,n2,m2,n1,m2,n2]

                pixelVals1 = [image(m1,n1),image(m1,n2),image(m2,n1),image(m2,n2)]  
                
                %Call function to calculate bilinear value
                bilinearVal = mybilinear(pixelLocs1, pixelVals1, [x,y])

                %place selected value to new resized matrix
                resizedImage(pixelX,pixelY) = bilinearVal;

            end
        end

        %changed format of matrix to 256
        resizedImage = uint8(resizedImage)

    else

        %Prints if the input string for type of interpolation is unknown
        disp('could not understand interpolation')

    end

end

