clear
clc
%% Problem 4.1 Warmup
filter_img = loadAndPreprocess('filter.jpg');

toy_ori_img = imread('toy.png');
toy_img = loadAndPreprocess('toy.png');
toy_conv = conv2(toy_img, filter_img, 'same');
figure;
imagesc(toy_conv);

% find maximum intensity
max_intensity = max(toy_conv(:));

max_index = zeros(1,2,3);
count = 1;
for i = 1:size(toy_ori_img, 1)
   for j = 1:size(toy_ori_img, 2)
       if toy_conv(i,j) == max_intensity
           max_index(1,1,count) = i;
           max_index(1,2,count) = j;
           count = count + 1;
       end
   end
end
len = size(filter_img, 1);
width = size(filter_img, 2);
figure;
imshow(toy_ori_img);
hold on;
for i = 1:3
    y = max_index(1,1,i)-len/2;
    x = max_index(1,2,i)-width/2;
    rectangle('Position',[x y width len],'EdgeColor','r');
end
%% Problem 4.2 Detection Error
figure;
imshow(toy_ori_img);
hold on;
ground_truth_box_1 = [300,180,len,width];
ground_truth_box_2 = [310,215,len,width];
ground_truth_box_3 = [325,200,len,width];
rect_1 = [x y width len];
rectangle('Position',rect_1, 'EdgeColor','r');
toy_overlap1 = detectError(rect_1, ground_truth_box_1);
toy_overlap2 = detectError(rect_1, ground_truth_box_2);
toy_overlap3 = detectError(rect_1, ground_truth_box_3);
rectangle('Position',ground_truth_box_1, 'EdgeColor','b');
rectangle('Position',ground_truth_box_2, 'EdgeColor','g');
rectangle('Position',ground_truth_box_3, 'EdgeColor','y');
%% Problem 4.3 More Realistic Images
car_template_img = loadAndPreprocess('cartemplate.jpg');

% car1
car1_ori_img = imread('car1.jpg');
car1_img = loadAndPreprocess('car1.jpg');
car1_in = fopen('car1.txt');
car1_rect = textscan(car1_in,'%d %d');
box_len = car1_rect{1}(2)- car1_rect{1}(1);
box_width = car1_rect{2}(2)- car1_rect{2}(1);
car1_box = [car1_rect{1}(1) car1_rect{2}(1) box_len box_width];
% car1 filter preprocessing
car1_template = imcrop(car_template_img, [90 280 1630 620]);
car1_template = imresize(car1_template,[box_width box_len]);
% car1 overlap finding process
heat_map1 = constructHeatMap(car1_img, car1_template);
rect_car1 = constructBoundingBox(car1_ori_img, heat_map1, car1_box);
% rectangle('Position',car1_box, 'EdgeColor','b');
overlap1 = detectError(rect_car1, car1_box);
%% car2
car2_ori_img = imread('car2.jpg');
car2_img = loadAndPreprocess('car2.jpg');
car2_in = fopen('car2.txt');
car2_rect = textscan(car2_in,'%d %d');
box_len = car2_rect{1}(2)- car2_rect{1}(1);
box_width = car2_rect{2}(2)- car2_rect{2}(1);
car2_box = [car2_rect{1}(1) car2_rect{2}(1) box_len box_width];
% car2 filter preprocessing
car2_template = imcrop(car_template_img, [90 280 1630 620]);
car2_template = imresize(car2_template, [box_width box_len]);
car2_template = flip(car2_template,2);
% car1 overlap finding process
heat_map2 = constructHeatMap(car2_img, car2_template);
rect_car2 = constructBoundingBox(car2_ori_img, heat_map2, car2_box);
% rectangle('Position',car2_box, 'EdgeColor','b');
overlap2 = detectError(rect_car2, car2_box);
%% car3
car3_ori_img = imread('car3.jpg');
car3_img = loadAndPreprocess('car3.jpg');
car3_in = fopen('car3.txt');
car3_rect = textscan(car3_in,'%d %d');
box_len = car3_rect{1}(2)- car3_rect{1}(1);
box_width = car3_rect{2}(2)- car3_rect{2}(1);
car3_box = [car3_rect{1}(1) car3_rect{2}(1) box_len box_width];
% car3 filter preprocess
car3_template = imcrop(car_template_img, [90 260 1630 640]);
car3_template = imresize(car3_template, [68 95]);
% car3 overlap finding process
heat_map3 = constructHeatMap(car3_img, car3_template);
rect_car3 = constructBoundingBox(car3_ori_img, heat_map3, car3_box);
% rectangle('Position',car3_box, 'EdgeColor','b');
overlap3 = detectError(rect_car3, car3_box);
%% car4
car4_ori_img = imread('car4.jpg');
car4_img = loadAndPreprocess('car4.jpg');
car4_in = fopen('car4.txt');
car4_rect = textscan(car4_in,'%d %d');
box_len = car4_rect{1}(2)- car4_rect{1}(1);
box_width = car4_rect{2}(2)- car4_rect{2}(1);
car4_box = [car4_rect{1}(1) car4_rect{2}(1) box_len box_width];
% car4 filter preprocess
car4_template = imcrop(car_template_img, [90 280 1630 620]);
car4_template = car4_template + 0.1;
car4_template = imresize(car4_template, [box_width box_len]);
car4_template = flip(car4_template,2);
% car4 overlap finding process
heat_map4 = constructHeatMap(car4_img, car4_template);
rect_car4 = constructBoundingBox(car4_ori_img, heat_map4, car4_box);
% rectangle('Position',car4_box, 'EdgeColor','b');
overlap4 = detectError(rect_car4, car4_box);
%% car5
car5_ori_img = imread('car5.jpg');
car5_img = loadAndPreprocess('car5.jpg');
car5_in = fopen('car5.txt');
car5_rect = textscan(car5_in,'%d %d');
box_len = car5_rect{1}(2)- car5_rect{1}(1);
box_width = car5_rect{2}(2)- car5_rect{2}(1);
car5_box = [car5_rect{1}(1) car5_rect{2}(1) box_len box_width];
% car5 filter preprocess
car5_template = imcrop(car_template_img, [90 280 1630 620]);
car5_template = imresize(car5_template,[box_width box_len]);
car5_template = car5_template + 0.1;
car5_template = flip(car5_template,2);
% car5 overlap finding process
heat_map5 = constructHeatMap(car5_img, car5_template);
rect_car5 = constructBoundingBox(car5_ori_img, heat_map5, car5_box);
% rectangle('Position',car5_box, 'EdgeColor','b');
overlap5 = detectError(rect_car5, car5_box);