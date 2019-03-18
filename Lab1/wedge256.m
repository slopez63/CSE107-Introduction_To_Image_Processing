%256 wedge

wedge = ones(256,256);

count = 0;

for i = 1:256
    for j = 1:256
        wedge(i,j) = wedge(i,j) + count;
    end
    count = count + 1;
end


image = halftone(wedge);

imagesc(image)                   % Plot matrix as image
colormap gray;               % Choose gray level colormap
axis image;                  % Show pixel coordinates as axes
axis off;                    % Remove axes