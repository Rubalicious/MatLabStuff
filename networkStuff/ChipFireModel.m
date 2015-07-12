%% Chip Fire Model
%This is generating a board
domain = zeros(10);

initConfig = randi(20, 1, length(domain).^2);

%% Configurating the board
disp('The board')
count = 1;
for i = 1:length(domain)
    for j = 1:length(domain)
        domain(i,j) = initConfig(1,count);
        count = count+1;
    end
end
disp(domain)
%% Trying different number of iterations
disp('new iteration')

steps = 100;
disp(domain)
for step = 1:steps
    disp(step)
    domain = fire(domain);
    disp(domain)
    if domain == fire(domain)
        break
    end
end

%% Generating a random network and Creating the graph Laplacian
n = 10; %size of network
p = 0.3; %probability
%should generate an Erdos-Renyi random graph
% found a function
%generate a watts and strogatz model
%make an adjacency matrix
adj = makenetwork(n,p); 
adj = adj-eye(length(adj));
%extrapolate a degree matrix
deg = zeros(n);
for row = 1:n
    deg(row, row) = sum(adj(row,:));
end
%create the graph laplacian
L = deg-adj;

%% Start with a random initial condition

C_0 = randi(8, n, 1);

e = fireVector(C_0, L);
% C_1 = C_0-L'*e
counter = 1;
while counter < 500
    C_0(1) = 0; %making the first node's chips number 0
    C_1 = C_0-L'*e;
    e = fireVector(C_0, L);
    if C_1 == C_0
        break
    end
    C_0 = C_1;
    counter = counter+1
end
%need to make one node a sink
%this means that the chip count at this node
%always remains 0

%% Info about the network
complexity = det(L(2:length(L),2:length(L)));
disp(['Number of spanning trees is ' num2str(complexity)])

%% Creating a grid network

%To create a grid network
%plotsom(gridtop(n,m)), where nxm are dimensions of the grip
