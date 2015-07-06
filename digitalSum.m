function [ answer ] = digitalSum( number )
% Find the sum of the digits of a number

if number < 10
    answer = sum(dec2base(number, 10)-'0');
else
    answer = sum(dec2base(number, 10)-'0');
    answer = digitalSum(answer);

end

