function [ L ] = graph_Laplacian(adj)
%Creating the Graph Laplacian from an arbitrary adjacency matrix
n = length(adj);
%extrapolate a degree matrix
deg = zeros(n);
for row = 1:n
    deg(row, row) = sum(adj(row,:));
end
%create the graph laplacian
L = deg-adj;
end

