numIterations = 10000;
x = [0]; % list of n-x starting coordinates
y = [0]; % list of n-y starting coordinates
color = []; % list of n-colour starting coordinates
            % use colorSpec to generate colors
figure
plot(x,y,'r--'); % put [r g b]

disp('Press ^C to stop animation');

while(numIterations>0)
    % update(x, y) function that includes random direction
    % and and updates the new direction 
    %colors 
    randomDirection = rand()*2*pi;
    x1 = 1*cos(randomDirection);
    y1 = 1*sin(randomDirection);
    line([x,x + x1], [y, y + y1]);
    pause(0.00001);
    x = x + x1;
    y = y + y1;
    numIterations = numIterations -1;
end
