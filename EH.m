%% Excitação Harmônica

function EH

    %Inputs - Solução Analítica

    gama = 25000;
    l = 6;
    g = 9.8;
    e = 2.4e10;
    i = 7.466666667e-4;
    a = ((33*gama*l)/(140*g));
    b = ((3*e*i)/(l^3));
    omega_n = sqrt(b/a);
    omega_d = omega_n*sqrt(1-0.02^2);
    t1 = 0:0.01:4;
    mat_aux = 0+4*rand(1,401);
    t2 = sort(mat_aux);
    
    x1 = (0.05/omega_n)*sin(omega_n*t1)+(1000/(b-a*45^2)*((sin(45*t1)-(45/omega_n)*sin(omega_n*t1))));
    x2 = (0.05/omega_n)*sin(omega_n*t2)+(1000/(b-a*45^2)*((sin(45*t2)-(45/omega_n)*sin(omega_n*t2))));

    %Inputs - Solução Aproximada

    tspan1 = 0:0.01:4;
    mat_aux2 = 0+4*rand(1,401);
    tspan2 = sort(mat_aux2);
    y0 = [0;0.05];

    %Resolver as EDOs

    [t3,y3,s3] = ode45(@EH_Fun,tspan1,y0);
    [t4,y4,s4] = ode45(@EH_Fun,tspan2,y0);

    %Plot
    
    figure('Name','Excitação Harmonica','NumberTitle','off');
    plot(t1,x1,'k--',t3,y3(:,1),'r-',t4,y4(:,1),'g-.');
    grid on;
    xlabel('Tempo (s)', 'FontSize', 11);
    ylabel('Deslocamento (m)', 'FontSize', 11);
    legend('Solução Analítica','Solução Aproximada - Passo Fixo', 'Solução Aproximada - Passo Aleatório','FontSize', 11);

end