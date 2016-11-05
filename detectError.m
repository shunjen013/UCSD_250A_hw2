function [ overlap ] = detectError( predicted_box, ground_truth_box)
    intersection_area = rectint(predicted_box, ground_truth_box);
    union_area = predicted_box(3)*predicted_box(4) + ...
        ground_truth_box(3)*ground_truth_box(4) - intersection_area;
    overlap = double(intersection_area)/double(union_area);
end

