function escolha = Menu(options)

%Apresenta as opções do menu
for i = 1:length(options)
    fprintf('%d. %s\n', i, options{i});
end

%Busca uma resposta válida no menu
escolha = 0;
while ~any(escolha == 1:length(options))
    escolha = EntVal('Selecione um número do menu: ');
end