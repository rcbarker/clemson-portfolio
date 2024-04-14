% Whack-a-Mole Project
% BBBBPE (Team W8)
% November 8th, 2015

% File Description: Takes image, converts, to HSV, and uses 5x5 average
% saturation values to check each if each LED is lit. Returns 

function [color, sectionNumber]= imageProcess(vid, background)
% Input:
% 'vid' - Variable connected to the camera. 480x640 resolution.
% 'background' - Background image for image processing.
% 
% Return Values:
% 'color' - The color of the lit LED folowing the scheme:
%           1 = Red
%           2 = Green
%           3 = Yellow
%          -1 = No LED lit
% 'sectionNumber' - The board section containing the lit LED. If
%                   no LED is lit, this equals -1.

% Get foreground image and convert to hsv.
foreground = getsnapshot(vid);
% figure, imshow(foreground);

% Background subtract 
differenceIm = foreground;
for i = 1:480
    for j = 1:640
        if(i > 345 && i < 390)
            differenceIm(i,j,:) = foreground(i,j,:) - background(i,j,:);
        else
            differenceIm(i,j,:) = 0;
        end
    end
end
           

% Convert to black and white. 
BW = im2bw(differenceIm, 0.10);

% Remove noise.
BW_removed = bwareaopen(BW, 20);

% Erode slightly:
SE = strel('square', 3);
final = imerode(BW_removed, SE);

% For debug.
% figure, imshow(differenceIm);
% figure, imshow(BW);
% figure, imshow(BW_removed);
% figure, imshow(final);
 
% Find centroids with regionprops.
centroid = regionprops(final, 'centroid');

% Location variables. 
sectionNumber = -1;
color = -1;

% Find section of board containing LED.
if not(isempty(centroid))
   centX = round(centroid(1).Centroid(1));
   % centY = round(centroid(1).Centroid(2));
   % fprintf('centroid %d - x: %d, y: %d\n', centX, centY);
   
   if(centX < 64)
       % G1
       color = 2;
       sectionNumber = 1;
   elseif(centX < 73)
       % Y1
       color = 3;
       sectionNumber = 1;
   elseif(centX < 104)
       % R1
       color = 1;
       sectionNumber = 1;
   elseif(centX < 139)
       % G2
       color = 2;
       sectionNumber = 2;
   elseif(centX < 158)
       % Y2
       color = 3;
       sectionNumber = 2;
   elseif(centX < 184)
       % R2
       color = 1;
       sectionNumber = 2;
   elseif(centX < 210)
       % G3
       color = 2;
       sectionNumber = 3;
   elseif(centX < 230)
       % Y3
       color = 3;
       sectionNumber = 3;
   elseif(centX < 257)
       % R3
       color = 1;
       sectionNumber = 3;
   elseif(centX < 284)
       % G4
       color = 2;
       sectionNumber = 4;
   elseif(centX < 303)
       % Y4
       color = 3;
       sectionNumber = 4;
   elseif(centX < 329)
       % R4
       color = 1;
       sectionNumber = 4;
   elseif(centX < 354)
       % G5
       color = 2;
       sectionNumber = 5;
   elseif(centX < 373)
       % Y5
       color = 3;
       sectionNumber = 5;
   elseif(centX < 400)
       % R5
       color = 1;
       sectionNumber = 5;
   elseif(centX < 428)
       % G6
       color = 2;
       sectionNumber = 6;
   elseif(centX < 446)
       % Y6
       color = 3;
       sectionNumber = 6;
   elseif(centX < 472)
       % R6
       color = 1;
       sectionNumber = 6;
   elseif(centX < 499)
       % G7
       color = 2;
       sectionNumber = 7;
   elseif(centX < 518)
       % Y7
       color = 3;
       sectionNumber = 7;
   elseif(centX < 544)
       % R7
       color = 1;
       sectionNumber = 7;
   elseif(centX < 569)
       % G8
       color = 2;
       sectionNumber = 8;
   elseif(centX < 587)
       % Y8
       color = 3;
       sectionNumber = 8;
   elseif(centX < 606)
       % R8
       color = 1;
       sectionNumber = 8;
   end
end
end