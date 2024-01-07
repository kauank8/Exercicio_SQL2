CREATE DATABASE MATERNIDADE
GO
USE MATERNIDADE
 
CREATE TABLE mae (
ID_Mae		INT				NOT NULL	IDENTITY(1001,1),
nome		VARCHAR(60)		NOT NULL,
logradouro	VARCHAR(100)	NOT NULL,
numero		INT				NOT NULL CHECK(numero>=0),
cep			CHAR(8)			NOT NULL CHECK(LEN(cep)=8),
complemento	VARCHAR(200)	NOT NULL,
telefone	CHAR(10)		NOT NULL CHECK(LEN(telefone)=10),
data_nasc	DATE			NOT NULL
PRIMARY KEY (ID_Mae)
)
GO
CREATE TABLE medico (
CRM_numero		INT				NOT NULL,
CRM_UF			CHAR(2)			NOT NULL,
nome			VARCHAR(60)		NOT NULL,
celular			CHAR(11)		NULL UNIQUE CHECK(LEN(celular)=11),
especialidade	VARCHAR(30)		NOT NULL
PRIMARY KEY(CRM_numero, CRM_UF)
)
GO
CREATE TABLE bebe (
ID_Bebe			INT				NOT NULL IDENTITY(1,1),
nome			VARCHAR(60)		NOT NULL,
data_nasc		DATE			NOT NULL DEFAULT(GETDATE()),
altura			DECIMAL(7,2)	NOT NULL CHECK (altura>0),
peso			DECIMAL(7,2)	NOT NULL CHECK(peso>0),
ID_Mae			INT				NOT NULL
PRIMARY KEY (ID_Bebe)
FOREIGN KEY (ID_Mae) REFERENCES mae(ID_Mae)
)
GO
CREATE TABLE bebe_medico (
ID_Bebe			INT				NOT NULL,
CRM_numero		INT				NOT NULL,
CRM_UF			CHAR(2)			NOT NULL
PRIMARY KEY (ID_Bebe, CRM_Numero, CRM_UF)
FOREIGN KEY (ID_Bebe) REFERENCES bebe(ID_Bebe),
FOREIGN KEY (CRM_numero, CRM_UF) REFERENCES
	medico(CRM_numero, CRM_UF)
)

-- TESTES

-- MAE
-- NUMERO NÃO NEGATIVO
insert into mae
values('carina','rua 2',-1,'0000','casa 1', '11111','2004-02-12')

-- CEP SEM 8 digitos
insert into mae
values('carina','rua 2',1,'0000','casa 1', '11111','2004-02-12')

-- TELEFONE SEM 10 DIGITO
insert into mae
values('carina','rua 2',1,'12345678','casa 1', '11111','2004-02-12')

-- MEDICO
-- NUMERO sem 11 digitos
insert into medico values
(1,'sp','kauan','12345','aaaa')

-- inserindo numeros iguais
insert into medico values
(1,'sp','kauan','12345678911','aaaa')
insert into medico values
(2,'sp','kauan','12345678911','aaaa')



