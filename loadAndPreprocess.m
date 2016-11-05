function [ output_img ] = loadAndPreprocess( input_img )
    output_img = imread(input_img);
    output_img = im2double(output_img);
    output_img = output_img - mean(output_img(:));
end

