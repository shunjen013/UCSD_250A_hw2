clc;
%% Problem 5.1 Smoothing
geisel = imread('geisel.jpeg');
geisel = im2double(geisel);
figure;
imshow(geisel);
title('Input Image');
K = 1/159*[2,4,5,4,2;4,9,12,9,4;5,12,15,12,5;4,9,12,9,4;2,4,5,4,2];
gaussian = conv2(geisel, K, 'same');
figure;
imshow(gaussian);
title('Gaussian Filter with sigma = 1.4');
%% Problem 5.2 Gradient Computation
sx = [-1,0,1;-2,0,2;-1,0,1];
sy = [-1,-2,-1;0,0,0;1,2,1];
Gx = conv2(gaussian, sx, 'same');
Gy = conv2(gaussian, sy, 'same');
for i = 1:length(Gx)
    for j = 1:length(Gy)
        G(i,j) = sqrt(Gx(i,j)^2 + Gy(i,j)^2);
        edge_direction(i,j) = atan2(Gy(i,j), Gx(i,j));
        edge_direction(i,j) = rad2deg(edge_direction(i,j));
        if (edge_direction(i,j) < 0)
            edge_direction(i,j) = edge_direction(i,j) + 180;
        end
    end
end
figure;
imshow(G);
title('Gradient Magnitude');
%% Problem 5.3 Non Maximum Suppression
edge_candidate = zeros(size(G));
for i = 2:length(G)-1
    for j = 2:length(G)-1
        round_direction(i,j) = round2nearest45(edge_direction(i,j));
        switch(round_direction(i,j))
            case 0 % east and west directions
                if G(i,j) > G(i,j-1) && G(i,j) > G(i,j+1)
                    edge_candidate(i,j) = G(i,j);
                end
            case 45 % north east and south west directions
                if G(i,j) > G(i-1,j+1) && G(i,j) > G(i+1,j-1)
                    edge_candidate(i,j) = G(i,j);
                end
            case 90 % north and south directions
                if G(i,j) > G(i-1,j) && G(i,j) > G(i+1,j)
                    edge_candidate(i,j) = G(i,j);
                end
            case 135 % north west and south east directions
                if G(i,j) > G(i-1,j-1) && G(i,j) > G(i+1,j+1)
                    edge_candidate(i,j) = G(i,j);
                end
        end
    end
end
figure;
imshow(edge_candidate);
title('Non Maximum Suppression');
%% Problem 5.4 Hysteresis Thresholding
high = 0.4;
low = 0.1;
A = [];
for i = 2:length(edge_candidate)-1
    for j = 2:length(edge_candidate)-1
        if edge_candidate(i,j) > high
            A = [A; i j];
        end
    end
end
result = zeros(size(edge_candidate));
while ~isempty(A)
    cur = A(size(A,1),:);
    A(size(A,1),:) = [];
    result(cur(1),cur(2)) = 1;
    if cur(1)>1 && cur(1)<length(edge_candidate)-1 && cur(2)>1 ...
            && cur(2)<length(edge_candidate)-1
        if edge_candidate(cur(1)-1,cur(2)-1) > low ...
                && result(cur(1)-1,cur(2)-1) == 0
            A = [A; cur(1)-1 cur(2)-1];
        elseif edge_candidate(cur(1)-1,cur(2)) > low ...
                && result(cur(1)-1,cur(2)) == 0
            A = [A; cur(1)-1 cur(2)];
        elseif edge_candidate(cur(1)-1,cur(2)+1) > low ...
                && result(cur(1)-1,cur(2)+1) == 0
            A = [A; cur(1)-1 cur(2)+1];
        elseif edge_candidate(cur(1),cur(2)-1) > low ...
                && result(cur(1),cur(2)-1) == 0
            A = [A; cur(1) cur(2)-1];
        elseif edge_candidate(cur(1),cur(2)+1) > low ...
                && result(cur(1),cur(2)+1) == 0
            A = [A; cur(1) cur(2)+1];
        elseif edge_candidate(cur(1)+1,cur(2)-1) > low ...
                && result(cur(1)+1,cur(2)-1) == 0
            A = [A; cur(1)+1 cur(2)-1];
        elseif edge_candidate(cur(1)+1,cur(2)) > low ...
                && result(cur(1)+1,cur(2)) == 0
            A = [A; cur(1)+1 cur(2)];
        elseif edge_candidate(cur(1)+1,cur(2)+1) > low ...
                && result(cur(1)+1,cur(2)+1) == 0
            A = [A; cur(1)+1 cur(2)+1];
        end
    end
end
figure;
imshow(result);
title('Hysteresis Thresholding');