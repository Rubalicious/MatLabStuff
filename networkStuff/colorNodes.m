function [ colors ] = colorNodes( e )
%make a colors vector
blue = [0 0 1];
green = [0 1 0]; 
red = [1 0 0];
n = length(e);
colors = zeros(1,3);
%initialize counter to count number of infected
% count = 0;
for l = 1:n
    if e(l) > 4
%         count = count + 1;
        colors(l,:) = red;
    elseif e(l) < 4
        colors(l,:) = green;
    else
        colors(l,:) = blue;
    end
end
end

