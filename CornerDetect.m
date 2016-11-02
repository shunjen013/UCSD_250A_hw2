function corners = CornerDetect(Image, nCorners, smoothSTD, windowSize)
Image_blur = imgaussfilt(rgb2gray(Image),smoothSTD);
[gradient_Y, gradient_X] =  gradient(Image_blur);
windowDiameter = fix(windowSize/2);
minEigen = zeros(size(Image, 1), size(Image, 2));
for i = (1 + windowDiameter):(size(Image, 1) - windowDiameter)
    for j = (1 + windowDiameter):(size(Image, 2) - windowDiameter)
        window_gX = gradient_X(i - windowDiameter: i + windowDiameter, j - windowDiameter: j + windowDiameter);
        window_gY = gradient_Y(i - windowDiameter: i + windowDiameter, j - windowDiameter: j + windowDiameter);
        C = zeros(2, 2);
        C(1, 1) = sum(window_gX(:).^2);
        C(2, 2) = sum(window_gY(:).^2);
        C(1, 2) = sum(window_gX(:).*window_gY(:));
        C(2, 1) = C(1, 2);
        e = eig(C);
        minEigen(i, j) = min(e);
    end
end
minEigen_NMS = [];
for i = (1 + windowDiameter):(size(minEigen, 1) - windowDiameter)
    for j = (1 + windowDiameter):(size(minEigen, 2) - windowDiameter)
        localArea = minEigen(i - windowDiameter:i + windowDiameter, j - windowDiameter:j + windowDiameter);
        if minEigen(i, j) == max(localArea(:))
            minEigen_NMS = [minEigen_NMS; minEigen(i, j), j, i];
        end
    end
end
[B, idx] = sort(minEigen_NMS(:, 1), 'descend');
corners = [];
for i = 1:nCorners
    corners = [corners; minEigen_NMS(idx(i), 2:3)];
end    

end

