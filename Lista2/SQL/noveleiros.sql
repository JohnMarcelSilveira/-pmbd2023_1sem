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