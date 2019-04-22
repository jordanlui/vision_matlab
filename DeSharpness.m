function [score] = DeSharpness(im)
% Sharpness measure from De 2013 Image Sharpness Measure for Blurred Images in Frequency Domain
F = fft2(double(im));
FS = fftshift(F);
AF = abs(FS);
M = max(AF(:));
thresh = M/1000;
TH = sum(sum(F>thresh));

score = TH/(size(im,1)*size(im,2));


end