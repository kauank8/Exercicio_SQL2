create database Mecanica
go
use Mecanica

create table Cliente(
id_cliente int not null,
nome varchar(100) not null,
logradouro varchar(200) not null,
numero int not null,
cep char(8) not null,
complemento varchar(255)
Primary Key(id_cliente)
)
go
create table Telefone_Cliente(
id_cliente int not null,
telefone varchar(11) not null
Primary Key(id_cliente, telefone)
Foreign Key(id_cliente) References Cliente(id_cliente)
)
go
create table Veiculo(
placa char(7) not null,
marca varchar(30) not null,
modelo varchar(30) not null,
cor varchar(15) not null,
ano_Fabricacao int not null,
ano_Modelo int not null,
data_Aquisicao date not null,
id_cliente int not null
Primary Key(placa)
Foreign Key(id_cliente) References Cliente(id_Cliente)
)
go
create table Peca(
id_peca int not null,
nome varchar(30) not null,
preco decimal(4,2) not null,
estoque int not null
Primary Key(id_peca)
)
go
create table Categoria(
id_categoria int not null,
categoria varchar(10) not null,
valor_Hora decimal(4,2) not null
Primary Key(id_categoria)
)
go
create table Funcionario(
id_funcionario int not null,
nome varchar(100) not null,
logradouro varchar(200) not null,
numero int not null,
telefone char(11) not null,
categoria_Habilitacao varchar(2) not null,
id_categoria int not null
Primary Key(id_funcionario)
Foreign Key(id_categoria) References Categoria(id_categoria)
)
go
create table Reparo(
veiculo_placa char(7) not null,
id_funcionario int not null,
id_peca int not null,
data_reparo date not null,
custo_total decimal(4,2) not null,
tempo integer not null
Primary Key(veiculo_placa,id_funcionario,id_peca,data_reparo)
Foreign Key(veiculo_placa) References Veiculo(placa),
Foreign Key(id_funcionario) References Funcionario(id_funcionario),
Foreign Key(id_peca) References Peca(id_peca)
)
