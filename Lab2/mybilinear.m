function [bilinearValue] = mybilinear(pixelLocs,pixelVals,interpoLoc)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

P51 = ((pixelVals(3) - pixelVals(1))* ((interpoLoc(1) - pixelLocs(1))/(pixelLocs(5)-pixelLocs(1)))) + pixelVals(1)

P52 = ((pixelVals(3) - pixelVals(1))* ((interpoLoc(1) - pixelLocs(3))/(pixelLocs(7)-pixelLocs(3)))) + pixelVals(2)

P5 = ((P52 - P51)* ((interpoLoc(2)-pixelLocs(2))/(pixelLocs(4)-pixelLocs(2)))) + P51

bilinearValue = P5;


end

