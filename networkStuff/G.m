function [ adj ] = G( n,p )
%Making an Erdos-Renyi random graph algorithm

%A node has an index and a list of neighbours
%n will be the number of vertices in the graph
adj = zeros(n);
for nodeA = 1:n
    for nodeB = nodeA+1:n
        u = rand(1);
        if u<p
            adj(nodeA, nodeB) = 1;
            adj(nodeB, nodeA) = 1;
        end
    end
end

end

