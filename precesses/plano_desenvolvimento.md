# Plano de desenvolvimento:

### Cronogramas e Recursos humanos estimados

A duração prevista para realização do sistema foi de aproximadamente três semanas
com dois desenvolvedores trabalhando juntos no desenvolvimento do código e separadamente
no desenvolvimento dos arquivos de documentação.

### Recursos de hardware estimados

Durante a realização do projeto foi estimado que precisaríamos de apenas dois notebooks
(um para que cada desenvolvedor) para implementar as funcionalidades previstas. Além
disso estimamos que seria necessário um servidor que possibilitasse a disponibilização
do sistema desenvolvimento na rede. Para tal fim, utilizamos a plataforma Heroku.
A escolha dessa plataforma em detrimento de outras foi devido a fácil conectividade
de sistemas ruby on rails com essa plataforma e aos ótimo plano free que a plataforma
oferece.

### Metodologia de desenvolvimento

O desenvolvimento do software seguiu princípios vistos em disciplinas de engenharia de software
como, por exemplo, TDD (Test Driven Development) e Pair Programming. Durante a elaboração do
projeto utilizamos o VCS (Versioning Control System) GitHub. Antes de começar a programar
criamos histórias de usuário para nossa organização. Mantivemos o status (Todo / Doing / Done)
de cada uma dessas história durante a realização projeto.

### Ferramentas de desenvolvimento

O produto foi desenvolvido utilizando o framework ruby on rails (framework para desenvolvimento
web com a linguagem ruby). Para a parte relacionada à interface utilizamos o framework
Materialize juntamente com arquivos sass e javascript. A implementação dos testes foi
feita utilizando o framework Rspec e os documentos gerados a respeito dos resultados obtidos
com os testes foram criados pela ferramenta Simplecov. Além de tudo isso, utilizamos o
analisador de código estático Rubocop para apontar possíveis problemas e code smells no
nosso código.
