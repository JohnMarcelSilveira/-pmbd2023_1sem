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
    salario money,
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
INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo)
VALUES ('Cobras & Lagartos', '2006-04-24', '2006-11-18');
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
VALUES ('Misterios de uma Vida', '2021-06-05','2022-12-10','20:30:00');

/* tabela atores */

INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Fernanda Montenegro', '1929-10-16', 'Rio de Janeiro', '100000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Wagner Moura', '1976-06-27', 'Salvador', '80000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Débora Falabella', '1979-02-22', 'Belo Horizonte', '75000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Lázaro Ramos', '1978-11-01', 'Salvador', '70000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Taís Araújo', '1978-11-25', 'Rio de Janeiro', '75000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Murilo Benício', '1972-07-13', 'Niterói', '80000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Camila Pitanga', '1977-06-14', 'Rio de Janeiro', '70000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Tony Ramos', '1948-08-25', 'Araras', '90000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Gloria Pires', '1963-08-23', 'Rio de Janeiro', '80000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Mateus Solano', '1981-03-20', 'Brasília', '75000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Alinne Moraes', '1982-12-22', 'Sorocaba', '70000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Cauã Reymond', '1980-05-20', 'Rio de Janeiro', '90000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Juliana Paes', '1979-03-26', 'Rio de Janeiro', '80000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Rodrigo Lombardi', '1976-10-15', 'São Paulo', '85000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario,sexo)
VALUES ('Paolla Oliveira', '1982-04-14', 'São Paulo', '75000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Marcos Palmeira', '1963-08-19', 'São Paulo', '80000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Isis Valverde', '1987-02-17', 'Aiuruoca', '70000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Selton Mello', '1972-12-30', 'Passos', '90000.00', 'M');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Deborah Secco', '1979-11-26', 'Rio de Janeiro', '80000.00', 'F');
INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo)
VALUES ('Ricardo Tozzi', '1975-06-18', 'São Paulo', '75000.00', 'M');


/* tabela personagens */

INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Maria da Paz', '1978-03-10', 'Estável', 1);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Rita de Cássia', '1985-11-18', 'Endividada', 2);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Tereza Cristina', '1970-07-25', 'Equilibrada', 3);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Clara', '1992-09-05', 'Estável', 4);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Bibi Perigosa', '1988-04-14', 'Endividada', 5);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Jade', '1995-02-28', 'Equilibrada', 6);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Eric', '1987-08-22', 'Estável', 7);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Carminha', '1979-06-10', 'Endividada', 8);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Rita/Nina', '1990-12-19', 'Equilibrada', 9);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Helena', '1985-09-03', 'Estável', 10);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Maria do Carmo', '1976-02-11', 'Endividada', 11);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Félix', '1992-07-29', 'Equilibrado', 12);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Amora', '1988-10-07', 'Estável', 13);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Tóia', '1994-03-21', 'Endividada', 14);
INSERT INTO personagens (nome, data_nascimento, situacao_financeira, cod_ator)
VALUES ('Antenor', '1989-05-17', 'Equilibrado', 15);

-- tabela novelas_personagens

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (1, 1);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (1, 2);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (2, 3);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (3, 4);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (4, 5);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (4, 6);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (5, 7);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (6, 8);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (7, 9);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (7, 10);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (8, 11);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (9, 12);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (10, 13);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (11, 14);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (11, 15);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (12, 1);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (12, 2);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (13, 3);

INSERT INTO novelas_personagens (cod_novela, cod_personagem)
VALUES (13, 4);

-- tabela novelas

-- Gerando 10 INSERTs com valores aleatórios
INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 1', '2023-01-01', 1);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 2', '2023-01-08', 2);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 3', '2023-01-15', 3);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 4', '2023-01-22', 4);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 5', '2023-01-29', 5);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 6', '2023-02-05', 6);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 7', '2023-02-12', 7);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 8', '2023-02-19', 8);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 9', '2023-02-26', 9);

INSERT INTO capitulos (nome, data_exibicao, cod_novela)
VALUES ('Capítulo 10', '2023-03-05', 10);


/*
2-> select data_ultimo_capitulo from novelas where nome = 'Misterios de uma Vida'; 

3-> select * from novelas where horario_exibicao is null;

4-> select * from atores where cidade like 'M%';

5-> select * from novelas where cidade like '%vida%';

6-> select * from personagens order by nome;

7-> select * from personagens order by extract(year from age(CURRENT_DATE,data_nascimento)) desc; fazer a idade aqui

8-> select count(codigo) from atores;

9-> select count(codigo) from novelas;

10-> select count(codigo) from atores where sexo = 'F';

11-> select AVG(extract(year from age(CURRENT_DATE,data_nascimento))) as media_idade from personagens;

12-> select * from personagens where extract(year from age(CURRENT_DATE,data_nascimento)) < 15;

13-> select * from atores where salario =(select max(salario) from atores);

14-> select * from atores where salario =(select min(salario) from atores);

15-> select sum(salario) from atores;
*/