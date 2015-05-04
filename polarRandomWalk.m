numIterations = 10000;
x = 0;
y = 0;
figure
plot(x,y);

disp('Press ^C to stop animation');

while(numIterations>0)
    randomDirection = rand()*2*pi;
    x1 = 1*cos(randomDirection);
    y1 = 1*sin(randomDirection);
    line([x,x + x1], [y, y + y1]);
    pause(0.00001);
    x = x + x1;
    y = y + y1;
    numIterations = numIterations -1;
end
