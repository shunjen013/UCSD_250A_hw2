function [ rect ] = constructBoundingBox( ori_img, heat_map, ...
    ground_truth_box )
    % find maximum intensity
    max_intensity = 0;
    max_index = zeros(1,2);
    for i = 1:size(ori_img, 1)
       for j = 1:size(ori_img, 2)
           max_intensity = max(heat_map(i,j), max_intensity);
       end
    end
    for i = 1:size(ori_img, 1)
        for j = 1:size(ori_img, 2)
            if heat_map(i,j) == max_intensity
                max_index(1,1) = i;
                max_index(1,2) = j;
            end
        end
    end
    len = ground_truth_box(4);
    width = ground_truth_box(3);
%     len = size(filter_img, 1);
%     width = size(filter_img, 2);
    figure;
    imshow(ori_img);
    hold on;
    y = max_index(1,1)-len/2;
    x = max_index(1,2)-width/2;
    rectangle('Position',[x y width len],'EdgeColor','b', 'LineWidth', 3);
    rect = [x y width len];
end

