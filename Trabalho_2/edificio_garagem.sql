DROP DATABASE IF EXISTS edificio_garagem;

CREATE DATABASE edificio_garagem;

\c edificio_garagem;


CREATE TABLE cliente(
    id serial primary key,
    cpf character(11) unique not null,
    nome character varying(60) not null,
    data_nascimento date not null,
    rua character varying(60), 
    bairro character varying(60),
    complemento character varying(60), 
    numero character varying(10)
);

CREATE TABLE modelo(
    id serial primary key,
    descricao character varying(60) not null,
    ano_lancamento integer
);

CREATE TABLE veiculo(
    id serial primary key,
    chassi character(17) unique not null,
    placa character(7) not null,
    cor character varying(30), 
    ano integer, 
    cliente_id integer references cliente(id),
    modelo_id integer references modelo(id)
);

CREATE TABLE andar(
    id serial primary key,
    numero_vagas integer not null
);

CREATE TABLE vaga(
    id serial primary key,
    numero_vaga integer,
    descricao character varying(30),
    preferencial boolean default false,
    andar_id integer references andar(id),
    unique(numero_vaga,andar_id) 
--eu quero que a pk da vaga seja o numero e seu andar pois eu posso ter a vaga numero 1 no andar 1, andar 2 e etc
);

CREATE TABLE estacionamento(    
    vaga_id integer references vaga(id), --quando eu uso pk composta essa fk não rola
    veiculo_id integer references veiculo(id),
    data_hora_entrada timestamp not null,
    data_hora_saida timestamp,
    valor_pago money,
    primary key(veiculo_id,vaga_id,data_hora_entrada)
);

--insert na tabela clientes

INSERT INTO cliente (cpf, nome, data_nascimento, rua, bairro, complemento, numero)
VALUES
  ('12345678901', 'João Silva', '1990-05-10', 'Rua A', 'Bairro X', 'Apto 101', '123'),
  ('98765432109', 'Maria Souza', '1985-12-15', 'Rua B', 'Bairro Y', NULL, '456'),
  ('45678912304', 'Pedro Santos', '1995-07-20', 'Rua C', 'Bairro Z', 'Casa 2', '789'),
  ('11111111111', 'Ana Oliveira', '1992-08-20', 'Rua D', 'Bairro W', 'Casa 1', '111'),
  ('22222222222', 'Carlos Santos', '1988-03-25', 'Rua E', 'Bairro V', NULL, '222'),
  ('33333333333', 'Mariana Costa', '1997-06-05', 'Rua F', 'Bairro U', 'Bloco 3', '333'),
  ('44444444444', 'Lucas Pereira', '1993-01-12', 'Rua G', 'Bairro T', 'Apto 202', '444'),
  ('55555555555', 'Juliana Rodrigues', '1991-11-02', 'Rua H', 'Bairro S', 'Casa 5', '555');

--insert na tabela modelo

INSERT INTO modelo (descricao, ano_lancamento)
VALUES
  ('Sedan', 2010),
  ('SUV', 2012),
  ('Hatchback', 2008),
  ('Crossover', 2015),
  ('Pickup', 2017);

--insert na tabela veiculo

INSERT INTO veiculo (chassi, placa, cor, ano, cliente_id, modelo_id)
VALUES
  ('ABCD1234567890', 'ABC1234', 'Preto', 2022, 1, 1),
  ('EFGH9876543210', 'DEF5678', 'Branco', 2018, 2, 2),
  ('IJKL5432109876', 'GHI9012', 'Azul', 2020, 3, 3),
  ('MNOP0987654321', 'JKL3456', 'Vermelho', 2019, 4, 2),
  ('QRST5678901234', 'MNO7890', 'Prata', 2021, 5, 4);

--insert na tabela andar

INSERT INTO andar (numero_vagas)
VALUES
  (10),
  (8),
  (12);

--insert na tabela vagas
INSERT INTO vaga (numero_vaga,descricao,andar_id)
VALUES
  (1,null,1),
  (2,'Fica entre colunas',1),
  (3,null,1),
  (1,null,2),
  (2,null,2),
  (3,null,2),
  (1,null,3),
  (2,'Perto do elevador',3),
  (3,null,3);

--atualizar para que todas vagas nº 1 sejam preferencial
UPDATE vaga SET preferencial = true WHERE numero_vaga = 1;

--insert na tabela estacionamento
INSERT INTO estacionamento (vaga_id, veiculo_id, data_hora_entrada, data_hora_saida, valor_pago)
VALUES
  (1, 1, '2023-05-21 09:00:00', '2023-05-21 17:00:00', 20.50),
  (2, 2, '2023-05-21 10:30:00', '2023-05-21 15:45:00', 15.75),
  (3, 3, '2023-05-21 14:15:00', null, null);



/*select's

select placa, ano from veiculo where placa = 'JKL3456';

select placa, ano from veiculo where ano >= 2000;

select * from veiculo where modelo_id = 1;

select * from estacionamento where veiculo_id = 2;

select age(data_hora_saida, data_hora_entrada) as tempo_em_horas from estacionamento where vaga_id = 2;

select count(*) as qtd from veiculo where modelo_id = 3;

select avg(extract(year from age(current_date,data_nascimento))) as media_idade from cliente;

select extract(hour from age(data_hora_saida,data_hora_entrada)) * 2 as valor_pago from estacionamento;


*/