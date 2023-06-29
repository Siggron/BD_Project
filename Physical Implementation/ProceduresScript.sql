-- Procedimento para registar um novo cliente
DELIMITER $$
CREATE PROCEDURE RegistarCliente(
    IN nome VARCHAR(50),
    IN data_nascimento DATE,
    IN emails VARCHAR(255),
    IN contactos VARCHAR(255)
)
BEGIN
    DECLARE novoClienteID INT;
    DECLARE email VARCHAR(50);
    DECLARE contacto INT;

    -- Obter o ID do novo cliente a inserir
    SELECT MAX(ID_Cliente) + 1 INTO novoClienteID FROM Cliente;
    IF novoClienteID IS NULL THEN
        SET novoClienteID = 1;
    END IF;
    
    -- Inserir o novo cliente na tabela Cliente
    INSERT INTO Cliente (ID_Cliente, Nome, Data_Nasc)
    VALUES (novoClienteID, nome, data_nascimento);

    -- Inserir os emails do cliente, se fornecidos
    WHILE LENGTH(emails) > 0 DO
        SET email = SUBSTRING_INDEX(emails, ',', 1);
        INSERT INTO ClienteEmail (ID_Cliente, Email) VALUES (novoClienteID, email);
        SET emails = SUBSTRING(emails, LENGTH(email) + 2);
    END WHILE;

    -- Inserir os contactos do cliente, se fornecidos
    WHILE LENGTH(contactos) > 0 DO
        SET contacto = CAST(SUBSTRING_INDEX(contactos, ',', 1) AS UNSIGNED);
        INSERT INTO ClienteContacto (ID_Cliente, Contacto) VALUES (novoClienteID, contacto);
        SET contactos = SUBSTRING(contactos, LENGTH(contacto) + 2);
    END WHILE;

END $$
DELIMITER ;

-- Procedimento para registar um novo jogo
DELIMITER $$
CREATE PROCEDURE RegistarJogo(
    IN nome VARCHAR(50),
    IN esrb VARCHAR(8),
    IN plataforma VARCHAR(20),
    IN publicadora VARCHAR(30),
    IN ano_lanc INT,
    IN preço DECIMAL(5, 2),
    IN qtd INT,
    IN generos VARCHAR(255),
    IN desenvolvedores VARCHAR(255)
)
BEGIN
    DECLARE novoJogoID INT;
    DECLARE genero VARCHAR(50);
    DECLARE desenvolvedor VARCHAR(50);
    
    -- Obter o ID do novo jogo a ser inserido
    SELECT MAX(ID_Jogo) + 1 INTO novoJogoID FROM Jogo;
    IF novoJogoID IS NULL THEN
        SET novoJogoID = 1;
    END IF;
    
    -- Inserir o novo jogo na tabela Jogo
    INSERT INTO Jogo (ID_Jogo, Nome, ESRB, Plataforma, Publicadora, Ano_Lanc, Preço, Qtd)
    VALUES (novoJogoID, nome, esrb, plataforma, publicadora, ano_lanc, preço, qtd);
    
    -- Inserir os géneros do jogo, se fornecidos
    WHILE LENGTH(generos) > 0 DO
        SET genero = SUBSTRING_INDEX(generos, ',', 1);
        INSERT INTO Jogo_Géneros (ID_Jogo, Género) VALUES (novoJogoID, genero);
        SET generos = SUBSTRING(generos, LENGTH(genero) + 2);
    END WHILE;
    
    -- Inserir os desenvolvedores do jogo, se fornecidos
    WHILE LENGTH(desenvolvedores) > 0 DO
        SET desenvolvedor = SUBSTRING_INDEX(desenvolvedores, ',', 1);
        INSERT INTO Jogo_Desenvolvedores (ID_Jogo, Desenvolvedor) VALUES (novoJogoID, desenvolvedor);
        SET desenvolvedores = SUBSTRING(desenvolvedores, LENGTH(desenvolvedor) + 2);
    END WHILE;
    
END $$
DELIMITER ;

