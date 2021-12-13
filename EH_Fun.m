%% Função que descreve o carregamento harmonico

function eq = ydot(t,y);
    
    gama = 25000;
    l = 6;
    g = 9.8;
    e = 2.4e10;
    i = 7.466666667e-4;
    p = 1000*cos(45*t);
    eq = [y(2);(p-y(1)*(3*e*i/(l^3)))*(140*g/(33*gama*l))];
end