SET SERVEROUTPUT ON 

CREATE OR REPLACE PROCEDURE UPDATE_SEG_MERCADO_ID(
    p_id_cliente IN cliente.id%type,
    p_seg_mercado_id IN SEG_MERCADO.ID%type)
IS

BEGIN
    UPDATE CLIENTE C
        SET C.SEG_MERCADO_ID = p_seg_mercado_id
        WHERE (C.ID = p_id_cliente) ;
END;

-- Usando LOOP BÁSICO
/*
    LOOP
        comando;
        comando;
        
        EXIT WHEN <CONDICAO>;
    END LOOP´;
*/
DECLARE
    v_id_cliente cliente.id%type := 1;
    v_id_segmento_mercado cliente.seg_mercado_id%type := 1;
BEGIN
    LOOP
        UPDATE_SEG_MERCADO_ID( v_id_cliente, v_id_segmento_mercado);
        v_id_cliente := v_id_cliente + 1;
        EXIT WHEN v_id_cliente > 5;
    END LOOP;
    COMMIT;
END;

SELECT * FROM CLIENTE;
-- Usando WHILE 
/*
    WHILE <CONDICOES> LOOP
        comando;
        comando;
        comando;
    END LOOP;
*/

DECLARE
    v_id_cliente cliente.id%type := 1;
    v_id_segmento_mercado cliente.seg_mercado_id%type := 2;
BEGIN
    WHILE (v_id_cliente <= 5) LOOP
        UPDATE_SEG_MERCADO_ID( v_id_cliente, v_id_segmento_mercado );
        v_id_cliente := v_id_cliente + 1;
    END LOOP;
END;

SELECT * FROM CLIENTE;
-- USANDO FOR

/*
    FOR i IN 1..10 LOOP
        comando;
        comando;
        comando;
    END LOOP;
*/

DECLARE
    v_id_cliente cliente.id%type := 1;
    v_id_segmento_mercado cliente.seg_mercado_id%type := 3;
BEGIN
    FOR i IN 1..5 LOOP
        UPDATE_SEG_MERCADO_ID( v_id_cliente, v_id_segmento_mercado );
        v_id_cliente := v_id_cliente + 1;
    END LOOP;
END;

SELECT * FROM CLIENTE;

-- USANDO CURSOR

DECLARE
    CURSOR C1 IS
        SELECT c.id FROM CLIENTE C;
        w_cliente_id cliente.id%type;
BEGIN
    OPEN C1;
    
    WHILE C1% FOUND LOOP
        FETCH C1 INTO w_cliente_id;
        EXIT WHEN C1%NOTFOUND;
        update_seg_mercado_id(w_cliente_id, 3);
    END LOOP;
    CLOSE C1;
    COMMIT;
END;

DECLARE 
    v_id_segmento_mercado cliente.seg_mercado_id%type := 4;
    CURSOR cur_cliente IS
        SELECT ID
        FROM CLIENTE;
BEGIN
    FOR cli_reg IN cur_cliente LOOP
        update_seg_mercado_id(cli_reg.id, v_id_segmento_mercado);
    END LOOP;
    COMMIT;
END;

SELECT * FROM CLIENTE;
SELECT * FROM seg_mercado;