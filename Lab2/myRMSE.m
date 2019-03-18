function [RMSE] = myRMSE(img1,img2)
    [r,c] = size(img1)
    
    pixelDiff = 0

    for x = 1:r
        for y = 1:c
            pixelDiff = pixelDiff + (double(img1(x,y))-double(img2(x,y)))^2
        end
    end
    
    RMSE = sqrt(pixelDiff/(r*c))

end

