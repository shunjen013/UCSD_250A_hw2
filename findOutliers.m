function [ inlier, outlier ] = findOutliers(points3D, P2, outlierTH, ...
    corsSSD)
inlier = [];
outlier = [];
for i = 1:size(corsSSD, 1)
    if corsSSD(i, :) ~= [0, 0]
        reproject = P2*(points3D(i, :)');
        reproject = reproject(1:2,1)./reproject(3,1);
        if norm(reproject - corsSSD(i, :)') < outlierTH
            inlier = [inlier; reproject'];
        else
            outlier = [outlier; reproject'];
        end
    end
end
end

