/*
    Para termos uma Storage Procedure, devemos definir o cabeçalho da procedure antes do BEGIN, para que desta forma,
    ela ppossa ser invocada de uma fonte externa, como uma aplicação java, javascript, python, etc. Esta parte inicial,
    com o nome da procedure e lista de parâmetros é a parte de comunicação, ou seja, o que eu, como usuário da procedure,
    preciso saber para fazer a sua execução.
    
    Para criarmos de fato uma procedure, precisamos usar a palavra reservada CREATE - a qual cria um dado objeto -, logo
    após, PROCEDURE (o qual é o objeto que devemos criar), o nome da procedure e os seus argumetos envolvidos por parênteses,
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
        . O IN define que aquela variável é um parâmetro de entrada da função;
        
        . Podemos passar um valor para o parâmetro IN de maneira posicional e nominal. Exemplo:
            Forma posicional: execute procedure_x(1, 'a');
            Forma Nominal: execute procedure_x(p_id => 1, p_nome => 'a');
            
        . Dentro da procedure, o seu valor não pode ser modificado, sendo acessível apenas para leitura;
        
        . Se na declaração omitirem o modo de passagem do parâmetro, o modo padrão será IN
    ----------------------------------------------------------------------------------------------------------------
    
    ----------------------------------------------------------------------------------------------------------------
    Palavra Reservada IS -> Responsável por abrir a sessão de definição dos componentes de trabalho desta procedure, sendo
                            esta sessão finalizada com a palavra reservada BEGIN. Mesmo que não declaremos nada,
                            o IS é uma palavra chave obrigatória.
    ----------------------------------------------------------------------------------------------------------------
    
    Para que a procedure seja de fato compilada e armazenada, devemos selecioná-la e executar. Mesmo que apresente erros de 
    compilação, a procedure é armazenada no banco de dados.
    
    Após compilada e armazenada, temos duas formas de chamar uma Storage Procedure: uma com a palavra reservada
    EXECUTE e a outra declarando um bloco com BEGIN e END e dentro desta seção, chamamos o nome da procedure passando
    os argumentos, caso seja necessário:
    
    1º Forma:
        EXECUTE PROCEDURE_X();
        
    2º Forma:
        BEGIN
            PROCEDURE_X();
        END; 
    
    Após compilada, a procedure ficará armazenada na pasta Procedures da conexão.
    
    IMPORTANTE: 
        SEMPRE CRIAR UMA PROCEDURE/FUNCTION COM A SEGUINTE CLÁUSULA: CREATE OR REPLACE PROCEDURE X
        
        MOTIVO: O NOME DE UMA PROCEDURE PRECISA SER ÚNICO, UMA VEZ QUE ESTA É COMPILADA. ESCREVENDO APENAS CREATE PROCEDURE,
        O COMPILADAR TENTARÁ CRIAR UMA NOVA PROCEDURE. CASO HAJA ALGUMA COM O MESMO NOME, TEREMOS UM PROBLEMA DE COMPILAÇÃO,
        NOS IMPOSSIBILITANDO ALTERAR UMA PROCEDURE/FUNCTION CRIADA ANTERIORMENTE.
        
        PARA CONTORNAR ESTA QUESTÃO, TEMOS AS PALAVRAS-CHAVE OR REPLACE, AS QUAIS, NO MOMENTO DE COMPILAÇÃO, INDICARÃO AO
        COMPILADOR SUBSTITUIR UMA DADA PROCEDURE/FUNCTION CASO JÁ EXISTA ALGUMA COM AQUELE NOME.
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

EXECUTE incluir_segmento(3, 'farmacêutico');
EXECUTE incluir_segmento(4, 'iNdUstrial');

SELECT * FROM seg_mercado;