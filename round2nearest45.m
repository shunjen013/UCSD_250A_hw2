function [ degree_out ] = round2nearest45( degree_in )
    if 0 < degree_in && degree_in < 22.5
        degree_out = 0;
    elseif 22.5 <= degree_in && degree_in < 67.5
        degree_out = 45;
    elseif 67.5 <= degree_in && degree_in < 112.5
        degree_out = 90;
    elseif 112.5 <= degree_in && degree_in < 157.5
        degree_out = 135;
    else
        degree_out = 0;
    end
end

