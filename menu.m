function escolha = Menu(options)

%Apresenta as op��es do menu
for i = 1:length(options)
    fprintf('%d. %s\n', i, options{i});
end

%Busca uma resposta v�lida no menu
escolha = 0;
while ~any(escolha == 1:length(options))
    escolha = EntVal('Selecione um n�mero do menu: ');
end