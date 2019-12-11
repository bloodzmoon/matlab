
function [ r ] = addMatrix( x, y, size )
r = zeros(size);
    for i = 1:size
        for j = 1:size
            r(i,j) = x(i,j) + y(i,j);
        end
    end
end