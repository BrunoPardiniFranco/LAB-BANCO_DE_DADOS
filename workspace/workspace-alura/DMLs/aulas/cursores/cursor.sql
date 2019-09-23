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