/*
    SET:
        O SET nos permite alterar o valor de vari�veis de ambiente deste bloco. Para exibirmos a sa�da do console por meio do
        m�todo put_line() do pacote dbms_output, devemos setar o valor da vari�vel SERVEROUTPUT para ON
    
    Palavras chaves de um bloco PL/SQL: DECLARE, BEGIN, END.
        DECLARE � palavra chave que come�a a se��o de declara��o das vari�veis do bloco;
        BEGIN � palavra chave que come�a a se��o de execu��o de comandos;
        END � palavra chave que termina o bloco PL/SQL.
    
    DECLARE ... BEGIN:
        Entre o DECLARE e o BEGIN escrevemos as defini��es dos componentes de trabalho, ou seja, de vari�veis, constantes, e de
        qualquer outro elemento que venha a ser utilizado entre o BEGIN e o END do bloco.
    
    BEGIN ... END:
        � o trecho onde de fato definimos as instru��es do nosso programa.
        
    Cara, lembre-se das aulas do Satoshi Sensei, do Pseudo-C�digo. Sempre come��vamos com o DECLARAR, INICIO, FIM:
    
    EXERCICIO-01-AREA-QUADRADO
    .
    DECLARAR
        lado, area: int;
    INICIO
        ler(lado);
        area = lado * lado;
        mostrar("A �rea do quadrado de lado " + lado + " �: " + area);
    FIM;
*/

SET SERVEROUTPUT ON 

DECLARE
    V_ID NUMBER(5);
BEGIN
    V_ID := 9;
    
    DBMS_OUTPUT.put_line('HELLO WORLD!');
    DBMS_OUTPUT.PUT_LINE(concat('N�mero da sorte: ', v_id));
END;