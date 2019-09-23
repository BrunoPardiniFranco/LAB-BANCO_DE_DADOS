SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE FORMATAR_CNPJ
    (p_cnpj IN OUT cliente.cnpj%type)
IS
    e_invalid_cnpj EXCEPTION;    
BEGIN
    IF GET_CNPJ_QUANTITY_CHARS(p_cnpj) THEN
        p_cnpj := SUBSTR(p_cnpj, 1, 2) || '.' || SUBSTR(p_cnpj, 3);
        p_cnpj := SUBSTR(p_cnpj, 1, 6) || '.' || SUBSTR(p_cnpj, 7);
        p_cnpj := SUBSTR(p_cnpj, 1, 10) || '/' || SUBSTR(p_cnpj, 11);
        p_cnpj := SUBSTR(p_cnpj, 1, 15) || '-'|| SUBSTR(p_cnpj, 16);
    ELSE
        RAISE e_invalid_cnpj;
    END IF;
END;


CREATE OR REPLACE FUNCTION GET_CNPJ_QUANTITY_CHARS(p_cnpj cliente.cnpj%type)
    RETURN BOOLEAN
IS
    v_numeroCaracteres NUMBER(2);
    c_qtd_cnpj_caracteres_valido CONSTANT NUMBER := 14;
BEGIN
    v_numeroCaracteres := LENGTH(p_cnpj);
    IF  v_numeroCaracteres = c_qtd_cnpj_caracteres_valido THEN
        RETURN TRUE;
    END IF;
    
    RETURN FALSE;
END;
    
--Teste da Procedure
DECLARE
    v_cnpj cliente.cnpj%type;
BEGIN
    v_cnpj := '12345678901234';
    FORMATAR_CNPJ(v_cnpj);
    dbms_output.put_line(v_cnpj);
END;
