function points3D = Triangulate(corners1, corsSSD, P1, P2)
points3D = [];
for i = 1:size(corners1, 1)
    if corsSSD(i, :) == [0, 0]
        points3D = [points3D; 0, 0, 0, 0];
    else
        L_1 = [1, 1, -corners1(i, 1)-corners1(i, 2);
               1,-1, -corners1(i, 1)+corners1(i, 2)];
        L_2 = [1, 1, -corsSSD(i, 1)-corsSSD(i, 2);
               1,-1, -corsSSD(i, 1)+corsSSD(i, 2)];
        A_1 = L_1*P1;
        A_2 = L_2*P2;
        [U,S,V] = svd([A_1; A_2]);
        point3D = V(:, size(V, 2))';
        point3D = point3D./point3D(4);
        points3D = [points3D; point3D(1, :)];
    end
end

