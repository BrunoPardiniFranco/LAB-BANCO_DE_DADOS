CREATE OR REPLACE PROCEDURE INSERT_PREDIO
    (p_cod_pred predio.cod_pred%type, p_nome_pred predio.NOME_PRED%type)
IS

BEGIN
    Insert into Predio (cod_pred, nome_pred)
    values (p_cod_pred, p_nome_pred);
END;

CREATE OR REPLACE PROCEDURE insert_Sala
    (p_CodPred IN INT, p_NumSala IN INT, p_DescricaoSala IN VARCHAR2, p_CapacSala IN INT)
IS

BEGIN
    Insert into Sala (Cod_Pred, Num_Sala, Descricao_Sala, Capac_Sala)
    values (p_CodPred, p_NumSala, p_DescricaoSala, p_CapacSala);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE insert_Depto
    (p_CodDepto IN CHAR, p_NomeDepto VARCHAR2)
IS

BEGIN
    Insert into Depto (Cod_Depto, Nome_Depto)
    values (p_CodDepto, p_NomeDepto);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE insert_Disciplina
    (p_CodDepartamento IN VARCHAR2, p_numdisciplina IN INT, p_nomedisciplina VARCHAR2, p_creditodisciplina IN INT)
IS

BEGIN
    Insert into Disciplina (Cod_Depto, NUM_DISC, NOME_DISC, CREDITO_DISC)
    values (p_CodDepartamento, p_numdisciplina, p_nomedisciplina, p_creditodisciplina);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE insert_Titulacao
    (p_codigotitulacao IN INT, p_nometitulacao IN VARCHAR2)
IS

BEGIN
    Insert into titulacao (COD_TIT, NOME_TIT)
    values (p_codigotitulacao, p_nometitulacao);
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE insert_Professor
    (p_codigoprofessor IN INT, p_coddepto IN VARCHAR2, p_codtitulacao IN INT, p_nomeprofessor IN VARCHAR2)
IS

BEGIN
    Insert into Professor (COD_PROF, COD_DEPTO, COD_TIT, NOME_PROF)
    values (p_codigoprofessor, p_coddepto, p_codtitulacao, p_nomeprofessor);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE insert_Turma
    (p_anosem IN INT, p_coddepto IN VARCHAR2, p_numdisc IN INT, p_siglatur IN VARCHAR2, p_capactur IN INT)
IS

BEGIN
    Insert into Turma (ano_sem, cod_depto, num_disc, sigla_turMA, capac_turma)
    values (p_anosem, p_coddepto, p_numdisc, p_siglatur, p_capactur);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE insert_profturma
    (p_anosemestre IN INT, p_coddepto IN VARCHAR2, p_numdisciplina IN INT, p_siglaturma IN VARCHAR2, p_codprofessor IN INT)
IS

BEGIN
    Insert into prof_turma (ANO_SEM, COD_DEPTO, NUM_DISC, SIGLA_TURMA, COD_PROF)
    values (p_anosemestre, p_coddepto, p_numdisciplina, p_siglaturma, p_codprofessor);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE insert_Horario
    (p_anosemestre IN INT, p_coddepartamento IN VARCHAR2, p_numdisciplina IN INT,
        p_siglaturma IN VARCHAR2, p_diasemestre IN INT, p_horainicio IN INT,
            p_numsala IN INT, p_codpredio IN INT, p_numerohoras IN INT)
IS

BEGIN
    Insert into horario (ANO_SEM, COD_DEPTO, NUM_DISC, sigla_turma, dia_sem, 
                            hora_inicio, num_sala, cod_pred, num_horas)
    values (p_anosemestre, p_coddepartamento, p_numdisciplina, p_siglaturma, p_diasemestre, 
            p_horainicio, p_numsala, p_codpredio, p_numerohoras);
    COMMIT;
END;


CREATE OR REPLACE PROCEDURE insert_PreRequesito
    (p_coddeptoprerequesito IN VARCHAR2, p_numdisciplinaprerequesito IN INT,
        p_coddepto IN VARCHAR2, p_numdisciplina IN INT)
IS

BEGIN
    Insert into PRE_REQ (COD_DEPTO_PRE_REQ, NUM_DISC_PRE_REQ, COD_DEPTO, NUM_DISC)
    values(p_coddeptoprerequesito, p_numdisciplinaprerequesito, p_coddepto, p_numdisciplina);
    COMMIT;
END;

/** INSERT PREDIO **/
DECLARE

BEGIN
    INSERT_PREDIO(43423, 'Informática - aulas');
    INSERT_PREDIO(43529, 'Polimeros - aulas');
    INSERT_PREDIO(43981, 'Comex - aulas');
END;

SELECT * FROM PREDIO;

/*INSERT SALA*/
DECLARE

