%% Função que descreve uma vibração livre amortecida

function eq = ydot(t,y);
    gama = 25000;
    l = 6;
    g = 9.8;
    e = 2.4e10;
    i = 7.466666667e-4;
    c = 1198.638684;
    p = 0;
    eq = [y(2);(p-c*y(2)-y(1)*(3*e*i/(l^3)))*(140*g/(33*gama*l))];
end