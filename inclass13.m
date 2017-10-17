%Inclass 13
clear all
%Part 1. In this directory, you will find an image of some cells expressing a 
% fluorescent protein in the nucleus. 
cells_image_original=imread('Dish1Well8Hyb1Before_w0001_m0006.tif');
figure(1)
imshow(cells_image_original, []);
% A. Create a new image with intensity normalization so that all the cell
% nuclei appear approximately eqully bright. 
cells_image=im2double(cells_image_original);
cells_image2=cells_image.*(cells_image>0.075);
cells_image_dilate=imdilate(cells_image2, strel('disk', 60));
cells_image_norm=cells_image2./cells_image_dilate;
figure(2)
imshow(cells_image_norm, []);
% B. Threshold this normalized image to produce a binary mask where the nuclei are marked true. 
cells_mask=cells_image_norm>0.2;
figure(3)
imshow(cells_mask)
% C. Run an edge detection algorithm and make a binary mask where the edges
% are marked true.
cells_edge=imdilate(edge(cells_mask, 'canny', [0.3]), strel('disk', 2));
figure(4)
imshow(cells_edge)

% D. Display a three color image where the orignal image is red, the
% nuclear mask is green, and the edge mask is blue. 
cells_3color = cat(3, im2double(imadjust(cells_image_original)), cells_mask, cells_edge);
figure(5)
imshow(cells_3color)

%Part 2. Continue with your nuclear mask from part 1. 
%A. Use regionprops to find the centers of the objects
cell_info = regionprops(cells_mask, 'Centroid');
cell_centers=[cell_info.Centroid];
%B. display the mask and plot the centers of the objects on top of the
%objects
figure(6)
imshow(cells_3color)
hold on
for ii = 1:2:length(cell_centers)
    plot(cell_centers(ii), cell_centers(ii+1), '*r')
    hold on
end
%C. Make a new figure without the image and plot the centers of the objects
%so they appear in the same positions as when you plot on the image (Hint: remember
%Image coordinates). 
figure(7)
[x_length, y_length] = size(cells_3color);
for ii = 1:2:length(cell_centers)
    plot(cell_centers(ii), y_length-cell_centers(ii+1), '*r')
    hold on
end
