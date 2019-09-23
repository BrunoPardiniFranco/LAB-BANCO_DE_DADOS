/*
    Para termos uma Storage Procedure, devemos definir o cabe�alho da procedure antes do BEGIN, para que desta forma,
    ela ppossa ser invocada de uma fonte externa, como uma aplica��o java, javascript, python, etc. Esta parte inicial,
    com o nome da procedure e lista de par�metros � a parte de comunica��o, ou seja, o que eu, como usu�rio da procedure,
    preciso saber para fazer a sua execu��o.
    
    Para criarmos de fato uma procedure, precisamos usar a palavra reservada CREATE - a qual cria um dado objeto -, logo
    ap�s, PROCEDURE (o qual � o objeto que devemos criar), o nome da procedure e os seus argumetos envolvidos por par�nteses,
    se houver algum.  Exemplo:
    
    CREATE PROCEDURE INCLUIR-SEGMENTO
        (p_descricao IN Varchar2(50))
    IS
        ...
    BEGIN
        ...
    END;
    
    ----------------------------------------------------------------------------------------------------------------
    Palavra Reservada IN:
        . O IN define que aquela vari�vel � um par�metro de entrada da fun��o;
        
        . Podemos passar um valor para o par�metro IN de maneira posicional e nominal. Exemplo:
            Forma posicional: execute procedure_x(1, 'a');
            Forma Nominal: execute procedure_x(p_id => 1, p_nome => 'a');
            
        . Dentro da procedure, o seu valor n�o pode ser modificado, sendo acess�vel apenas para leitura;
        
        . Se na declara��o omitirem o modo de passagem do par�metro, o modo padr�o ser� IN
    ----------------------------------------------------------------------------------------------------------------
    
    ----------------------------------------------------------------------------------------------------------------
    Palavra Reservada IS -> Respons�vel por abrir a sess�o de defini��o dos componentes de trabalho desta procedure, sendo
                            esta sess�o finalizada com a palavra reservada BEGIN. Mesmo que n�o declaremos nada,
                            o IS � uma palavra chave obrigat�ria.
    ----------------------------------------------------------------------------------------------------------------
    
    Para que a procedure seja de fato compilada e armazenada, devemos selecion�-la e executar. Mesmo que apresente erros de 
    compila��o, a procedure � armazenada no banco de dados.
    
    Ap�s compilada e armazenada, temos duas formas de chamar uma Storage Procedure: uma com a palavra reservada
    EXECUTE e a outra declarando um bloco com BEGIN e END e dentro desta se��o, chamamos o nome da procedure passando
    os argumentos, caso seja necess�rio:
    
    1� Forma:
        EXECUTE PROCEDURE_X();
        
    2� Forma:
        BEGIN
            PROCEDURE_X();
        END; 
    
    Ap�s compilada, a procedure ficar� armazenada na pasta Procedures da conex�o.
    
    IMPORTANTE: 
        SEMPRE CRIAR UMA PROCEDURE/FUNCTION COM A SEGUINTE CL�USULA: CREATE OR REPLACE PROCEDURE X
        
        MOTIVO: O NOME DE UMA PROCEDURE PRECISA SER �NICO, UMA VEZ QUE ESTA � COMPILADA. ESCREVENDO APENAS CREATE PROCEDURE,
        O COMPILADAR TENTAR� CRIAR UMA NOVA PROCEDURE. CASO HAJA ALGUMA COM O MESMO NOME, TEREMOS UM PROBLEMA DE COMPILA��O,
        NOS IMPOSSIBILITANDO ALTERAR UMA PROCEDURE/FUNCTION CRIADA ANTERIORMENTE.
        
        PARA CONTORNAR ESTA QUEST�O, TEMOS AS PALAVRAS-CHAVE OR REPLACE, AS QUAIS, NO MOMENTO DE COMPILA��O, INDICAR�O AO
        COMPILADOR SUBSTITUIR UMA DADA PROCEDURE/FUNCTION CASO J� EXISTA ALGUMA COM AQUELE NOME.
*/

-- PROCEDURE PARA INCLUIR UM SEGMENTO

CREATE OR REPLACE PROCEDURE INCLUIR_SEGMENTO 
    (p_id seg_mercado.id%type, p_segmento seg_mercado.descricao%type)
IS

BEGIN
    INSERT INTO SEG_MERCADO
    VALUES(p_id, upper(p_segmento));
    
    COMMIT;
END;

EXECUTE incluir_segmento(3, 'farmac�utico');
EXECUTE incluir_segmento(4, 'iNdUstrial');

SELECT * FROM seg_mercado;