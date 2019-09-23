/*
    SET:
        O SET nos permite alterar o valor de variáveis de ambiente deste bloco. Para exibirmos a saída do console por meio do
        método put_line() do pacote dbms_output, devemos setar o valor da variável SERVEROUTPUT para ON
    
    Palavras chaves de um bloco PL/SQL: DECLARE, BEGIN, END.
        DECLARE é palavra chave que começa a seção de declaração das variáveis do bloco;
        BEGIN é palavra chave que começa a seção de execução de comandos;
        END é palavra chave que termina o bloco PL/SQL.
    
    DECLARE ... BEGIN:
        Entre o DECLARE e o BEGIN escrevemos as definições dos componentes de trabalho, ou seja, de variáveis, constantes, e de
        qualquer outro elemento que venha a ser utilizado entre o BEGIN e o END do bloco.
    
    BEGIN ... END:
        É o trecho onde de fato definimos as instruções do nosso programa.
        
    Cara, lembre-se das aulas do Satoshi Sensei, do Pseudo-Código. Sempre começávamos com o DECLARAR, INICIO, FIM:
    
    EXERCICIO-01-AREA-QUADRADO
    .
    DECLARAR
        lado, area: int;
    INICIO
        ler(lado);
        area = lado * lado;
        mostrar("A área do quadrado de lado " + lado + " é: " + area);
    FIM;
*/

SET SERVEROUTPUT ON 

DECLARE
    V_ID NUMBER(5);
BEGIN
    V_ID := 9;
    
    DBMS_OUTPUT.put_line('HELLO WORLD!');
    DBMS_OUTPUT.PUT_LINE(concat('Número da sorte: ', v_id));
END;