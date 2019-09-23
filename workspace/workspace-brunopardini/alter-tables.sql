--==============================================ALTER TABLES===================================================================
-----------------------------TABELA PREDIO-------------------------------------------------------------------------------------
ALTER TABLE PREDIO ADD CONSTRAINT PK_TB_PREDIO PRIMARY KEY(COD_PRED);
-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------TABELA SALA-------------------------------------------------------------------------------
ALTER TABLE SALA ADD CONSTRAINT PK_TB_SALA PRIMARY KEY(COD_PRED, NUM_SALA);
ALTER TABLE SALA ADD CONSTRAINT FK_TB_SALA_PREDIO FOREIGN KEY(COD_PRED) REFERENCES PREDIO(COD_PRED);
-------------------------------------------------------------------------------------------------------------------------------

-------------------------------------TABELA HORARIO----------------------------------------------------------------------------
ALTER TABLE HORARIO ADD CONSTRAINT PK_TB_HORARIO PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA, DIA_SEM, HORA_INICIO);

ALTER TABLE HORARIO ADD CONSTRAINT FK_TB_HORARIO_TURMA 
    FOREIGN KEY(SIGLA_TURMA, NUM_DISC, COD_DEPTO, ANO_SEM) REFERENCES TURMA(SIGLA_TURMA, NUM_DISC, COD_DEPTO, ANO_SEM);

ALTER TABLE HORARIO ADD CONSTRAINT FK_TB_HORARIO_SALA FOREIGN KEY(COD_PRED, NUM_SALA) 
    REFERENCES SALA(COD_PRED, NUM_SALA);
-------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------TABELA TURMA----------------------------------------------------------
ALTER TABLE TURMA ADD CONSTRAINT PK_TB_TURMA PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA);

ALTER TABLE TURMA ADD CONSTRAINT FK_TB_TURMA_DISCIPLINA FOREIGN KEY(COD_DEPTO, NUM_DISC) 
    REFERENCES DISCIPLINA(COD_DEPTO, NUM_DISC);
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA DISCIPLINA----------------------------------------------------------
ALTER TABLE DISCIPLINA ADD CONSTRAINT PK_TB_DISCIPLINA PRIMARY KEY(COD_DEPTO, NUM_DISC);

ALTER TABLE DISCIPLINA ADD CONSTRAINT FK_TB_DEPTO FOREIGN KEY(COD_DEPTO) 
    REFERENCES DEPTO(COD_DEPTO);
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA DEPTO----------------------------------------------------------
ALTER TABLE DEPTO ADD CONSTRAINT PK_TB_DEPTO PRIMARY KEY(COD_DEPTO);
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA PROFESSOR----------------------------------------------------------
ALTER TABLE PROFESSOR ADD CONSTRAINT PK_TB_PROFESSOR PRIMARY KEY(COD_PROF);

ALTER TABLE PROFESSOR ADD CONSTRAINT FK_TB_PROF_DEPTO FOREIGN KEY(COD_DEPTO) 
    REFERENCES DEPTO(COD_DEPTO);

ALTER TABLE PROFESSOR ADD CONSTRAINT FK_TB_TITULACAO FOREIGN KEY(COD_TIT) 
    REFERENCES TITULACAO(COD_TIT);
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA TITULACAO----------------------------------------------------------
ALTER TABLE TITULACAO ADD CONSTRAINT PK_TB_TITULACAO PRIMARY KEY(COD_TIT);
-------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------TABELA PROF_TURMA----------------------------------------------------------
ALTER TABLE PROF_TURMA ADD CONSTRAINT PK_TB_PROF_TURMA PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA, COD_PROF);

ALTER TABLE PROF_TURMA ADD CONSTRAINT FK_TB_TURMA FOREIGN KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA) 
    REFERENCES TURMA(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA);

ALTER TABLE PROF_TURMA ADD CONSTRAINT FK_TB_PROFESSOR FOREIGN KEY(COD_PROF) 
    REFERENCES PROFESSOR(COD_PROF);
-------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------TABELA PRE_REQ---------------------------------------------------------
ALTER TABLE PRE_REQ ADD CONSTRAINT PK_TB_PRE_REQ PRIMARY KEY(COD_DEPTO_PRE_REQ, NUM_DISC_PRE_REQ, COD_DEPTO, NUM_DISC);

ALTER TABLE PRE_REQ ADD CONSTRAINT FK_PREREQ_EH_PRE_DISCIPLINA FOREIGN KEY(COD_DEPTO, NUM_DISC)
    REFERENCES DISCIPLINA(COD_DEPTO, NUM_DISC);
    
ALTER TABLE PRE_REQ ADD CONSTRAINT FK_TB_DISCIPLINA_PRE_REQ FOREIGN KEY(COD_DEPTO_PRE_REQ, NUM_DISC_PRE_REQ)
    REFERENCES DISCIPLINA(COD_DEPTO, NUM_DISC);
    