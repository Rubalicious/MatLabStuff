function [ M ] = grid( rows, cols )

%making an mxn matrix
n = rows*cols;
M = zeros(n);
for r = 1:n
    for c = r:n
        %making the inner diagonals
        if r + 1 == c
            M(r, c) = 1;
            M(c, r) = 1;
        end
        %remove 1's along diagonal
        if mod(c,cols) == 0
            M(r,c) = 0;
            M(c,r) = 0;
        end
        %making the outer diagonals
        if c-r == cols
            M(r,c) = 1;
            M(c,r) = 1;
        end
        
        %removing and reattaching the last node
        if c == n
            %remove the last node
            M(c,:) = zeros(1,n);
            M(:,c) = zeros(n,1);
            %attaching the last node in the correct spot
            M(c,1) = 1;
            M(1,c) = 1;
            M(c, cols) = 1;
            M(cols, c) = 1;
        end
        
        %in the case of having a row vector
        if rows == 1 && M(cols,cols) == 1
            M(cols,cols) = 0;
        end
    end
end

end

