function [ heat_map ] = constructHeatMap( input_img, filter_img )
    heat_map = conv2(input_img, filter_img, 'same');
    figure;
    imagesc(heat_map);
end

