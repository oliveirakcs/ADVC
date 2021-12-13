%%EXCITAÇÃO QUALQUER

function EQ

%Inputs - Solução Analítica

    gama = 25000;
    l = 6;
    g = 9.8;
    e = 2.4e10;
    i = 7.466666667e-4;
    a = ((33*gama*l)/(140*g));
    b = ((3*e*i)/(l^3));
    t1 = 0:0.01:4;
    
    %Resolução da Equação Analítica

    x1 = (-(1000*cos((sqrt(b/a))*t1))/(a+b)) + ...
        ((((sqrt(a))*(sin((sqrt(b/a))*t1)))*(0.05+(1000/(a+b))))/(sqrt(b))) +...
        (1000*(exp(-t1))/(a+b));
    

    %Inputs - Solução Aproximada

    tspan1 = 0:0.01:4;
    mat_aux2 = 0+4*rand(1,401);
    tspan2 = sort(mat_aux2);
    y0 = [0;0.05];

    %Resolução das EDOs

    [t3,y3,s3] = ode45(@EQ_Fun,tspan1,y0);
    [t4,y4,s4] = ode45(@EQ_Fun,tspan2,y0);

    %Plot - Solução Aproximada

figure('Name','Excitação Qualquer','NumberTitle','off');
    plot(t1,x1,'k--', t3 ,y3(:,1) ,'r-.' ,t4 ,y4(:,1) ,'g-.');
    grid on;
    xlabel('Tempo (s)');
    ylabel('Deslocamento (m)');
    legend('Solução Analítica','Solução Aproximada - Passo Fixo', 'Solução Aproximada - Passo Aleatório','FontSize', 11);

end
