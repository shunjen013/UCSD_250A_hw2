function showMarker1(img, pts)
imshow(img);
hold on;
scatter(pts(:, 1)',pts(:, 2)',250,'b','LineWidth',4);
hold off;
end

