/*CREATE DATABASE bancocarros;

USE bancocarros;*/

CREATE TABLE IF NOT EXISTS usuario(
	CPF varchar(11) primary key,
    nome varchar(50),
    CNH varchar(100),
    tipo_usuario enum("administrador", "cliente")
)charset = "utf8mb4" COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS endereco(
	CEP varchar(50),
    bairro varchar(50),
    cidade varchar(20),
    estado ENUM("AC","AL","AP","AM","BA","CE","DF","ES","GO","MA","MT","MS","MG","PA","PB","PR","PE","PI","RJ","RN","RS","RO","RR","SC","SP","SE","TO")not null,
    cpf varchar(11),
    constraint foreign key(cpf) references usuario(CPF)
)charset = "utf8mb4" COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS carros(
	placa varchar(11) primary key,
    nome varchar(50),
    qtd_carros int,
    tipo_carro enum("hatchback", "suv", "picape", "sedan", "furgão", "compacto")
)charset = "utf8mb4" COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS documentos(
	CRL_V varchar(50) primary key,
    licenciamento date,
    placa varchar(11),
    constraint foreign key(placa) references carros(placa)
)charset = "utf8mb4" COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS crl_v(
	renavam VARCHAR(50),
    chassi varchar(17),
    ano_modelo date,
    cor varchar(20),
    categoria varchar(20),
    combustivel varchar(20),
    municipio varchar(100),
    crl_v varchar(50),
    constraint foreign key (crl_v) references documentos(CRL_V)
)charset = "utf8mb4" COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS reservas(
	voucher int primary key,
    carro_reservado varchar(100),
    usuario_veiculo varchar(100),
    placa varchar(11),
    cpf_usu varchar(11),
    constraint foreign key (cpf_usu) references usuario(CPF),
    constraint foreign key (placa) references carros(placa)
)charset = "utf8mb4" COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS monetario(
	montante float,
    prazo date,
    diaria float,
    voucher int,
    constraint foreign key (voucher) references reservas(voucher)
)charset = "utf8mb4" COLLATE=utf8mb4_general_ci;

CREATE USER IF NOT EXISTS 'cliente'@'localhost' IDENTIFIED BY 'Senh@Fort3';

GRANT SELECT ON bancocarros.carros TO 'cliente'@'localhost';
GRANT SELECT ON bancocarros.reservas to 'cliente'@'localhost';

FLUSH PRIVILEGES;