BEGIN
    insert_Sala(43423, 101, 'Sala Comum', 20);
    insert_Sala(43423,102,'Sala Comum',20); 
    insert_Sala(43423,103,'Laboratorio',30);
    insert_Sala(43423,104,'Laboratorio',50);
    
    insert_Sala(43529,10,'Sala Comum',30);
    insert_Sala(43529,11,'Sala Comum',30);
    insert_Sala(43529,20,'Laboratorio',60);
    insert_Sala(43529,21,'Laboratorio',60);
    
    insert_Sala(43981,1,'Sala Comum',30);
    insert_Sala(43981,2,'Sala Comum',30);
    insert_Sala(43981,3,'Sala Comum',30);
    insert_Sala(43981,4,'Laboratorio',60);
END;

Select * From Sala Order By num_sala ASC;

/** Insert Depto **/
DECLARE

BEGIN
    insert_Depto('INF01','Informatica');
    insert_Depto('POL01','Polimeros');
    insert_Depto('COM01','COMEX');
END;

Select * from depto;

/** Insert Disciplina**/
DECLARE

BEGIN
    insert_disciplina('INF01', 1 ,'Eng1',2);
    insert_disciplina('INF01', 2 ,'Eng2',2);
    insert_disciplina('INF01', 3 ,'Log1',2);
    insert_disciplina('COM01', 4 ,'Ing1',1);
    insert_disciplina('COM01', 5 ,'Ing2',1);
    insert_disciplina('COM01', 6 ,'Ing3',1);
    insert_disciplina('POL01', 7 ,'Cal1',2);
    insert_disciplina('POL01', 8 ,'Cal2',2);
END;

Select * from disciplina;
    
/**INSERT TITULACAO**/       
DECLARE

BEGIN
    insert_titulacao(1,'Doutor');
    insert_titulacao(2,'Mestre');
    insert_titulacao( 3,'Coordenador');
END;

Select * From Titulacao;
        
/** INSERT Professor **/
DECLARE

BEGIN
    insert_professor(1,'INF01',1,'Antunes');
    insert_professor(2,'INF01',2,'Semaj');
    insert_professor(3,'INF01',3,'Ricardo');
    insert_professor(4,'COM01',1,'Irineu');
    insert_professor(5,'COM01',2,'Jailson');
    insert_professor(6,'COM01',3,'Mario');
    insert_professor(7,'POL01',1,'Joao');
    insert_professor(8,'POL01',2,'Marcelo');
    insert_professor(9,'POL01',3,'Manoel');
    insert_professor(10,'POL01',1,'Maria');
END;

Select * From professor;


/** INSERT Turma **/
DECLARE

BEGIN
    insert_TURMA(20021,'INF01',1,'1D',50);
    insert_TURMA(20021,'INF01',3,'1D',50);
    insert_TURMA(20021,'COM01',4,'1A',30);
    insert_TURMA(20021,'POL01',7,'1B',30);
    insert_TURMA(20022,'INF01',2,'1D',50);
    insert_TURMA(20022,'COM01',5,'1A',30);
    insert_TURMA(20022,'POL01',8,'1B',30);
    insert_TURMA(20031,'COM01',6,'1A',30);
END;

Select * from turma;


/** INSERT prof_turma**/
DECLARE

BEGIN
    insert_profturma(20021,'INF01',1,'1D',1);
    insert_profturma(20021,'INF01',3,'1D',2);
    insert_profturma(20021,'COM01',4,'1A',4);
    insert_profturma(20022,'COM01',5,'1A',5);
    insert_profturma(20031,'COM01',6,'1A',6);
    insert_profturma(20021,'POL01',7,'1B',7);
    insert_profturma(20022,'POL01',8,'1B',9);
    insert_profturma(20022,'COM01',5,'1A',1);
END;

Select * from prof_turma;


/** INSERT HORARIO**/
DECLARE

BEGIN
    insert_horario(20021,'INF01',3,'1D',3,19,43423,102,4);
	insert_horario(20021,'COM01',4,'1A',2,19,1,43981,2);  
	insert_horario(20022,'COM01',5,'1A',4,19,2,43981,2); 
	insert_horario(20031,'COM01',6,'1A',5,19,3,43981,2); 
	insert_horario(20021,'POL01',7,'1B',3,19,10,43529,4);  
	insert_horario(20022,'POL01',8,'1B',6,19,11,43529,4);  
	insert_horario(20022,'COM01',5,'1A',4,21,2,43981,2); 
END;

Select * from horario;


/** INSERT PreRequesito **/
DECLARE

BEGIN
    insert_prerequesito('INF01',1,'INF01',2);
    insert_prerequesito('COM01',4,'COM01',5);
    insert_prerequesito('COM01',5,'COM01',6);
    insert_prerequesito('POL01',7,'POL01',8);
END;

Select * from pre_req;
