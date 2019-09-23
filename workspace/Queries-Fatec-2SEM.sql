CREATE TABLE PECA(CodPeca int primary key not null, NomePeca Varchar(50) not null, CorPeca varchar(20) not null, PesoPeca int not null, CidadePeca varchar(40) not null)
CREATE TABLE EMBARQUE(CodPeca int primary key not null, CodFornecedor varchar(2) not null, qtdeEmbarque int not null);
CREATE TABLE FORNECEDOR(CodFornecedor varchar(2) primary key not null);