function showMatching(I1,I2,corners1,corners2)
matchedPoints_1 = [];
matchedPoints_2 = [];
for i = 1:size(corners1, 1)
    if corners2(i, :) ~= [0, 0]
        matchedPoints_1 = [matchedPoints_1; corners1(i, :)];
        matchedPoints_2 = [matchedPoints_2; corners2(i, :)];
    end
end
showMatchedFeatures(I1,I2,matchedPoints_1,matchedPoints_2,'montage',...
    'PlotOptions',{'ro','ro','b-'});

end

