# Plano de teste:

### Lista de itens a serem testados e objetivos dos testes

Os testes desenvolvidos focam no teste dos modelos e controladores e tem como objetivo
identificar possíveis problemas no software e evitar o retrabalho de testar manualmente
todas esses artefatos quando alguma mudança é feita no sistema.

### Escopo, estratégia, abordagem e procedimentos de teste

A realização dos testes seguiu uma abordagem bottom-up, ou seja, começaram a ser
desenvolvidos a partir das classes que representavam os modelos e conforme os
testes de modelo funcionavam eram implementados testes de controladores.

### Descrição do ambiente para realizar os testes

A realização dos testes foi feita com a ferramenta Rspec em um ambiente local, ou seja,
na máquina do desenvolvedor que "roda" aqueles testes.

### Critérios para a conclusão dos testes e para aprovação nos testes

Os testes foram finalizados quando implementamos pelo menos um teste para cada um dos
métodos de cada modelo e controlador do sistema.

### Documentos que serão criados como parte do processo de teste

Ao final do processo de teste o analisador simplecov gera uma pasta com os resultados das
análises de cobertura. Além destes, são geradas saídas do rubocop no terminal informando
possíveis problemas detectados pela análise estática do código e é informada (pelo Rspec)
a quantidade de testes que passou e a quantidade de testes que falhou.
