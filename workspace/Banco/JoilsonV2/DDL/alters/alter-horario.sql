ALTER TABLE HORARIO ADD CONSTRAINT PK_TB_HORARIO PRIMARY KEY(ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA, DIA_SEM, HORA_INICIO);
ALTER TABLE HORARIO ADD CONSTRAINT FK_TB_HORARIO_TURMA FOREIGN KEY(SIGLA_TURMA, NUM_DISC, COD_DEPTO, ANO_SEM) REFERENCES TURMA;
ALTER TABLE HORARIO ADD CONSTRAINT FK_TB_HORARIO_SALA FOREIGN KEY(COD_PRED, NUM_SALA) REFERENCES SALA;