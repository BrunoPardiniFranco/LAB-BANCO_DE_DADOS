/*
    Obter os códigos dos professores que são do departamento de código 'INF01' e
    que ministraram ao menos uma turma em 2002/1.
*/

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE EX_02
IS
    CURSOR cur_prof IS
        SELECT professor.cod_prof, professor.nome_prof FROM professor
            JOIN prof_turma ON professor.cod_prof = prof_turma.cod_prof
                AND prof_turma.cod_depto = 'INF01' AND prof_turma.ano_sem = 20021;
BEGIN
    FOR prof_reg in cur_prof  LOOP
        DBMS_OUTPUT.PUT_LINE('Código PROFESSOR: ' || prof_reg.cod_prof || ' Nome PROFESSOR: ' || prof_reg.nome_prof);
    END LOOP;
END;

EXECUTE EX_02;

SELECT *FROM DEPTO;
SELECT * FROM professor WHERE cod_depto = 'INF01';
SELECT * FROM prof_turma WHERE cod_depto = 'INF01';