# README

Esse arquivo tem como objetivo explicar como o trabalho foi estruturado e quais passos devem ser executados para conseguir configurar o projeto na sua máquina. Caso não consiga configurar o sistema na sua máquina você ainda pode visualiá-lo pelo link https://git.heroku.com/trab-qualidade-software.git.

### Executando o sistema

Para executar o sistema é preciso configurar o framework rails assim como o interpretador ruby na sua máquina. Para isso, basta seguir o tutorial de instalação que pode ser encontrado no seguinte link http://installrails.com/steps/choose_os. O próximo passo é configurar o banco de dados que será utilizado. No caso deste projeto utilizamos o banco postgres. O download desse sgbd pode ser feito no link https://www.postgresql.org/download/. Após o download é necessário que você crie o banco de dados com o nome qualidade_software_db na sua máquina. Caso não queira utilizar esse nome modifique o nome no arquivo de configuração config/database.yml. Agora você deve baixar algumas dependências que foram adicionadas no arquivo Gemfile. Você pode fazer isso executando o comando 'bundle install' no terminal na mesma pasta do projeto. Caso ainda não possua o bundler configurado na sua máquina você pode baixá-lo executando 'gem install bundler'. Nesse momento, você já possui o banco no sistema e precisa criá-lo e populá-lo com o rails. Para isso, execute os comandos 'rails db:create', 'rails db:migrate', 'rails db:seed' no terminal. Por fim, deve ser executado o comando 'rails s' para subir o sevidor da aplicação. Caso todos os passos acima tenham sido executados com sucesso então você conseguirá acessar o sistema pela ulr https://localhost:3000.

### Estrutura do projeto

Esse projeto é um projeto rails e por isso seguiu a estrutura padrão de pastas geradas pelo framework. A listagem abaixo indica onde encontrar os arquivos mais relevantes referentes a cada parte do projeto.

* app/models - Modelos utilizados no projeto (usuário, livro, resenha, estante)
* app/controllers - Controladores relativos a cada modelo e relativos ao conjunto de views que modificam aquele modelo
* app/views - Arquivos html.erb responsáveis por exibir o conteúdo recuperado pelos controladores
* app/assets/javascripts - Arquivos responsáveis pela inicialização dos componentes javascript e css do framework Materialize
* app/assets/stylesheets - Arquivos responsáveis pela estilização das views do sistema
* db/schema - Contém a estrutura da tabelas e relcionamentos no banco de dados
* db/seeds - Popula banco de dados quando executado o comando 'rails db:seed' no terminal
* config/database.yml - Configurações de conexão do banco (nome do banco, usuário, senha)
* config/routes - Mapeia as urls do sistemas às chamadas dos métodos nos controladores
* doc - Agrupa arquivos de documentação gerados pelo Rdoc no formato html
* processes - Arquivos .md dos planos e processos de desenvolvimento e teste
* Gemfile - Dependências do projeto (para baixá-las é necessário executar o comando 'bundle install' no terminal)

### Como executar os testes ?

* Rspec - $ rspec
* Rubocop - $ rubocop
* Simplecov - gerado na pasta /coverage depois de rodar o teste, ou seja, $ rspec
