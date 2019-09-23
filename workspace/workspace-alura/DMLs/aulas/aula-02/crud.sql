
/*
    Boas Práticas:
        Para que o nosso código fique independente das mudanças dos tipos de dados da tabela, podemos indicar ao PL/SQL
        para que a variável fique sempre compatível com a definição da coluna do banco, associando a variável com a coluna.
        
        Para isso, usaremos o recurso %type.
        
        Exemplo:
            v_id segmercado.id%type := 1;
            v_descricao segmercado.descricao%type;
*/

--INSERT--
DECLARE
    V_ID SEG_MERCADO.ID%TYPE := 3;
    V_DESCRICAO SEG_MERCADO.DESCRICAO%TYPE := 'esportivo';
BEGIN 
    INSERT INTO SEG_MERCADO s
    VALUES(
        V_ID,
        upper(V_DESCRICAO)
    );
    COMMIT;
END;

--UPDATE--
DECLARE
    v_id seg_mercado.id%type := 1;
    v_descricao seg_mercado.descricao%type := 'varejista';
BEGIN
    UPDATE seg_mercado s
        SET s.descricao = upper(v_descricao)
        WHERE (s.id = v_id);
    
    v_id := 2;
    v_descricao := 'atacadista';
    
    UPDATE seg_mercado s
        SET s.descricao = upper(v_descricao)
        WHERE (s.id = v_id);
    
    COMMIT;
END;

--DELETE
DECLARE
    V_ID seg_mercado.id%type := 3;    
BEGIN
    DELETE FROM SEG_MERCADO S
        WHERE (s.id = V_ID);
    
    COMMIT;
END;

SELECT * FROM seg_mercado;
