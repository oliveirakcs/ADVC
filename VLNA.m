%% VIBRAÇÃO LIVRE NÃO AMORTECIDA

function VLNA
    %Inputs - Solução Analítica

    gama = 25000;
    l = 6;
    g = 9.8;
    e = 2.4e10;
    i = 7.466666667e-4;
    a = ((33*gama*l)/(140*g));
    b = ((3*e*i)/(l^3));
    omega_n = sqrt(b/a);
    t1 = 0:0.01:4;
    mat_aux = 0+4*rand(1,401);
    t2 = sort(mat_aux);
    
    %Resolução das Equações
    
    x1 = (0.05/omega_n)*sin(omega_n*t1);
    x2 = (0.05/omega_n)*sin(omega_n*t2);

    %Inputs - Solução Aproximada

    tspan1 = 0:0.01:4;
    mat_aux2 = 0+4*rand(1,401);
    tspan2 = sort(mat_aux2);
    y0 = [0;0.05];

    %Resolução das EDOs

    [t3,y3,s3] = ode45(@VLNA_Fun,tspan1,y0);
    [t4,y4,s4] = ode45(@VLNA_Fun,tspan2,y0);

    %Plot

    figure('Name','Vibração Livre Não Amortecida','NumberTitle','off');
    plot(t1,x1,'k--', t3 ,y3(:,1) ,'r-.' ,t4 ,y4(:,1) ,'g-.');
    grid on;
    xlabel('Tempo (s)');
    ylabel('Deslocamento (m)');
    legend('Solução Analítica','Solução Aproximada - Passo Fixo', 'Solução Aproximada - Passo Aleatório','FontSize', 11);
    
end