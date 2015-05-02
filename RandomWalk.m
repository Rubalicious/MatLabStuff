% theta = 360*rand(1);
% radius = 3*rand(1);
x = 0;
y = 0;
xframe = -10:10;
yframe = -10:10;
count = 1000;
%figure
while(count>0)
    if(randDirFunction == 1)
        line([x+1,x], [y,y])
        x = x+1;
    end
    if(randDirFunction == 2)
        line([x,x], [y+1,y])
        y = y+1;
    end
    if(randDirFunction == 3)
        line([x-1,x], [y,y])
        x = x-1;
    end
    if(randDirFunction == 4)
        line([x,x], [y-1,y])
        y=y-1;
    end
    count = count-1;
end