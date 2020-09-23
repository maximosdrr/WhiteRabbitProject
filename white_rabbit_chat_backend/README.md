Esse é um projeto se trata de um chat em tempo real feito com nestjs, aqui temos a parte do servidor que faz uso do socket.io para enviar respostas em tempo real para as aplicações que consomem essa api

Faça:
  - Crie uma pasta chamada env e dentro dela coloque um arquivo .env chamado 'api.secret.env'
  - Dentro do arquivo api.secret.env crie duas variaveis, uma chamada "SECRET=" e atribua a ela o codigo secreto que vai ser usado para encriptar o seu codigo jwt, na sequencia crie uma outra variavel chamada "JWT_EXPIRATION_TIME=" atribua a ela a quantidade de dias que você quer que o token dure, por exemplo "JWT_EXPIRATION_TIME=10d"

  - Agora na raiz do projeto crie um outro arquivo .env com o nome de "ormConfig.env" onde vão ser carregadas as informações do banco de dados, o arquivo deve conter as seguintes variaveis, atente-se que a variavel TYPEORM_ENTITIES deve estar no exato formato que está descrito abaixo.

  TYPEORM_CONNECTION = mysql
  TYPEORM_HOST = localhost
  TYPEORM_USERNAME = root
  TYPEORM_PASSWORD = 
  TYPEORM_DATABASE = white_rabbit
  TYPEORM_PORT = 3306
  TYPEORM_SYNCHRONIZE = true
  TYPEORM_ENTITIES = dist/**/*.entity.js
