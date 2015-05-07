numIterations = 5000;
x = 0;
y = 0;
while(numIterations>0)
    randomDirection = randomInt(4);
%try: not to U-turn
    if(randomDirection == 0)
        line([x, x], [y+1, y]);
        y = y+1;
    end
    if(randomDirection == 1)
        line([x, x], [y-1, y]);
        y = y-1;
    end
    if(randomDirection == 2)
        line([x+1, x], [y, y]);
        x = x+1;
    end
     if(randomDirection == 3)
        line([x-1, x], [y, y]);
        x = x-1;
     end
    pause(0.001);
    numIterations = numIterations -1;
end
