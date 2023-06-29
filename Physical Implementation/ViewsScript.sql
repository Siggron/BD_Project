-- Vista de resumo de transações por cliente
CREATE VIEW TransaçõesPorCliente AS
SELECT t.ID_Cliente, c.Nome AS NomeCliente, COUNT(*) AS TotalTransacoes, SUM(t.Valor_Total) AS ValorTotal, MAX(t.Data_Transac) AS UltimaTransacao
FROM Transação AS t
JOIN Cliente AS c ON t.ID_Cliente = c.ID_Cliente
GROUP BY t.ID_Cliente;

-- Vista de jogos mais populares
CREATE VIEW JogosMaisPopulares AS
SELECT J.ID_Jogo, J.Nome, SUM(TC.Qtd) AS TotalUnidadesVendidas
FROM Jogo AS J
JOIN TransaçãoContem AS TC ON J.ID_Jogo = TC.ID_Jogo
GROUP BY J.ID_Jogo
ORDER BY TotalUnidadesVendidas DESC;

-- Vista de Disponibilidade de Stock
CREATE VIEW DisponibilidadeStock AS
SELECT J.ID_Jogo, J.Nome, J.Qtd - COALESCE(TotalVendido, 0) + COALESCE(TotalComprado, 0) AS StockDisponivel
FROM Jogo AS J
LEFT JOIN (
    SELECT tc.ID_Jogo, SUM(tc.Qtd) AS TotalVendido
    FROM TransaçãoContem AS tc
    JOIN Transação ON tc.Num_Transac = Transação.Num_Transac
    WHERE Transação.Tipo = 'V'
    GROUP BY ID_Jogo
) AS Vendas ON J.ID_Jogo = Vendas.ID_Jogo
LEFT JOIN (
    SELECT tc.ID_Jogo, SUM(tc.Qtd) AS TotalComprado
    FROM TransaçãoContem AS tc
    JOIN Transação ON tc.Num_Transac = Transação.Num_Transac
    WHERE Transação.Tipo = 'C'
    GROUP BY ID_Jogo
) AS Compras ON J.ID_Jogo = Compras.ID_Jogo;


SELECT * FROM DisponibilidadeStock;