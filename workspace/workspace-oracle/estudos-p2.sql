CREATE TABLE PREDIO_(
    COD_PRED INT NOT NULL, 
    NOME_PRED VARCHAR(40) NOT NULL
);

CREATE TABLE SALA_(
    NUM_SALA INT  NOT NULL, 
    COD_PRED INT NOT NULL,
    DESCRICAO_SALA VARCHAR(40) NOT NULL, 
    CAPAC_SALA INT NOT NULL
);

CREATE TABLE HORARIO_(
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
    
CREATE TABLE TURMA_(
    ANO_SEM INT NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL,
    NUM_DISC INT NOT NULL, 
    SIGLA_TURMA CHAR(2) NOT NULL, 
    CAPAC_TURMA INT NOT NULL
);
    
CREATE TABLE DISCIPLINA_(
    COD_DEPTO CHAR(5) NOT NULL, 
    NUM_DISC INT NOT NULL, 
    NOME_DISC VARCHAR(10) NOT NULL, 
    CREDITO_DISC INT NOT NULL
);

CREATE TABLE PRE_REQ_(
    COD_DEPTO_PRE_REQ CHAR(5) NOT NULL, 
    NUM_DISC_PRE_REQ INT NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL, 
    NUM_DISC INT NOT NULL
);
    
CREATE TABLE DEPTO_(
    COD_DEPTO CHAR(5) NOT NULL, 
    NOME_DEPTO VARCHAR(40) NOT NULL
);

CREATE TABLE PROFESSOR_(
    COD_PROF INT NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL, 
    COD_TIT INT NOT NULL, 
    NOME_PROF VARCHAR(40) NOT NULL
);

CREATE TABLE PROF_TURMA_(
    ANO_SEM INT NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL, 
    NUM_DISC INT NOT NULL, 
    SIGLA_TURMA CHAR(2) NOT NULL, 
    COD_PROF INT NOT NULL
);
    
CREATE TABLE TITULACAO_(
    COD_TIT INT NOT NULL, 
    NOME_TIT VARCHAR(40) NOT NULL
);

--==============================================ALTER TABLES===================================================================
-----------------------------TABELA PREDIO-------------------------------------------------------------------------------------
ALTER TABLE PREDIO_ ADD CONSTRAINT PK_TB_PREDIO PRIMARY KEY(COD_PRED);
-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------TABELA SALA-------------------------------------------------------------------------------
ALTER TABLE SALA_ ADD CONSTRAINT PK_TB_SALA PRIMARY KEY(COD_PRED, NUM_SALA);
ALTER TABLE SALA_ ADD CONSTRAINT FK_TB_SALA_PREDIO FOREIGN KEY(COD_PRED) REFERENCES PREDIO;
-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------TABELA HORARIO----------------------------------------------------------------------------
ALTER TABLE HORARIO_ ADD CONSTRAINT PK_TB_HORARIO PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA, DIA_SEM, HORA_INICIO);
ALTER TABLE HORARIO_ ADD CONSTRAINT FK_TB_HORARIO_TURMA FOREIGN KEY(SIGLA_TURMA, NUM_DISC, COD_DEPTO, ANO_SEM) REFERENCES TURMA;
ALTER TABLE HORARIO_ ADD CONSTRAINT FK_TB_HORARIO_SALA FOREIGN KEY(COD_PRED, NUM_SALA) REFERENCES SALA;
-------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------TABELA TURMA----------------------------------------------------------
ALTER TABLE TURMA_ ADD CONSTRAINT PK_TB_TURMA PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA);
ALTER TABLE TURMA_ ADD CONSTRAINT FK_TB_TURMA_DISCIPLINA FOREIGN KEY(COD_DEPTO, NUM_DISC) REFERENCES DISCIPLINA;
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA DISCIPLINA----------------------------------------------------------
ALTER TABLE DISCIPLINA_ ADD CONSTRAINT PK_TB_DISCIPLINA PRIMARY KEY(COD_DEPTO, NUM_DISC);
ALTER TABLE DISCIPLINA_ ADD CONSTRAINT FK_TB_DEPTO FOREIGN KEY(COD_DEPTO) REFERENCES DEPTO_;
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA DEPTO----------------------------------------------------------
ALTER TABLE DEPTO_ ADD CONSTRAINT PK_TB_DEPTO PRIMARY KEY(COD_DEPTO);
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA PROFESSOR----------------------------------------------------------
ALTER TABLE PROFESSOR_ ADD CONSTRAINT PK_TB_PROFESSOR PRIMARY KEY(COD_PROF);
ALTER TABLE PROFESSOR_ ADD CONSTRAINT FK_TB_DEPTO FOREIGN KEY(COD_DEPTO) REFERENCES DEPTO_;
ALTER TABLE PROFESSOR_ ADD CONSTRAINT FK_TB_TITULACAO FOREIGN KEY(COD_TIT) REFERENCES TITULACAO_;
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA TITULACAO----------------------------------------------------------
ALTER TABLE TITULACAO_ ADD CONSTRAINT PK_TB_TITULACAO PRIMARY KEY(COD_TIT);
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA PROF_TURMA----------------------------------------------------------
ALTER TABLE PROF_TURMA_ ADD CONSTRAINT PK_TB_PROF_TURMA PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA, COD_PROF);
ALTER TABLE PROF_TURMA_ ADD CONSTRAINT FK_TB_TURMA FOREIGN KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA) REFERENCES TURMA_;
ALTER TABLE PROF_TURMA_ ADD CONSTRAINT FK_TB_PROFESSOR FOREIGN KEY(COD_PROF, COD_DEPTO) REFERENCES PROFESSOR_;
-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------EXEMPLO STORAGE PROCEDURE------------------------------------------------------