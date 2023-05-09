/* \i caminho/arquivo.sql */

drop database if exists cinema2;

create database cinema2;

\c cinema2;

create table salas(
    numero integer primary key,
    descricao text,
    capacidade integer CHECK (capacidade > 0)    
);

create table diretores(
    codigo serial primary key,
    nome char varying(100)
);

create table filmes(
    codigo serial primary key,
    nome text,
    ano_lancamento integer,
    categoria char varying(100),
    cod_diretor integer references diretores(codigo)
);

CREATE TABLE salas_filmes (
    numero_sala integer references salas (numero),
    cod_filme integer references filmes (codigo),
    data date,
    horario time,
    primary key (numero_sala, cod_filme, data)
);
create table premios(
    codigo serial primary key,
    nome char varying(100),
    ano_premiacao integer check (ano_premiacao > 1900),
    cod_filme integer references filmes(codigo)
);

INSERT INTO salas (numero, descricao, capacidade) VALUES
(101, 'Sala 3D 1', 100),
(102, 'Sala 3D 2', 100),
(103, 'Sala Convencional 1', 150),
(201, 'Sala Convencional 2', 100),
(202, 'Sala 3D 3', 80); 

INSERT INTO diretores (codigo, nome) VALUES 
(1, 'Fulano de Tal da Silva'),
(2, 'Ciclana das Neves'),
(3, 'Josicreidson Seilayevski'); 

INSERT INTO filmes (nome, ano_lancamento, categoria, cod_diretor) VALUES
('Titanic', 1997, 'Drama', 1),
('Matrix', 2001 ,'Ficção', 1),
('À Prova de Fogo', 2009, 'Romance', 2 ),
('Toy Story',1998 ,'Animação', 3),
('Shrek', 2000, 'Animação', 2);

INSERT INTO salas_filmes(numero_sala, cod_filme, data, horario) VALUES
(101, 1, '2014-04-14', '20:00'),
(101, 2, '2014-04-15', '22:00'),
(102, 1, '2014-04-10', '19:00'),
(103, 3, '2014-04-22', '16:00'),
(201, 4, '2014-04-14', '22:00'),
(201, 5, '2014-04-15', '20:00'),
(202, 3, '2014-04-21', '20:00');

INSERT INTO premios (codigo, nome, ano_premiacao, cod_filme) VALUES
(1, 'Oscar – Melhor Filme' ,1997, 1),
(2, 'Oscar – Melhor Diretor', 1997, 1),
(3, 'Globo de Ouro – Melhor Filme', 1997, 1),
(4, 'Oscar – Efeitos Especiais', 2002 ,2),
(5, 'Globo de Ouro – Melhor Animação', 1999, 4),
(6, 'Globo de Ouro – Melhor Animação', 2001 ,5),
(7, 'Oscar – Melhor Atriz Coadjuvante', 1997, 1 );


select nome from filmes where categoria = 'Animação'