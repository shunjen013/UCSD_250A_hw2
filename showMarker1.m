function showMarker1(img, pts)
imshow(img);
hold on;
scatter(pts(:, 1)',pts(:, 2)',130,'b','LineWidth',3);
hold off;
end

