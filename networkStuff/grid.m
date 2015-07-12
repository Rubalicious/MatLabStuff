function [ M ] = grid( rows, cols )

% def make_matrix(rows, cols):
%     n = rows*cols
%     M = matrix(n,n)
%     for r in xrange(rows):
%         for c in xrange(cols):
%             i = r*cols + c
%             # Two inner diagonals
%             if c > 0: M[i-1,i] = M[i,i-1] = 1
%             # Two outer diagonals
%             if r > 0: M[i-cols,i] = M[i,i-cols] = 1

%making an mxn matrix
n = rows*cols;
M = zeros(n,n);
for r = 1:rows
    for c = 1:cols
        i = r*cols+c;
        %making the inner diagonals
        if c > 0
            M(i-1, i) = 1;
            M(i, i-1) = 1;
        end
        %making the outer diagonals
        if r > 0
            M(i-cols, i) = 1;
            M(i, i-cols) = 1;
        end
    end
end

end

