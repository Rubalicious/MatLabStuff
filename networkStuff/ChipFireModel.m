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

%% Generating a random network: Making the ADJ matrix
n = 80; %size of network
p = 0.1; %probability
%made my own Erdos-Renyi network
adj = G(n,p);

%% Creating the graph Laplacian: Making the DEG matrix
%extrapolate a degree matrix
deg = zeros(n);
for row = 1:n
    deg(row, row) = sum(adj(row,:));
end
% ============= create the GRAPH LAPLACIAN ================
L = deg-adj;

%% Start with a random initial condition

C_0 = randi(8, n, 1);

e = fireVector(C_0, L);
% C_1 = C_0-L'*e
counter = 1;
while counter < 500
    C_0(1) = 0; %making the first node's chips count 0
    C_1 = C_0-L'*e;
    disp(['fire vector: ' num2str(counter)])
    e = fireVector(C_0, L);
    if C_1 == C_0
        break
    end
    C_0 = C_1;
    counter = counter+1;
end
%need to make one node a sink
%this means that the chip count at this node
%always remains 0

%% Info about the network
complexity = det(L(2:length(L),2:length(L)));
disp(['Number of spanning trees is ' num2str(complexity)])

%% Creating a grid network

%created my own grid network
grid_plane = grid(100);
L = graph_Laplacian(grid_plane);

%% Initializing the grid

% C_0 = randi(8,length(grid_plane),1);
% e = fireVector(C_0, L);

%% Making a proper initial condition: Distribution of chips on the grid
% distribute number of chips like a pile of sand
% 3D normal distribution?
n = length(grid_plane);
C_0 = round(10*randn(n,1)+n/2);
%% Run simulation
n = length(grid_plane);
e = fireVector(C_0, L);
colors = colorNodes(e);

h = figure;
g = graph(grid_plane);
p = plot(g,'NodeColor',colors);

hold on
% updateGrid(h,e);
counter = 1;
p.LineStyle = ':';
while counter < 101
    colors = colorNodes(C_0);
    p.NodeColor = colors;
    p.EdgeColor = [0 1 0];
    
    %making the first node's chips number 0
    C_0(1) = 0; %the sink
    
    C_1 = C_0-L'*e;
    e = fireVector(C_0, L);
    if C_1 == C_0
        break
    end
    C_0 = C_1;
    disp(counter);
    counter = counter+1;
    pause(0.2)
end

hold off