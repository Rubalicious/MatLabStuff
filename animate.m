function animate(numIterations)
%A random walk simulation with the parameter of number of Iterations
%This random walk uses polar coordinates

x = 0;
y = 0;
figure
axis([0 100 0 100]);

disp('Press ^C to stop animation');

plot(x,y);
%whitebg('white');
%set(gcf, 'Color', [1, 0.7, 1]);
h = animatedline(x,y);
color('cyan');
    while(numIterations>0)
        
        addpoints(h, x, y);
        
        rL = rand()*2;
        randomDirection = rand()*2*pi;
        x1 = rL*cos(randomDirection);
        y1 = rL*sin(randomDirection);
        
        %line([x,x + x1], [y, y + y1]);
        pause(0.01);
        x = x + x1;
        y = y + y1;
        
        numIterations = numIterations -1;
    end

end

