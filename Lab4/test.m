
filter = [0,0,0; 
           0,1,0; 
           0,0,0];
       
image = [0,1,1; 
         0,1,0; 
         1,1,1];

disp(spatial_filter(image,filter));