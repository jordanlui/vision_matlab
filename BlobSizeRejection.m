function [imResult] = BlobSizeRejection(threshInv,blobSizeThresh)

% Clean image by removing blobs below a threshold size

cc = bwconncomp(threshInv);
stats = regionprops(cc);
% Get blob sizes
blobSizes = [stats.Area]';
% Size threshold the blobs
blobsToKeep = blobSizes > blobSizeThresh;

% Loop through blobs and draw to a new image
imResult = zeros(size(threshInv));
y=0; x=0;
index = 0;
indices = [];
for i = 1:length(blobsToKeep)
    if blobsToKeep(i)
        % Loop through each pixel ID for that blob
        indices = cc.PixelIdxList{i};
        for j = 1:length(indices)
            % Get subscript indices
            index = indices(j);
            [y,x] = ind2sub(size(imResult),index);
            imResult(y,x) = 1;
        end
    end
end

end