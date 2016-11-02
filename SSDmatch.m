function SSD = SSDmatch( window_1, window_2 )
SSD = (norm(window_1(:)-window_2(:)))^2;
end

