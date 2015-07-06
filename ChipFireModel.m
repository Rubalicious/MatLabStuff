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


