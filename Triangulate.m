function points3D = Triangulate(corsSSD, P1, P2)
points3D = [];
for i = 1:size(corsSSD, 1)
    L_1 = [1, 1, -corsSSD(i, 1)-corsSSD(i, 2);
           1,-1, -corsSSD(i, 1)+corsSSD(i, 2)];
    L_2 = [1, 1, -corsSSD(i, 3)-corsSSD(i, 4);
           1,-1, -corsSSD(i, 3)+corsSSD(i, 4)];
    A_1 = L_1*P1;
    A_2 = L_2*P2;
    [U,S,V] = svd([A_1; A_2]);
    point3D = V(:, size(V, 2))';
    point3D = point3D./point3D(4);
    points3D = [points3D; point3D(1, :)];
end

