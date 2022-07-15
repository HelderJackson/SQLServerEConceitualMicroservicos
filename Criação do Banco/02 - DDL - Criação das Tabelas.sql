use DBConsorcio

-- CRIAÇÃO DAS TABELAS
CREATE TABLE Clientes (
    ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nome varchar(100) NOT NULL,
    CPF varchar(11) NOT NULL,
    UF char(2) NOT NULL,
    Celular varchar(10) NOT NULL
);

CREATE TABLE Financiamentos (
    ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ClienteID int NOT NULL,
    CPF varchar(11) NOT NULL,
    TipoDeFinanciamento int NOT NULL,
    ValorTotal decimal(18,0) NOT NULL,
    DataDoUltimoVencimento DateTime NOT NULL,
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

CREATE TABLE Parcelamentos (
    ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	FinanciamentoID int NOT NULL,
    NumeroDaParcela int NOT NULL,
    ValorDaParcela decimal(18,0) NOT NULL,
    DataDoVencimento DateTime NOT NULL,
	DataPagamento DateTime NULL,
	FOREIGN KEY (FinanciamentoID) REFERENCES Financiamentos(ID)
);