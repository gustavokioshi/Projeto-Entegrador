-- CREATE DATABASE IF NOT EXISTS Cinema;

USE Cinema;
INSERT INTO login (nome, usuario, senha, adm)
VALUES ("João", "admin", "admin", true),
		("Juquinha", "juca", "asd123", false);




DROP TABLE IF EXISTS Ingresso;
DROP TABLE IF EXISTS Sessoes;
DROP TABLE IF EXISTS Lugares;
DROP TABLE IF EXISTS Filmes;
DROP TABLE IF EXISTS Compras;
DROP TABLE IF EXISTS Login;


CREATE TABLE IF NOT EXISTS Login(
id int auto_increment NOT NULL,
nome varchar(80),
usuario varchar(80),
senha varchar(80),
adm bool,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Compras(
id int auto_increment NOT NULL,
id_vendedor int,
cliente varchar (80),
cfp varchar(80),
valor int,
PRIMARY KEY(id),
CONSTRAINT id_vendedor FOREIGN KEY (id_vendedor) REFERENCES login(id)
);

CREATE TABLE IF NOT EXISTS Filmes(
id int auto_increment NOT NULL,
nome varchar(80),
duracao varchar(80),
genero varchar(80),
classificacaoIndicativa char,
sinopse varchar(256),
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Sessoes(
id int auto_increment NOT NULL,
id_filme int,
horario time,
data date,
3d bool,
idioma varchar(32),
sala varchar(16),
qtd_lugares int,
id_sessaoLugar int,
PRIMARY KEY(id),
CONSTRAINT id_filme FOREIGN KEY (id_filme) REFERENCES Filmes(id)
);

CREATE TABLE IF NOT EXISTS Lugares(
cod char PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Ingresso(
    id int auto_increment NOT NULL,
    id_sessao int,
    id_lugar varchar(8),
    id_compra int,
    PRIMARY KEY (id),
    CONSTRAINT id_sessao FOREIGN KEY (id_sessao) REFERENCES Sessoes(id),
    CONSTRAINT id_lugar FOREIGN KEY (id_lugar) REFERENCES Lugares(cod),
	CONSTRAINT id_compra FOREIGN KEY (id_compra) REFERENCES Compras(id)
);