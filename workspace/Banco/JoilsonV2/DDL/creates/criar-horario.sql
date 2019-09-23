CREATE TABLE IF NOT EXISTS HORARIO(
    ANO_SEM INT unsigned NOT NULL, 
    COD_DEPTO CHAR(5) NOT NULL, 
    NUM_DISC INT unsigned NOT NULL, 
    SIGLA_TURMA CHAR(2) NOT NULL,
    DIA_SEM INT unsigned NOT NULL, 
    HORA_INICIO INT unsigned NOT NULL, 
    NUM_SALA INT unsigned NOT NULL, 
    COD_PRED INT unsigned NOT NULL, 
    NUM_HORAS INT unsigned NOT NULL
);
