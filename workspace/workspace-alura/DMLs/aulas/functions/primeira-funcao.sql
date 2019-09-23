/*
    FUNÇÕES:
        Para obtermos uma rotina que passe várias formas de entrada e devolva um único valor na saída, uma situação clássica 
        implica no uso de um objeto chamado função (ou function).
        
        Assim como uma procedure, uma function também é um objeto armazenado, e para executarmos, precisamos definir um
        cabeção, o qual será a comunicação desta com os usuários externos, e é nesse cabeçalho em que definiremos os
        parâmetros de entrada, o retorno e os seus repectivos tipos:
            
            CREATE OR REPLACE FUNCTION OBTER_DESCRICAO_SEGMENTO_POR_ID
                (P_ID IN SEG_MERCADO.ID%TYPE)
                RETURN SEG_MERCADO.DESCRICAO%TYPE
                
        Após compilada, a function ficará armazenada na pasta Funcoes da conexão.
        -----------------------------------------------------------------------------------------------------------------------                
        SELECT INTO (SELECT descricao INTO v_descricao FROM segmercado WHERE id = p_id;):
            Quando chamamos um SELECT dentro de um bloco PL/SQL, é preciso uma sintaxe específica. Na verdade, ele possui um 
            objetivo diferente do que estamos acostumados, fazendo o papel de find e se posicionando em uma linha, 
            recuperando colunas para variáveis de trabalho. Por isto, o SELECT do PL/SQL só pode retornar uma única linha.

            Caso seja retornado algo diferente disto, há erro de execução. Vamos estudar sua sintaxe: no código, depois do 
            SELECT, está a coluna (caso haja mais de uma, elas vêm separadas por vírgulas), a cláusula INTO, que indica que 
            pegaremos e salvaremos ou atribuiremos o conteúdo da coluna descricao à variável v_descricao.

            O restante permanece igual, com FROM e WHERE. No fim das contas, o que o SELECT faz é acessar a tabela segmercado, 
            a linha de id com o valor do parâmetro, pegando a coluna descricao e salvando seu valor na variável v_descricao.
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


