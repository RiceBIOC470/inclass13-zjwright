%Inclass 13

%Part 1. In this directory, you will find an image of some cells expressing a 
% fluorescent protein in the nucleus. 
% A. Create a new image with intensity normalization so that all the cell
% nuclei appear approximately eqully bright. 
% B. Threshold this normalized image to produce a binary mask where the nuclei are marked true. 
% C. Run an edge detection algorithm and make a binary mask where the edges
% are marked true.
% D. Display a three color image where the orignal image is red, the
% nuclear mask is green, and the edge mask is blue. 

%Part 2. Continue with your nuclear mask from part 1. 
%A. Use regionprops to find the centers of the objects
%B. display the mask and plot the centers of the objects on top of the
%objects
%C. Make a new figure without the image and plot the centers of the objects
%so they appear the same as when you plot on the image (Hint: remember
%Image coordinates). 