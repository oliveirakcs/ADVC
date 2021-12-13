%Define os itens do menu:
clear all
clc

menuItems = {'Vibração Livre Amortecida', 'Vibração Livre Não Amortecida', 'Excitação Harmonica', 'Excitação Qualquer', 'Carga Transiente', 'Sair'};

%Define um nome

while true
    
    %mostra o menu
    escolha = menu(menuItems);
    
    if escolha == 1
        clc
        VLA;
    elseif escolha == 2
        clc
        VLNA;
    elseif escolha == 3
        clc
        EH
    elseif escolha == 4
        clc
        EQ
    elseif escolha == 5
        clc
        CargaTransiente
    elseif escolha == 6
        break
    end
end
