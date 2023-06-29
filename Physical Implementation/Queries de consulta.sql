-- listar jogos em stock
DELIMITER $$
CREATE PROCEDURE StockJogos()
BEGIN
	SELECT *
	FROM Jogo
    WHERE Jogo.Qtd > 0;
END $$
DELIMITER ;

-- CALL StockJogos();

-- Consultar a quantidade e valor total transacionados associados a um número de transação e nome do jogo dados
DELIMITER $$
CREATE PROCEDURE QtdETotalTransacionados(IN num_transac INT, IN nome VARCHAR(50))
BEGIN
	SELECT TC.Qtd, TC.Valor_Total
    FROM TransaçãoContem TC
    INNER JOIN Jogo J ON TC.ID_Jogo = J.ID_Jogo
    WHERE TC.Num_Transac = num_transac
    AND J.Nome = nome;
END $$
DELIMITER ;

-- Obter a média dos preços dos jogos que foram lançados em um dado ano para uma dada plataforma
-- DELIMITER $$
-- CREATE PROCEDURE MediaPrecosJogosAnoLancEPlataforma(IN ano_lanc INT, IN plataforma VARCHAR(20))
-- BEGIN
-- 	DECLARE vMediaPrecos DECIMAL(5,2);
--     
--    SELECT AVG(Preço) INTO vMediaPrecos
--    FROM Jogo J
--    WHERE J.Ano_Lanc = ano_lanc AND J.Plataforma = plataforma;
--    
--    SELECT vMediaPrecos AS MediaPrecos;
-- END $$
-- DELIMITER ;
-- OUUUUUUUU
DELIMITER $$
CREATE FUNCTION MediaPrecosJogosAnoLancEPlataforma(ano_lanc INT, plataforma VARCHAR(20))
	RETURNS FLOAT DETERMINISTIC
BEGIN
    RETURN (SELECT AVG(J.Preço)
		FROM Jogo J
		WHERE J.Ano_Lanc = ano_lanc AND J.Plataforma = plataforma);
END $$
DELIMITER ;

SELECT MediaPrecosJogosAnoLancEPlataforma(2015, 'PC');

-- Obter a lista de jogos (com nome, plataforma e quantidade de transação) transacionados por um dado cliente
DELIMITER $$
CREATE PROCEDURE ObterListaJogosTransacionados(IN cliente_id INT)
BEGIN
    SELECT J.Nome, J.Plataforma, TC.Qtd
    FROM Jogo J
    JOIN TransaçãoContem TC ON J.ID_Jogo = TC.ID_Jogo
    JOIN Transação T ON TC.Num_Transac = T.Num_Transac
    WHERE T.ID_Cliente = cliente_id;
END $$
DELIMITER ;

-- Obter nomes dos clientes que compraram jogos cujo preço é maior do que um valor dado
DELIMITER $$
CREATE PROCEDURE ObterClientesComJogosAcimaDoPreco(IN preco_limite DECIMAL(5,2))
BEGIN
    SELECT DISTINCT C.Nome
    FROM Cliente C
    JOIN Transação T ON C.ID_Cliente = T.ID_Cliente
    JOIN TransaçãoContem TC ON T.Num_Transac = TC.Num_Transac
    JOIN Jogo J ON TC.ID_Jogo = J.ID_Jogo
    WHERE J.Preço > preco_limite AND T.Tipo = 'V';
END $$
DELIMITER ;

-- Ver historico de transacoes de um cliente num intervalo de tempo, por ordem do mais recente para o mais antigo
DELIMITER $$
CREATE PROCEDURE historico_transacao(IN ID_Cliente INT,IN Data_inicio DATETIME,IN Data_fim DATETIME)
BEGIN
    SELECT *
    FROM Transação as t
    WHERE t.ID_Cliente = ID_Cliente AND t.Data_Transac >= Data_inicio AND t.Data_Transac <= Data_fim
    ORDER BY t.Data_Transac DESC;
END $$
DELIMITER ;

-- Listar as 10 transações com valor total mais elevado
DELIMITER $$
CREATE PROCEDURE Top10Transacoes()
BEGIN
    SELECT T.Valor_Total, T.Tipo, T.Num_Transac, C.ID_Cliente
        FROM Transação AS T INNER JOIN Cliente AS C
            ON T.ID_Cliente=C.ID_Cliente
        ORDER BY Valor_Total DESC
        LIMIT 10;
END $$
DELIMITER ;

-- Listar os 10 jogos mais vendidos da loja
DELIMITER $$
CREATE PROCEDURE Top10Jogos()
BEGIN
    SELECT J.ID_Jogo, J.Nome, SUM(TC.Qtd) AS TotalQtd
    FROM Jogo AS J
    JOIN TransaçãoContem AS TC ON J.ID_Jogo = TC.ID_Jogo
    GROUP BY J.ID_Jogo, J.Nome
    ORDER BY TotalQtd DESC
    LIMIT 10;
END $$
DELIMITER ;