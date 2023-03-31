# APP E-Commerce Teste Devnology


## App que funciona como uma loja virtual, com funções de loja na qual o usuário pode se cadastrar e colocar no carrinho de compras e compra-lo. São algumas telas para o app:
 - Tela de Login e Cadastro
 - Tela Principal
 - Tela de Detalhe do Produto
 - Tela de Carrinho de Compras
 - Tela de Busca do Produto

 API de Produtos: http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider

## Este app foi construido com uma base frontend chamado "flutter_ecommerce_app", que é open source. 

E-Commerce app is a design implementaion of [E-commerce App](https://dribbble.com/shots/10446127-E-commerce-App-Exploration/attachments/2283107?mode=media) designed by [Imran](https://dribbble.com/Saif_Uddin_Imran)



## Tecnologias

- Flutter
- Node.js
- Xampp Apache / MySQL


## Screenshots

  Cadastro                 |   Detalhes Produto        |  Carrinho                | 
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/NSuzano/teste_devnology/blob/main/assets/screenshots/principal.png)|![](https://github.com/NSuzano/teste_devnology/blob/main/assets/screenshots/detalhesproduto.png)|![](https://github.com/NSuzano/teste_devnology/blob/main/assets/screenshots/carrinho.png)


  Login                    |      Cadastro             |  Procura
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/NSuzano/teste_devnology/blob/main/assets/screenshots/login.png)|![](https://github.com/NSuzano/teste_devnology/blob/main/assets/screenshots/cadastro.png)|![](https://github.com/NSuzano/teste_devnology/blob/main/assets/screenshots/procura.png)


## Passo a passo para instalar o App


- Faça download do app para poder instalar no celular.  <a href="https://github.com/NSuzano/teste_devnology/releases/download/flutter/teste.apk"><img src="https://playerzon.com/asset/download.png" width="200"></img></a>

- Faça download e instale o <a href="https://nodejs.org/en/download"> Node JS</a> 
- Faça download e instale o <a href="https://www.apachefriends.org/pt_br/download.html"> XAMPP</a>
- Após instalar e iniciar o xamp, iniciar o Servidor Apache e o MySQL clicando em Start

<img src="https://github.com/NSuzano/teste_devnology/blob/main/assets/screenshots/xampp.PNG" width="500"/>


- Clique em Admin do MySQL para ir para a o Banco de Dados e adicionar. Na barra em cima clique em "SQL" e cole este código e em baixo clique em "Continuar"

<img src="https://github.com/NSuzano/teste_devnology/blob/main/assets/screenshots/database.PNG" width="900"/>


``` 
drop database if exists teste_devnology;

create database teste_devnology;

use teste_devnology;

create table clients(
    id_clients int not null AUTO_INCREMENT,
    nome_clients varchar(15),
    email_clients varchar(20),
    senha_clients varchar(12),
    PRIMARY KEY(id_clients)
    
);


create table supplier_br(
    id_supplier_br int not null AUTO_INCREMENT,
    nome_supplier_br varchar(15) not null,
    descricao_supplier_br varchar(100),
    categoria_supplier_br varchar(15),
    imagem_supplier_br varchar(30), 
    preco_supplier_br double,
    material_supplier_br varchar(15),
    departamento_supplier_br varchar(15), 
    PRIMARY KEY(id_supplier_br)
);

create table supplier_eu(
    id_supplier_eu int not null AUTO_INCREMENT,
    name_supplier_eu varchar(15) not null,
    description_supplier_eu varchar(100),
    details_supplier_eu varchar(100),
    discontvalue_supplier_eu double,
    has_discount_supplier_eu varchar(10),
    price_supplier_eu double not null,
    PRIMARY KEY(id_supplier_eu)
);


CREATE TABLE order_details(
    id_order_details int AUTO_INCREMENT PRIMARY KEY,
    total_order_details double,
    quant_order_details int,	
    id_clients int not null,
    id_supplier_br int,
    id_supplier_eu int
);

ALTER TABLE order_details ADD CONSTRAINT fk_client FOREIGN KEY(id_clients) REFERENCES clients (id_clients);

ALTER TABLE order_details ADD CONSTRAINT fk_supplier_br FOREIGN KEY(id_supplier_br) REFERENCES supplier_br(id_supplier_br);

ALTER TABLE order_details ADD CONSTRAINT fk_supplier_eu FOREIGN KEY(id_supplier_eu) REFERENCES supplier_eu(id_supplier_eu );
```


- Digite o comando no terminal do seu editor de código "git clone https://github.com/NSuzano/teste_devnology.git" para clonar os arquivos.

- No terminal viajar para a pasta "teste_devnology/server/src".

- Digitar o comando "node index.js", para iniciar o servidor.

- No celular, faça com que esteja na mesma rede WIFI do PC.

- No celular, mude o seu ip em Configurações, em WIFI mude de DHCP para Estático e digite o IP "192.168.1.50".

- Instale o APK no celular.




# Observações Adicionais

- Eu tentei adicionar mais funções mas não consegui pelo tempo, queria adicionar tela de favoritos para que o usuário pudesse favoritar os produtos, botão de categoria onde mostrasse os produtos específicos, por isso o botão do lado da barra de pesquisa no meio não funciona 

- No menu principal existe dois locais de pesquisa, no meio e na barra em baixo, não consegui fazer com que o de baixo funcionasse, então só está funcionando o do meio. Tentei tirar o botão já que não funciona, mas ao fazer isso deu erro de Widget, então para não perder tempo deixei e depois adiciono.

- Eu tentei adicionar também os produtos do fornecedor europeu mas não consegui fazer com que no banco de dados funcionasse, criei os modelos, mas não estão sendo consumidos.




## Flutter Dependências
Dependências        |     
:-------------------------|
|[Http](https://github.com/dart-lang/http/tree/master/pkgs/http)
|[Provider](https://github.com/rrousselGit/provider)
|[Get](https://github.com/jonataslaw/getx)


