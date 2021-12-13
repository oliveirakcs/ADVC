clear all; 
clc;

for loop = 1:50000
    
    tic
    
    %% VIBRAÇÃO LIVRE AMORTECIDA

    %Inputs - Solução Analítica

    t1 = 0:0.01:4;
    mat_aux = 0+4*rand(1,401);
    t2 = sort(mat_aux);
    x1 = (2.7182818284590452353602874.^(-8.305718555*0.02*t1)).*((0.05/8.304057245)*sin(8.305718555*t1));
    x2 = (2.7182818284590452353602874.^(-8.305718555*0.02*t2)).*((0.05/8.304057245)*sin(8.305718555*t2));

    %Plot - Solução Analítica

    %figure('Name','Vibração Livre Amortecida','NumberTitle','off');
    %subplot(1,2,1),plot(t1,x1,'r-',t2,x2,'g-.');
    %grid on;
    %title('Solução Analítica')
    %xlabel('Tempo (s)');
    %ylabel('Deslocamento (m)');
    %legend('Passo fixo', 'Passo aleatório');

    %Inputs - Solução Aproximada

    tspan1 = 0:0.01:4;
    mat_aux2 = 0+4*rand(1,401);
    tspan2 = sort(mat_aux2);
    y0 = [0;0.05];

    %Resolver as EDOs

    [t3,y3,s3] = ode45(@VL,tspan1,y0);
    [t4,y4,s4] = ode45(@VL,tspan2,y0);

    %Plot - Solução Aproximada

    %subplot(1,2,2),plot(t3,y3(:,1),'r-',t4,y4(:,1),'g-.');
    %grid on;
    %title('Solução Aproximada')
    %xlabel('Tempo (s)');
    %ylabel('Deslocamento (m)');
    %legend('Passo fixo', 'Passo aleatório');

    % Display ODE stats

    a = ode45(@VL,tspan1,y0);
    d = ode45(@VL,tspan2,y0);
    VLAPF = a.stats;
    VLAPA = d.stats;
    
    VLtime = toc;

    %% Excitação Harmônica

    tic
    
    %Inputs - Solução Analítica

    gama = 25000;
    l = 6;
    g = 9.8;
    e = 2.4e10;
    i = 7.466666667e-4;

    t5 = 0:0.01:4;
    mat_aux3 = 0+4*rand(1,401);
    t6 = sort(mat_aux3);
    x3 = (0.05/8.305718555)*sin(8.305718555*t5)+(1000/(((3*e*i)/(l^3))-(45^2)*33*gama*l/(140*g)))*(sin(45*t5)-(45/8.305718555)*sin(8.305718555*t5));
    x4 = (0.05/8.305718555)*sin(8.305718555*t6)+(1000/(((3*e*i)/(l^3))-(45^2)*33*gama*l/(140*g)))*(sin(45*t6)-(45/8.305718555)*sin(8.305718555*t6));

    %Plot - Solução Analítica

    %figure('Name','Vibração Harmonica','NumberTitle','off');
    %subplot(1,2,1),plot(t5,x3,'r-',t6,x4,'g-.');
    %grid on;

    %title('Solução Analítica')
    %xlabel('Tempo (s)');
    %ylabel('Deslocamento (m)');
    %legend('Passo fixo', 'Passo aleatório');

    %Inputs - Solução Aproximada

    tspan3 = 0:0.01:4;
    mat_aux4 = 0+4*rand(1,401);
    tspan4 = sort(mat_aux4);
    y1 = [0;0.05];

    %Resolver as EDOs

    [t7,y7,s7] = ode45(@H,tspan3,y1);
    [t8,y8,s8] = ode45(@H,tspan4,y1);

    %Plot - Solução Aproximada

    %subplot(1,2,2),plot(t7,y7(:,1),'r-',t8,y8(:,1),'g-.');
    %grid on;
    %title('Solução Aproximada')
    %xlabel('Tempo (s)');
    %ylabel('Deslocamento (m)');
    %legend('Passo fixo', 'Passo aleatório');

    % Display ODE stats

    b = ode45(@H,tspan3,y1);
    e = ode45(@H,tspan4,y1);

    EHPF = b.stats;
    EHPA = e.stats;
    
    EHtime = toc;

    MatrizVLAPF(loop,1)  = VLAPF.nsteps;
    MatrizVLAPF(loop,2)  = VLAPF.nfailed;
    MatrizVLAPF(loop,3)  = VLAPF.nfevals;
    MatrizVLAPF(loop,4)  = VLtime;

    MatrizVLAPA(loop,1)  = VLAPA.nsteps;
    MatrizVLAPA(loop,2)  = VLAPA.nfailed;
    MatrizVLAPA(loop,3)  = VLAPA.nfevals;
    MatrizVLAPA(loop,4)  = VLtime;

    MatrizEHPA(loop,1)  = EHPA.nsteps;
    MatrizEHPA(loop,2)  = EHPA.nfailed;
    MatrizEHPA(loop,3)  = EHPA.nfevals;
    MatrizEHPA(loop,4)  = EHtime;

    MatrizEHPF(loop,1)  = EHPF.nsteps;
    MatrizEHPF(loop,2)  = EHPF.nfailed;
    MatrizEHPF(loop,3)  = EHPF.nfevals;
    MatrizEHPF(loop,4)  = EHtime;

end

xlswrite('Resultados.xlsx',MatrizVLAPF,1);
xlswrite('Resultados.xlsx',MatrizVLAPA,2);
xlswrite('Resultados.xlsx',MatrizEHPA,3);
xlswrite('Resultados.xlsx',MatrizEHPF,4);

disp('FIM');