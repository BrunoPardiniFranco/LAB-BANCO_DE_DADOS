-- Controle de transação

	SET AUTOCOMMIT=0; -- Desabilita o commit automatico

	start transaction; -- Inicia a transação
	update professor set NomeProf = 'Ricardo' where CodProf = 1;
	-- obs.: Esta transação não sera realizada até a execução do comando commit

	commit; -- realiza o commit
    
    -- http://ftp.nchu.edu.tw/MySQL/doc/refman/4.1/pt/commit.html

-- Exercicios de SQL - parte 2

/*
	1. Obter os nomes docentes cuja titulação tem código diferente de 3.  
*/

delimiter // -> Este delimeter serve pra demarcar o fim da procedure
create procedure proc_1_2()
begin

	declare nome_prof varchar(50);
    
    declare done int default false;
    
	abaixo declaro a query que gerará o resultado o qual o cursor irá apontar
    declare c cursor for (select NomeProf from Professor where CodTit <> 3);
    
    DECLARE CONTINUE handler FOR NOT found SET done = TRUE; -> Se não encontrar nenhum registro eu seto done pra true pra n entrar no laço
    
    open c;
    
	abaixo crio uma tabela temporária para inserir o resultado da query acima
    create temporary table nomeProfs (
		nome_prof varchar(50)
    );
    posso declarar o laço com marcações igual abaixo com while, exemplo:
		while done <> true
		
		end while
		
    read_loop : LOOP
    
		pego o conteúdo para navegar por meio do cursor
		fetch c into nome_prof;
        
        if done then
			leave read_loop;
        end if;
        
        insert into nomeProfs values(nome_prof);
    
    END LOOP;
    
	select * from nomeProfs;
    
    close c;
    
    drop temporary table nomeProfs;

end //




