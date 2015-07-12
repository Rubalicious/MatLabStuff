function [ e ] = fireVector( C_0, L )
%outputs a column vector of 1's and 0's to show which chips will fire

%some vector that will fire
e = zeros(length(L),1);
for v = 1:length(L)
    if C_0(v) > L(v, v) %if number of chips is greater than the degree
        e(v) = 1;
    end
end

end

