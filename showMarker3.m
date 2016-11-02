function showMarker3(img, corsSSD, inlier, outlier)
imshow(img);
hold on;
scatter(corsSSD(:, 1)',corsSSD(:, 2)',130,'k','LineWidth',3);
scatter(inlier(:, 1)',inlier(:, 2)',130,'b','+','LineWidth',3);
scatter(outlier(:, 1)',outlier(:, 2)',130,'r','+','LineWidth',3);
hold off;

end

