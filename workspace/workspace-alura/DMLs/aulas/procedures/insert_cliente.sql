CREATE OR REPLACE PROCEDURE Incluir_Cliente(
    p_id IN cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_cnpj IN cliente.cnpj%type,
    p_seg_mercado_id IN cliente.seg_mercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type
)
IS
    v_cnpj cliente.cnpj%type;
BEGIN
    v_cnpj := p_cnpj;
    FORMATAR_CNPJ(v_cnpj);
    INSERT INTO cliente
    VALUES (p_id, upper(p_razao_social), v_cnpj, p_seg_mercado_id,
            SYSDATE, p_faturamento_previsto, determinar_categoria(p_faturamento_previsto) );
    COMMIT;
END;

CREATE OR REPLACE FUNCTION DETERMINAR_CATEGORIA(p_faturamento_previsto IN cliente.faturamento_previsto%type) 
    RETURN cliente.categoria%type
IS
    v_categoria cliente.categoria%type;
BEGIN
    IF p_faturamento_previsto < 10000 THEN
        v_categoria := 'PEQUENO';
    ELSIF p_faturamento_previsto < 50000 THEN
        v_categoria := 'MEDIO';
    ELSIF p_faturamento_previsto < 100000 THEN
        v_categoria := 'MEDIO GRANDE';
    ELSE
        v_categoria := 'GRANDE';
    END IF;
    
    RETURN v_categoria;
END;

EXECUTE incluir_cliente(5, 'SuperMercado haha', '12312312312312', NULL, 4999);
 
SELECT * FROM CLIENTE;