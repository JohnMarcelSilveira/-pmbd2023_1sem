/* \i caminho/arquivo.sql */

DROP DATABASE IF exists noveleiros;

CREATE DATABASE noveleiros;

\c noveleiros;

CREATE TABLE novelas(
    codigo serial primary key,
    nome char varying(100),
    data_primeiro_capitulo date,
    data_ultimo_capitulo date,
    horario_exibicao time
);

CREATE TABLE atores(
    codigo serial primary key,
    nome char varying(100),
    data_nascimento date,
    cidade char varying(100),
    sexo char(1)
);

CREATE TABLE personagens(
    codigo serial primary key,
    nome char varying(100),
    data_nascimento date,
    situacao_financeira char varying(40),
    cod_ator integer references atores(codigo)
);

CREATE TABLE novelas_personagens(
    cod_novela integer references novelas(codigo),
    cod_personagem integer references personagens(codigo),
    primary key(cod_novela,cod_personagem)
);

CREATE TABLE capitulos(
    codigo serial primary key,
    nome char varying(100),
    data_exibicao date,
    cod_novela integer references novelas(codigo)  
);


/* inserts */

/*tabela novelas*/

INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('O Clone', '2001-10-01', '2002-06-14', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Avenida Brasil', '2012-03-26', '2012-10-19', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Cobras & Lagartos', '2006-04-24', '2006-11-18', '19:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Cheias de Charme', '2012-04-16', '2012-09-28', '19:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Senhora do Destino', '2004-06-28', '2005-03-12', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('A Favorita', '2008-06-02', '2009-01-16', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Belíssima', '2005-11-07', '2006-07-08', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Laços de Família', '2000-06-05', '2001-02-02', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('A Força do Querer', '2017-04-03', '2017-10-20', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Pantanal', '1990-03-27', '1990-12-10', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Mulheres Apaixonadas', '2003-02-17', '2003-09-19', '21:00:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Roque Santeiro', '1985-06-24', '1986-02-01', '20:30:00');
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao)
VALUES ('Mistérios de uma Vida', '2021-06-05','2022-12-10','20:30:00');

/* tabela atores */


INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Fernanda Montenegro', '1929-10-16', 'Rio de Janeiro', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Wagner Moura', '1976-06-27', 'Salvador', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Lázaro Ramos', '1978-11-01', 'Salvador', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Taís Araújo', '1978-11-25', 'Rio de Janeiro', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Selton Mello', '1972-12-30', 'Passos', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Deborah Secco', '1979-11-26', 'Rio de Janeiro', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Wagner Moura', '1976-06-27', 'Salvador', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Camila Pitanga', '1977-06-14', 'Rio de Janeiro', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Tony Ramos', '1948-08-25', 'Araras', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Fernanda Torres', '1965-09-15', 'Rio de Janeiro', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Mateus Solano', '1981-03-20', 'Brasília', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Gloria Pires', '1963-08-23', 'Rio de Janeiro', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Murilo Benício', '1971-07-13', 'Niterói', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Juliana Paes', '1979-03-26', 'Rio Bonito', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Rodrigo Lombardi', '1976-10-15', 'São Paulo', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Marina Ruy Barbosa', '1995-06-30', 'Rio de Janeiro', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Marcos Palmeira', '1963-08-19', 'São Paulo', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, sexo)
VALUES ('Fernanda Lima', '1977-06-25', 'Porto Alegre', 'F');
