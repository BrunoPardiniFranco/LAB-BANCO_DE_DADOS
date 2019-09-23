/*
    Obter os códigos dos diferentes departamentos que tem turmas no ano-semestre 2002/1 
*/
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE EX_01
    (p_ano_sem turma.ano_sem%type)
IS  
    CURSOR cur_depto IS
        SELECT DISTINCT depto.cod_depto, depto.nome_depto FROM DEPTO
            JOIN DISCIPLINA ON depto.cod_depto = disciplina.cod_depto
                JOIN TURMA ON disciplina.cod_depto = turma.cod_depto and turma.ano_sem = p_ano_sem;
BEGIN
    FOR depto_reg IN cur_depto LOOP
        DBMS_OUTPUT.PUT_LINE('Código depto: ' || depto_reg.cod_depto || ' Nome depto: ' || depto_reg.nome_depto);
    END LOOP;
END;

EXEC ex_01(20031);

SELECT DISTINCT depto.cod_depto, depto.nome_depto FROM DEPTO
            JOIN DISCIPLINA ON depto.cod_depto = disciplina.cod_depto
                JOIN TURMA ON disciplina.cod_depto = turma.cod_depto and turma.ano_sem = 20021;
                


