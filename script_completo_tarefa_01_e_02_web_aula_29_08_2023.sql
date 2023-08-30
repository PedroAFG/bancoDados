create database veiculos1;

use veiculos1;

create table combustivel (
cd_combustivel int,
ds_combustivel varchar(30)
);

create table marca (
cd_marca int,
ds_marca varchar(30)
);

create table modelo (
cd_modelo int,
cd_marca int,
ds_modelo varchar(5)
);

create table localidade (
cd_localidade int,
nm_localidade varchar(50)
);

create table proprietario (
cd_proprietario int,
cd_localidade int,
nm_proprietario varchar(50),
ds_logradouro varchar(50),
ds_complemento varchar (50)
);

create table veiculo (
nr_placa char(7),
cd_proprietario int,
cd_modelo int,
nr_ano_fab int,
nr_ano_mod int,
qt_km_rodado int,
qt_portas int,
ds_observacao varchar(100)
);

create table veiculo_combustivel (
cd_combustivel int,
nr_placa char(7)
);

/*SEGUNDA PARTE*/

create table cor (
cd_cor int primary key auto_increment not null,
ds_cor varchar(30) not null
);

alter table combustivel 
modify column cd_combustivel int primary key auto_increment not null,
modify column ds_combustivel varchar(30) not null;

create table acessorio (
cd_acessorio int primary key auto_increment not null,
ds_acessorio varchar(50) not null
);

alter table marca 
modify column cd_marca int primary key auto_increment not null,
modify column ds_marca varchar(30) not null
;

alter table localidade 
modify column cd_localidade int primary key auto_increment not null,
modify column nm_localidade varchar (50) not null
;

alter table modelo 
modify column cd_modelo int primary key auto_increment not null,
modify column cd_marca int not null,
add foreign key (cd_marca) references marca (cd_marca),
modify column ds_modelo varchar(50)
;

alter table proprietario 
modify column cd_proprietario int primary key auto_increment not null,
modify column cd_localidade int not null,
add foreign key (cd_localidade) references localidade (cd_localidade),
modify column nm_proprietario varchar(50) not null,
modify column ds_logradouro varchar(50),
modify column ds_complemento varchar(50),
add ds_bairro varchar(50),
add nr_telefone varchar(15),
add ds_email varchar(50),
add sg_uf char(2)
;

alter table veiculo 
modify column nr_placa int primary key auto_increment not null,
add cd_cor int not null,
add foreign key (cd_cor) references cor (cd_cor),
modify column cd_proprietario int not null,
add foreign key (cd_proprietario) references proprietario (cd_proprietario),
modify column cd_modelo int not null,
add foreign key (cd_modelo) references modelo (cd_modelo),
modify column nr_ano_fab int not null,
modify column nr_ano_mod int not null,
modify column qt_km_rodado int not null,
modify column qt_portas int not null,
modify column ds_observacao varchar(100)
;

create table veiculo_acessorio (
nr_placa int,
foreign key (nr_placa) references veiculo (nr_placa),
cd_acessorio int,
foreign key (cd_acessorio) references acessorio (cd_acessorio)
);

alter table veiculo_combustivel 
modify column cd_combustivel int,
add foreign key (cd_combustivel) references combustivel (cd_combustivel),
modify column nr_placa int,
add foreign key (nr_placa) references veiculo (nr_placa)
;

