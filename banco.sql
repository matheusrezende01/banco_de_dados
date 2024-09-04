create database redes_sociais;

use redes_sociais;

create table usuarios (
id int not null auto_increment primary key,
nome varchar(45) not null,
email varchar(255) not null,
criacao_conta date not null
);

create table postagens (
id int not null auto_increment primary key,
texto varchar(255) not null,
data_postagem date not null,
usuarios_id int not null,
foreign key (usuarios_id) references usuarios (id)
);

create table comentarios ( 
id int not null auto_increment primary key,
texto varchar(255),
data_criacao date not null,
usuario_id int not null primary key,
foreign key (usuarios_id) references usuarios (id),
foreign key (postagens_id) references postagens (id)
);

create table curtidas (
postagens_id int not null primary key,
usuarios_id int not null primary key,
foreign key (postagens_id) references postagens (id),
foreign key (usuarios_id) references usuarios (id)
);


