function integralImg = IntegralImage(im)
    integralImage = cumsum(cumsum(im,1),2);
end