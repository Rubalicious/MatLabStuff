function [ x1,y1 ] = nextIterationOf( x,y )
%This supplies the next iteration of the function
    x1 = (x+y)/2;
    y1 = (x+y).^0.5;
end

