numIterations = 1000;
x = 1;
y = 1;
figure;
while(numIterations>0)
    randomDirection = rand()*2*pi;
    randomLength = randomInt(2);
    x1 = randomLength*cos(randomDirection);
    y1 = randomLength*sin(randomDirection);
    %r = sqrt(x1*x1 +y1*y1);
    line([x, x1], [y, y1]);
    x = x1;
    y = y1;
    numIterations = numIterations -1;
end
