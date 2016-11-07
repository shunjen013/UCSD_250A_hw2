function showMatching(I1,I2,corsSSD)
matchedPoints_1 = [];
matchedPoints_2 = [];
for i = 1:size(corsSSD, 1)
    matchedPoints_1 = [matchedPoints_1; corsSSD(i, 1:2)];
    matchedPoints_2 = [matchedPoints_2; corsSSD(i, 3:4)];
end
showMatchedFeatures(I1,I2,matchedPoints_1,matchedPoints_2,'montage',...
    'PlotOptions',{'ro','ro','b-'});

end

