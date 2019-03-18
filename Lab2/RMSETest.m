
%Resize images
img1 = myimresize(imread('test.tif'),[40,75],"nearest");
img2 = myimresize(imread('test.tif'),[40,75],"bilinear");
img3 = myimresize(imread('test.tif'),[425,600],"nearest");
img4 = myimresize(imread('test.tif'),[425,600],"bilinear");


%Reconstructed images
img5 = myimresize(img1,[300,300],"nearest");
img6 = myimresize(img2,[300,300],"bilinear");
img7 = myimresize(img3,[300,300],"nearest");
img8 = myimresize(img4,[300,300],"bilinear");


res1 = myRMSE(imread('test.tif'), img5);
res2 = myRMSE(imread('test.tif'), img6);
res3 = myRMSE(imread('test.tif'), img7);
res4 = myRMSE(imread('test.tif'), img8);

disp('reult 1 = nearest small to big' + string(res1))
disp('reult 2 = bilinear small to big' + string(res2))
disp('reult 3 = nearest big to small' + string(res3))
disp('reult 4 = bilinear big to small' + string(res4))