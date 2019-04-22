function thresh = GetOtsuThresh(im)
[counts,~] = imhist(im);
thresh = otsuthresh(counts);
end