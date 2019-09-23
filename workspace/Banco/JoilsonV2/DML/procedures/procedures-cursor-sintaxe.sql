--============================================================================================================
--ORACLE CURSOR-PROCEDURE
--============================================================================================================
CREATE PROCEDURE EMP_CURSOR
IS
    CURSOR C1 IS
        SELECT COD-DEPTO, NOME-DEPTO FROM DEPTO;
        wCod varchar(40);
        wNome varchar(25);
BEGIN
    OPEN C1;
    FETCH C1 INTO wCod, wNome; //VERIFICA SE ENCOUTROU O PRIMEIRO
    
    WHILE C1% FOUND LOOP
        DBMS_OUTPUT.PUTLINE('O CÓDIGO É ' || wCod || ' E O NOME É ' || wNome);
        FETCH C1 INTO wCod, wNome;
    END LOOP;
    CLOSE C1;
END;