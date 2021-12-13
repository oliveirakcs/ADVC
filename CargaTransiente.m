function CargaTransiente

    clear all
    clc

    %% Modelo Transiente 

    %Constr�i a viga e especifica as propriedades do seu materia.
    %Com o aux�lio da fun��o addVertex � selecionado a ponta onde a carga
    %ser� aplicada

    gm = multicuboid(6,0.14,0.40);
    E = 2.4e10; %M�dulo de Elasticidade (N/m�)
    nu = 0.2; %Coeficiente de Poisson
    rho = 2500; %Densidade do concreto em N/m�
    TipVertex  = gm.addVertex('Coordinates',[3,0,0.40]);
    firstNF = 2639;
    Tfundamental = 2*pi/firstNF;

    %Usa a fu��o createpde (Partial Differential Equation Toolbox) para
    %construir o modelo transiente e gerar a malha de elementos finitos
    %utilizando o comendao generateMesh

    transientModel = createpde('structural','transient-solid');
    transientModel.Geometry = gm;
    msh = generateMesh(transientModel);

    %Plot da malha de elementos finitos
    figure
    pdeplot3D(transientModel)
    view([-45 45])

    %Aplica as propriedades do material na viga criada (fun��o 
    %structuralProperties) e aplica as restri��es necess�rias, como apoios
    %(fun��o structuralBC)

    structuralProperties(transientModel,'YoungsModulus',E,'PoissonsRatio',nu,'MassDensity',rho);
    structuralBC(transientModel,'Face',5,'Constraint','fixed');

    %Plot para visualizar a geometria da viga

    figure
    pdegplot(transientModel,'FaceLabels','on','FaceAlpha',0.5);
    title('Modelo 3D da viga')

    %Seta as condi��es iniciais para utiliza��o no modelo da viga atrav�s da
    %fun��o structuralIC

    structuralIC(transientModel,'Velocity',[0;0;0]);

    figure
    hold on

    carregamentos = [50, 100, 175, 350]; %vetor de carregamentos (N)

    for i = 1:4

        %Aplica uma for�a na ponta da viga que equivale a 2% do periodo 
        %fundamental utlizando a fun��o structuralBoundaryLoad

        Te = 0.02*Tfundamental;
        structuralBoundaryLoad(transientModel,'Vertex',TipVertex,...
           'Force',[0;0;-carregamentos(i)],'EndTime',Te);

        %Computa a resposta ao impulso resolvendo o modelo transiente.

        ncycles = 200;
        tsim = linspace(0,ncycles*Tfundamental,30*ncycles);
        R1 = solve(transientModel,tsim);
        D = R1.Displacement.uz;

        %Plota o deslocamento calculado da ponta da viga em fun��o do tempo.

        plot(tsim,R1.Displacement.uz(TipVertex,:));

    end

    %Plota os graficos sobrepostos de deslocamento no tempo para os 4
    %carregamentos

    grid on;
    title('Deslocamento vertical da ponta da viga em carregamento transiente')
    legend('50N', '100N', '175N', '350N')
    xlabel('Tempo (s)')
    ylabel('Deslocamento (m)')

    %Plota o heatmap de deslocamentos da viga que sofre carregamento de 350N

    Te = 0.02*Tfundamental;
    structuralBoundaryLoad(transientModel,'Vertex',TipVertex,...
       'Force',[0;0;-350],'EndTime',Te);

    %Computa a resposta ao impulso resolvendo o modelo transiente.

    ncycles = 100;
    tsim = linspace(0,ncycles*Tfundamental,30*ncycles);
    R1 = solve(transientModel,tsim);
    D = R1.Displacement.uz;

    figure
    grid on;
    pdeplot3D(transientModel, 'ColorMapData', D(:,length(tsim)))
    view([-45 45]);
    title('Deslocamento para 350N de carga (m)')
    colormap('jet')
end
