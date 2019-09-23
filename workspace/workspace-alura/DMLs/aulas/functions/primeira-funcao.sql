/*
    FUN��ES:
        Para obtermos uma rotina que passe v�rias formas de entrada e devolva um �nico valor na sa�da, uma situa��o cl�ssica 
        implica no uso de um objeto chamado fun��o (ou function).
        
        Assim como uma procedure, uma function tamb�m � um objeto armazenado, e para executarmos, precisamos definir um
        cabe��o, o qual ser� a comunica��o desta com os usu�rios externos, e � nesse cabe�alho em que definiremos os
        par�metros de entrada, o retorno e os seus repectivos tipos:
            
            CREATE OR REPLACE FUNCTION OBTER_DESCRICAO_SEGMENTO_POR_ID
                (P_ID IN SEG_MERCADO.ID%TYPE)
                RETURN SEG_MERCADO.DESCRICAO%TYPE
                
        Ap�s compilada, a function ficar� armazenada na pasta Funcoes da conex�o.
        -----------------------------------------------------------------------------------------------------------------------                
        SELECT INTO (SELECT descricao INTO v_descricao FROM segmercado WHERE id = p_id;):
            Quando chamamos um SELECT dentro de um bloco PL/SQL, � preciso uma sintaxe espec�fica. Na verdade, ele possui um 
            objetivo diferente do que estamos acostumados, fazendo o papel de find e se posicionando em uma linha, 
            recuperando colunas para vari�veis de trabalho. Por isto, o SELECT do PL/SQL s� pode retornar uma �nica linha.

            Caso seja retornado algo diferente disto, h� erro de execu��o. Vamos estudar sua sintaxe: no c�digo, depois do 
            SELECT, est� a coluna (caso haja mais de uma, elas v�m separadas por v�rgulas), a cl�usula INTO, que indica que 
            pegaremos e salvaremos ou atribuiremos o conte�do da coluna descricao � vari�vel v_descricao.

            O restante permanece igual, com FROM e WHERE. No fim das contas, o que o SELECT faz � acessar a tabela segmercado, 
            a linha de id com o valor do par�metro, pegando a coluna descricao e salvando seu valor na vari�vel v_descricao.
        -----------------------------------------------------------------------------------------------------------------------
*/

CREATE OR REPLACE FUNCTION OBTER_DESCRICAO_SEGMENTO
    (P_ID IN SEG_MERCADO.ID%type)
    RETURN SEG_MERCADO.DESCRICAO%type
IS
    v_descricao SEG_MERCADO.DESCRICAO%type;
BEGIN
    SELECT S.DESCRICAO INTO v_descricao
        FROM seg_mercado S
        WHERE (S.ID = P_ID);
        
    RETURN v_descricao;
END;

SET SERVEROUTPUT ON
DECLARE
    v_descricao seg_mercado.descricao%type;
BEGIN
    v_descricao := obter_descricao_segmento(2);
    dbms_output.put_line('Descricao: '||v_descricao);
END;


