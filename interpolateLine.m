function points = interpolateLine( line )
lineEnd_1 = line(1, 1:2);
lineEnd_2 = line(1, 3:4);
points = [];
deltaY = (lineEnd_2(2) - lineEnd_1(2))/(lineEnd_2(1) - lineEnd_1(1));
deltaX = (lineEnd_2(1) - lineEnd_1(1))/(lineEnd_2(2) - lineEnd_1(2));
for X = lineEnd_1(1):lineEnd_2(1)
    Y = round(lineEnd_1(2) + (X-lineEnd_1(1))*deltaY);
    points = [points; X, Y];
end
for Y = lineEnd_1(2):lineEnd_2(2)
    X = round(lineEnd_1(1) + (Y-lineEnd_1(2))*deltaX);
    points = [points; X, Y];
end
points = int32(points);
end