-- -------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE RegistarTransacao(
    IN data_transac DATE,
    IN id_cliente INT,
    IN id_colab INT,
    IN jogos_qtd VARCHAR(255), -- "id_jogo1,qtd1;id_jogo2,qtd2;(...);id_jogoN,qtdN;"
    IN tipo CHAR(1)
)
BEGIN
    DECLARE novoNumTransac INT;
    DECLARE operacao INT;

    -- Obter o novo número de transação
    SELECT MAX(Num_Transac) + 1 INTO novoNumTransac FROM Transação;
    IF novoNumTransac IS NULL THEN
        SET novoNumTransac = 1;
    END IF;
    
    -- Define a operação a ser realizada na tabela Jogo com base no tipo de transação
    IF tipo = 'C' THEN
        SET operacao = 1; -- Adicionar à Qtd_Disponivel
    ELSEIF tipo = 'V' THEN
        SET operacao = -1; -- Subtrair da Qtd_Disponivel
    END IF;
    
    -- Insere um registo inicial na tabela Transação
    INSERT INTO Transação (Num_Transac, Data_Transac, Qtd, Valor_Total, Tipo, ID_Cliente, ID_Colab)
    VALUES (novoNumTransac, data_transac, 0, 0, tipo, id_cliente, id_colab);
    
    -- Percorre os jogos e suas quantidades na string jogos_qtd
    WHILE LENGTH(jogos_qtd) > 0 DO
        -- Extrai o id_jogo e a qtd para o jogo atual                           - ""
        SET @jogo_qtd := SUBSTRING_INDEX(jogos_qtd, ';', 1);
        SET @id_jogo := SUBSTRING_INDEX(@jogo_qtd, ',', 1);
        SET @qtd := SUBSTRING_INDEX(@jogo_qtd, ',', -1);
        
        -- Obtém o preço do jogo da tabela Jogo
        SET @preco := (SELECT Preço FROM Jogo WHERE id_jogo = @id_jogo);
        
        -- Calcula o valor total para o jogo atual
        SET @valor_total := @qtd * @preco;
        
        -- Insere um registo na tabela TransaçãoContem
        INSERT INTO TransaçãoContem (Num_Transac, id_jogo, qtd, valor_total)
        VALUES (novoNumTransac, @id_jogo, @qtd, @valor_total);
        
        -- Atualiza a quantidade disponível em stock na tabela Jogo
        UPDATE Jogo
        SET Qtd = Qtd + (@qtd * operacao)
        WHERE ID_Jogo = @id_jogo;
        
        -- Remove o jogo processado da string jogos_qtd
        SET jogos_qtd := REPLACE(jogos_qtd, CONCAT(@jogo_qtd, ';'), '');
    END WHILE;

    -- Calcula o qtdtotal e valor_total para a transação
    SELECT SUM(qtd) INTO @qtdtotal FROM TransaçãoContem WHERE Num_Transac = novoNumTransac;
    SELECT SUM(valor_total) INTO @valor_total FROM TransaçãoContem WHERE Num_Transac = novoNumTransac;
    
    -- Atualiza o registo inicial na tabela Transacao
    UPDATE Transação
    SET Qtd = @qtdtotal, Valor_Total = @valor_total
    WHERE Num_Transac = novoNumTransac;

    -- Faz o commit para salvar as alterações
    COMMIT;
    
END $$
DELIMITER ;

-- SELECT tc.Num_Transac, t.Tipo, tc.ID_Jogo, tc.Qtd, tc.Valor_Total, t.Qtd AS QtdGlobal, t.Valor_Total AS Valor_Global
-- 	FROM TransaçãoContem tc
--     JOIN Transação t ON tc.Num_Transac = t.Num_Transac;
     
-- SELECT *
-- 	FROM Transação;
    
-- DROP PROCEDURE RegistarTransacao;
    
-- CALL RegistarTransacao('2023-03-14', 1, 2, '1,2;3,1;4,3;', 'C');

-- DELETE FROM TransaçãoContem WHERE Num_Transac > 10;

