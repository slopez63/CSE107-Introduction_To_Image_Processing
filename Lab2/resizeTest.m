
%Resize images
img1 = myimresize(imread('test.tif'),[40,75],"nearest");
img2 = myimresize(imread('test.tif'),[40,75],"bilinear");
%img3 = myimresize(imread('test.tif'),[425,600],"nearest");
%img4 = myimresize(imread('test.tif'),[425,600],"bilinear");


%Dislpay images
figure;
subplot(2,2,1),imshow(img1);
subplot(2,2,2),imshow(img2);
%subplot(2,2,3),imshow(img3);
%subplot(2,2,4),imshow(img4);