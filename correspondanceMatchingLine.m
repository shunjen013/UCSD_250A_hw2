function corsSSD = correspondanceMatchingLine(I1, I2, corners1, ...
    FMatrix, R, SSDth)
epiLine_dino02 = [];
for i = 1:size(corners1, 1)
    line_2 = linePts(FMatrix  *[corners1(i,:),1]', [1, size(I2, 2)], ...
        [1, size(I2, 1)]);
    epiLine_dino02 = [epiLine_dino02; line_2(1,:), line_2(2,:)];
end
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
corsSSD = [];
for i = 1:size(epiLine_dino02, 1)
    points = interpolateLine(epiLine_dino02(i, :));
    minSSD = 10000000;
    bestMatch = 0;
    window_1 = I1(corners1(i,2)-R:corners1(i,2)+R, ...
        corners1(i,1)-R:corners1(i,1)+R);
    for j = 1:size(points, 1)
        if points(j, 2)-R > 0 && points(j, 2)+R < size(I2,1) && ...
                points(j, 1)-R > 0 && points(j, 1)+R < size(I2,2)
            window_2 = I2(points(j, 2)-R:points(j, 2)+R, ...
                points(j, 1)-R:points(j, 1)+R);
            if SSDmatch(window_1, window_2) < minSSD
                minSSD = SSDmatch(window_1, window_2);
                bestMatch = j;
            end
        end
    end
    if minSSD < SSDth
        corsSSD = [corsSSD; corners1(i, :), points(bestMatch, :)];
    end
end
corsSSD = double(corsSSD);

end

