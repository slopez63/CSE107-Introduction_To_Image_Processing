


%Call function to transform images to halftone
halftoneFace = halftone(imread('Fig0225(a)(face).tif'));
halftoneCameraMan = halftone(imread('Fig0225(b)(cameraman).tif'));
halftoneCrowd = halftone(imread('Fig0225(c)(crowd).tif'));


%Dislpay images
figure;
subplot(2,2,1),imshow(halftoneFace);
subplot(2,2,2),imshow(halftoneCameraMan);
subplot(2,2,3),imshow(halftoneCrowd);

