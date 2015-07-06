function [ domain ] = fire( domain )
%Chipfire model timestep
%This fire model is as if sand is being poured onto a table
%the sink is the edge of the table

% if a node has more chips than neighbors, it fires
for i = 1:length(domain)
    for j = 1:length(domain)
        if domain(i,j) >= 4
            if i-1<1
            else
                domain(i-1,j) = domain(i-1,j)+1;
            end
            
            if j-1<1
            else
                domain(i,j-1) = domain(i,j-1)+1;            
            end
            
            if i+1>length(domain)
            else
                domain(i+1,j) = domain(i+1,j)+1;
            end
            
            if j+1>length(domain)
            else
                domain(i,j+1) = domain(i,j+1)+1;
            end
            
            domain(i,j) = domain(i,j)-4;
        end
    end
end

end

