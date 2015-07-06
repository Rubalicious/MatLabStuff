%% Each of the numbers 1 to 10^6 is repeatedly replaced by its digital sum
%until we reach 10^6 one-digit numbers. Will these have more 1's or 2's?

up = 10.^4;
digit_list = zeros(1,up);
for i = 1:up
    digit_list(1,i) = digitalSum(i);
%     if digit_list(1,i) == 5
%         disp(digit_list);
%     end
end

hist(digit_list)

%% Run simulation
%given number
x0 = 100;
y0 = randi(x0);
hold on
plot(x0,y0,'ob')
axis([0 x0+1 0 y0+1])
for i = 1:50
    [x1, y1] = nextIterationOf(x0,y0);
    plot(x1,y1,'ob');
    x0 = x1;
    y0 = y1;
end
hold off


