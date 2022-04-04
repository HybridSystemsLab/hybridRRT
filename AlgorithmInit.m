T = tree(x0);  % initialize a empty tree
N = size(x0); % state dimensions

edge_map = containers.Map('KeyType','double','ValueType','any');
reachedset = containers.Map('KeyType','double','ValueType','any');
reachedset = addstatetoreachedset(x0, reachedset, 1);
edge_map(1) = containers.Map('KeyType','double','ValueType','any');