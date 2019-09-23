/*
    Obter os horários de aula (dia da semana,hora inicial e número de horas
    ministradas) do professor "Antunes" em 20021. 
*/

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE EX_03
IS
    CURSOR cur_horario IS
        SELECT DISTINCT HORARIO.dia_sem, HORARIO.hora_inicio, HORARIO.NUM_HORAS FROM HORARIO
            JOIN TURMA ON horario.ano_sem = turma.ano_sem AND horario.cod_depto = turma.cod_depto
                    AND horario.num_disc = turma.num_disc AND horario.sigla_turma = turma.sigla_turma 
                        AND turma.ano_sem = 20021
                JOIN PROF_TURMA ON turma.ano_sem = prof_turma.ano_sem AND turma.cod_depto = prof_turma.cod_depto
                        AND turma.num_disc = prof_turma.num_disc AND turma.sigla_turma = prof_turma.sigla_turma
                     JOIN professor ON prof_turma.cod_prof = professor.cod_prof AND UPPER(professor.nome_prof) = 'ANTUNES';
BEGIN
    FOR reg_horario in cur_horario LOOP
        DBMS_OUTPUT.PUT_LINE('DIA SEMANA: ' || reg_horario.dia_sem || ' HORA INICIAL: ' || reg_horario.hora_inicio || ' NUMERO HORAS: ' || reg_horario.NUM_HORAS);
    END LOOP;
END;

EXECUTE ex_03;

SELECT * FROM PROFESSOR; -- 1	INF01	1	Antunes
SELECT * FROM prof_turma; -- 20021	INF01	1	1D	1 AND 20022 COM01	5	1A	1
SELECT * FROM TURMA; -- 20021	INF01	1	1D	50 AND 20022	COM01	5	1A	30
SELECT * FROM HORARIO;

SELECT  HORARIO.dia_sem, HORARIO.hora_inicio, HORARIO.NUM_HORAS FROM HORARIO
            JOIN TURMA ON horario.ano_sem = turma.ano_sem AND horario.cod_depto = turma.cod_depto
                    AND horario.num_disc = turma.num_disc AND horario.sigla_turma = turma.sigla_turma 
                        AND turma.ano_sem = 20021
                JOIN PROF_TURMA ON turma.ano_sem = prof_turma.ano_sem AND turma.cod_depto = prof_turma.cod_depto
                        AND turma.num_disc = prof_turma.num_disc AND turma.sigla_turma = prof_turma.sigla_turma
                     JOIN professor ON prof_turma.cod_prof = professor.cod_prof AND UPPER(professor.nome_prof) = 'ANTUNES';
                     
SELECT  HORARIO.dia_sem, HORARIO.hora_inicio, HORARIO.NUM_HORAS FROM HORARIO
            JOIN TURMA ON horario.ano_sem = turma.ano_sem AND horario.cod_depto = turma.cod_depto
                    AND horario.num_disc = turma.num_disc AND horario.sigla_turma = turma.sigla_turma 
                        AND turma.ano_sem = 20021;