clear all;
clc;
close all;
load xx;

for i = 1:length(xx)
    i
    img = imread([num2str(xx(i)) '.tif']);
%     [lab_res,center,EigMat] = run_Ki67(img);
    [lab_res] = run_Ki67_bw(img);
    bg = bwareaopen(imopen(lab_res(:,:,2),ones(5)),100);
    lab_res = lab_res(:,:,1);
    BG(i) = sum(sum(bg));
    LAB_RES{i} = lab_res;
    M2(i) = sum(sum(lab_res));
%     C = imfuse(img,lab_res);
%     figure(1), imshow(C,[])
   figure, imshow(visualizeMask(img,lab_res,bg),[]);
%       figure, overlay_images(img,lab_res);
%      figure, overlay_images(img,BG);
%      figure, imshow(bg,[])
% pause
% close all;
end

ratio = M2./(BG+M2)*100;
