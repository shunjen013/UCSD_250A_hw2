function showMarker3(img, corsSSD, inlier, outlier)
imshow(img);
hold on;
scatter(corsSSD(:, 3)',corsSSD(:, 4)',250,'k','LineWidth',3);
scatter(inlier(:, 1)',inlier(:, 2)',250,'b','+','LineWidth',3);
scatter(outlier(:, 1)',outlier(:, 2)',250,'r','+','LineWidth',3);
hold off;

end

