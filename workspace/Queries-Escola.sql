CREATE TABLE PREDIO(
    COD_PRED INT NOT NULL, 
    NOME_PRED VARCHAR(40) NOT NULL
);

CREATE TABLE SALA(
    NUM_SALA INT  NOT NULL, 
    COD_PRED INT NOT NULL,
    DESCRICAO_SALA VARCHAR(40) NOT NULL, 
    CAPAC_SALA INT NOT NULL
);

CREATE TABLE HORARIO(
    ANO_SEM INT  NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL, 
    NUM_DISC INT NOT NULL, 
    SIGLA_TURMA CHAR(2) NOT NULL,
    DIA_SEM INT NOT NULL, 
    HORA_INICIO INT NOT NULL, 
    NUM_SALA INT NOT NULL, 
    COD_PRED INT NOT NULL, 
    NUM_HORAS INT NOT NULL
);
    
CREATE TABLE TURMA(
    ANO_SEM INT NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL,
    NUM_DISC INT NOT NULL, 
    SIGLA_TURMA CHAR(2) NOT NULL, 
    CAPAC_TURMA INT NOT NULL
);
    
CREATE TABLE DISCIPLINA(
    COD_DEPTO CHAR(5) NOT NULL, 
    NUM_DISC INT NOT NULL, 
    NOME_DISC VARCHAR(10) NOT NULL, 
    CREDITO_DISC INT NOT NULL
);

CREATE TABLE PRE_REQ(
    COD_DEPTO_PRE_REQ CHAR(5) NOT NULL, 
    NUM_DISC_PRE_REQ INT NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL, 
    NUM_DISC INT NOT NULL
);
    
CREATE TABLE DEPTO(
    COD_DEPTO CHAR(5) NOT NULL, 
    NOME_DEPTO VARCHAR(40) NOT NULL
);

CREATE TABLE PROFESSOR(
    COD_PROF INT NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL, 
    COD_TIT INT NOT NULL, 
    NOME_PROF VARCHAR(40) NOT NULL
);

CREATE TABLE PROF_TURMA(
    ANO_SEM INT NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL, 
    NUM_DISC INT NOT NULL, 
    SIGLA_TURMA CHAR(2) NOT NULL, 
    COD_PROF INT NOT NULL
);
    
CREATE TABLE TITULACAO(
    COD_TIT INT NOT NULL, 
    NOME_TIT VARCHAR(40) NOT NULL
);

--==============================================ALTER TABLES===================================================================
-----------------------------TABELA PREDIO-------------------------------------------------------------------------------------
ALTER TABLE PREDIO ADD CONSTRAINT PK_TB_PREDIO PRIMARY KEY(COD_PRED);
-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------TABELA SALA-------------------------------------------------------------------------------
ALTER TABLE SALA ADD CONSTRAINT PK_TB_SALA PRIMARY KEY(COD_PRED, NUM_SALA);
ALTER TABLE SALA ADD CONSTRAINT FK_TB_SALA_PREDIO FOREIGN KEY(COD_PRED) REFERENCES PREDIO;
-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------TABELA HORARIO----------------------------------------------------------------------------
ALTER TABLE HORARIO ADD CONSTRAINT PK_TB_HORARIO PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA, DIA_SEM, HORA_INICIO);
ALTER TABLE HORARIO ADD CONSTRAINT FK_TB_HORARIO_TURMA FOREIGN KEY(SIGLA_TURMA, NUM_DISC, COD_DEPTO, ANO_SEM) REFERENCES TURMA;
ALTER TABLE HORARIO ADD CONSTRAINT FK_TB_HORARIO_SALA FOREIGN KEY(COD_PRED, NUM_SALA) REFERENCES SALA;
-------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------TABELA TURMA----------------------------------------------------------
ALTER TABLE TURMA ADD CONSTRAINT PK_TB_TURMA PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA);
ALTER TABLE TURMA ADD CONSTRAINT FK_TB_TURMA_DISCIPLINA FOREIGN KEY(COD_DEPTO, NUM_DISC) REFERENCES DISCIPLINA;
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA DISCIPLINA----------------------------------------------------------
ALTER TABLE DISCIPLINA ADD CONSTRAINT PK_TB_DISCIPLINA PRIMARY KEY(COD_DEPTO, NUM_DISC);
-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------EXEMPLO STORAGE PROCEDURE------------------------------------------------------