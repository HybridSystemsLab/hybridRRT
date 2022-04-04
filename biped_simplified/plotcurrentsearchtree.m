function plotcurrentsearchtree(T)
iterator = T.depthfirstiterator;
iterator = iterator(2:end);
for i = iterator
    cur = T.get(i);
    parent = T.get(T.getparent(i));
    plot3([cur(1), parent(1)], [cur(2), parent(2)], [cur(3), parent(3)], 'm*-');
end
end
