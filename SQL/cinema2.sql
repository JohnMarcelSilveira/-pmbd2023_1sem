/* \i caminho/arquivo.sql */

drop database if exists cinema2;

create database cinema2;

\c cinema2;

create table salas(
    numero integer primary key,
    descricao text,
    capacidade integer CHECK (capacidade > 0)    
);

create table diretor(
    codigo serial primary key,
    nome char varying(100)
);

create table filmes(
    codigo serial primary key,
    nome text,
    ano_lancamento integer,
    categoria char varying(100),
    cod_diretor integer references diretor(codigo)
);

create table salas_filmes(
    numero_sala integer primary key,
    cod_filme integer references filmes(codigo),
    data date,
    horario time
);

create table premios(
    codigo serial primary key,
    nome char varying(100),
    ano_premiacao integer,
    cod_filme integer references filmes(codigo)
);

