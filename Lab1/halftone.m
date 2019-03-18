function [outputImage] = halftone(inputImage)
    %halftone   This function transforms a greyscale image into a binary image. 
    %           
    %
    %Input:
    %
    %Its input is an image array/matrix of its grayscale values form 0 to
    %255.
    %
    %Output:
    %
    %Its output is an image array/matrix that only has values 0 and
    %255. 
    %
    %This halftone function also uses 10 patterns to simplify the data.
    %To use function simply instert an image Matrix to the function.
    %
    % halftone(InputImageMatrix)   =   Halftoned Image
    
    
    %Indexes for input and output image 
    [r,c] = size(inputImage);

    %Got rid of possible decimal point for output image (simplified)
    rpro = ceil(r/3)*3;
    cpro = ceil(c/3)*3;
    
    %Create a 
    image = 255*ones(rpro,cpro);
    image(1:r,1:c) = inputImage;
    
    
    %Pattern Dimension
    d = 3;
    
    %Create a matrix that stores the patterns
    pattern = zeros(d,d,d*d+1);
    
            %Assign matrix values for patterns
            pattern(:,:,10) = [255,255,255; 255,255,255; 255,255,255];

            pattern(:,:,9) = [255,0,255; 255,255,255; 255,255,255];
       
            pattern(:,:,8) = [255,0,255; 255,255,255; 255,255,0];

            pattern(:,:,7) = [0,0,255; 255,255,255; 255,255,0];

            pattern(:,:,6) = [0,0,255; 255,255,255; 0,255,0];

            pattern(:,:,5) = [0,0,0; 255,255,255; 0,255,0];

            pattern(:,:,4) = [0,0,0; 255,255,0; 0,255,0];

            pattern(:,:,3) = [0,0,0; 255,255,0; 0,0,0];

            pattern(:,:,2) = [0,0,0; 0,255,0; 0,0,0];

            pattern(:,:,1) = [0,0,0; 0,0,0; 0,0,0];
            
        
        %Create

        proImage = zeros(r,c);    
        
        
        %Loop through whole image
        for(i = 1:rpro/3)
            for(j = 1:cpro/3)
                
                %Calculate average of selected 3x3 matrix
                average = mean(mean(image((i*3-2):(i*3),(j*3-2):(j*3))));
                
                %Get Pattern from average
                SelectP = ceil(average/(256/(d*d+1))); 
                
                %Apply pattern to Image
                proImage((i*3-2):(i*3),(j*3-2):(j*3)) = pattern(:,:, SelectP);
            end
        end
        
        %Convert image to uint8(values 0-255)
        proImage = uint8(proImage);
        
        %Copy image for final output
        outputImage = proImage(1:r,1:c);
  
end
            
    
    
    
        