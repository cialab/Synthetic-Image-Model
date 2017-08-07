function [ rbgResults ] = visualizeMask( IMG, mask1,mask2 )
% @ingroup VisualizatinAndDrawing
% draw binary results on a image
%
% Keywords:
% draw, binary
%
% Parameters:
%   IMG: input image, 
%        @type matRGB 
%   mask1: Binary mask 1
%        @type matB 
%   mask2: Binary mask 2
%        @type matB 
%@returns
%    rbgResults: visual Results,
%        @type matRGB
% Example Usage:
%@code
%[ rbgResults ] = visualizeMask( IMG, mask1,mask2 )
%@endcode

%@author Caglar Senaras @date 2016-05-07
%
%@change{16,10,CS,2016-05-10}  Comments added
%
% \todo merge with visualizeMask2
%

if size(IMG,3)==1
    IMG(:,:,2)=IMG(:,:,1);
    IMG(:,:,3)=IMG(:,:,1);
end
switch nargin
    case 3
        t1=255* uint8( imdilate(double(mask1),ones(3))- imerode(double(mask1),ones(3)));
        t2=255* uint8( imdilate(double(mask2),ones(3))- imerode(double(mask2),ones(3)));
        rbgResults= IMG;
        rbgResults(:,:,2) = IMG(:,:,2) +t1 - (t2.*(255-t1));
        rbgResults(:,:,1) = IMG(:,:,1) +t2 -(t1.* (255-t2));
        rbgResults(:,:,3) = IMG(:,:,3) -t1 -t2;
    case 2
        rbgResults= IMG;
        t1 = 255* uint8( imdilate(double(mask1),ones(3))- imerode(double(mask1),ones(3)));
        rbgResults(:,:,2) = IMG(:,:,2) +t1;
        rbgResults(:,:,1) = IMG(:,:,1) -t1;
        rbgResults(:,:,3) = IMG(:,:,3) -t1;
        
end

