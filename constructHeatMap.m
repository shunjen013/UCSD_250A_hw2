function [ heat_map ] = constructHeatMap( input_img, filter_img )
    filter_img = flip(filter_img, 1);
    filter_img = flip(filter_img, 2);
    heat_map = conv2(input_img, filter_img, 'same');
    figure;
    imagesc(heat_map);
end

