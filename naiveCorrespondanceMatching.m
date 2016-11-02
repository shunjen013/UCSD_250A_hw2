function corsSSD = naiveCorrespondanceMatching(I1, I2, corners1, corners2, R, SSDth)
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
corsSSD = [];
for i = 1:size(corners1, 1)
    minSSD = 10000000;
    bestMatch = 0;
    for j = 1:size(corners2, 1)
        window_1 = I1(corners1(i, 2)-R:corners1(i, 2)+R, corners1(i, 1)-R:corners1(i, 1)+R);
        window_2 = I2(corners2(j, 2)-R:corners2(j, 2)+R, corners2(j, 1)-R:corners2(j, 1)+R);
        if SSDmatch(window_1, window_2) < minSSD
            minSSD = SSDmatch(window_1, window_2);
            bestMatch = j;
        end
    end
    if minSSD < SSDth
        corsSSD = [corsSSD; corners2(bestMatch, :)];
    else
        corsSSD = [corsSSD; 0, 0];
    end
end
end

