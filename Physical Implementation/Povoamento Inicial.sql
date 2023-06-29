USE Loja;

CALL RegistarCliente('Ana Silva', '1990-05-15', 'ana.silva@gmail.com', '123456789');
CALL RegistarCliente('Pedro Santos', '1985-08-25', 'pedro.santos@gmail.com,pedro.santos2@gmail.com', '987654321');
CALL RegistarCliente('Marta Pereira', '1992-11-10', 'marta.pereira@gmail.com', '456789123,987654321');
CALL RegistarCliente('José Oliveira', '1982-03-18', 'jose.oliveira@gmail.com,jose.oliveira2@gmail.com', '321654987,654987321');
CALL RegistarCliente('Sara Rodrigues', '1998-07-22', 'sara.rodrigues@gmail.com', '789123456');
CALL RegistarCliente('André Costa', '1995-12-03', 'andre.costa@gmail.com', '654987321,123789456');
CALL RegistarCliente('Mariana Almeida', '1991-09-08', 'mariana.almeida@gmail.com,mariana.almeida2@gmail.com', '123789456');
CALL RegistarCliente('Carlos Santos', '1987-06-12', 'carlos.santos@gmail.com', '987321654');
CALL RegistarCliente('Inês Silva', '1994-02-27', 'ines.silva@gmail.com', '456123789,789456123');
CALL RegistarCliente('Rui Pereira', '1989-04-05', 'rui.pereira@gmail.com,rui.pereira2@gmail.com', '321987654');

SELECT *
	FROM Cliente
    LIMIT 100000;
    


CALL RegistarJogo('The Witcher 3: Wild Hunt', 'Mature', 'PC', 'CD Projekt RED', 2015, 49.99, 10, 'RPG', 'CD Projekt RED');
CALL RegistarJogo('Grand Theft Auto V', 'Mature', 'PS4', 'Rockstar Games', 2013, 59.99, 5, 'Action,Adventure', 'Rockstar North,Rockstar San Diego');
CALL RegistarJogo('The Legend of Zelda: Breath of the Wild', '10+', 'Nintendo Switch', 'Nintendo', 2017, 59.99, 3, 'Action,Adventure', 'Nintendo');
CALL RegistarJogo('Red Dead Redemption 2', 'Mature', 'Xbox One', 'Rockstar Games', 2018, 49.99, 8, 'Action,Adventure', 'Rockstar Games,Rockstar San Diego');
CALL RegistarJogo('Minecraft', 'Everyone', 'PC', 'Mojang Studios', 2011, 29.99, 15, 'Sandbox', 'Mojang Studios');
CALL RegistarJogo('Fortnite', 'Teen', 'Multiplataforma', 'Epic Games', 2017, 0, 20, 'Battle Royale', 'Epic Games,People Can Fly');
CALL RegistarJogo('Super Mario Odyssey', 'Everyone', 'Nintendo Switch', 'Nintendo', 2017, 49.99, 5, 'Platform,Adventure', 'Nintendo');
CALL RegistarJogo('The Last of Us Part II', 'Mature', 'PS4', 'Naughty Dog', 2020, 59.99, 2, 'Action,Adventure', 'Naughty Dog,Sony Interactive Entertainment');
CALL RegistarJogo('League of Legends', 'Teen', 'PC', 'Riot Games', 2009, 0, 50, 'MOBA', 'Riot Games');
CALL RegistarJogo('Call of Duty: Modern Warfare', 'Mature', 'Xbox One', 'Infinity Ward', 2019, 59.99, 4, 'First-person Shooter', 'Infinity Ward,Activision');

SELECT *
	FROM Jogo
    LIMIT 100000;
    
SELECT *
	FROM Jogo_Desenvolvedores
    LIMIT 100000;
    
-- DELETE FROM Jogo_Desenvolvedores
-- 	WHERE ID_Jogo > 90785;
-- DELETE FROM Jogo_Géneros
-- 	WHERE ID_Jogo > 90785;
-- DELETE FROM Jogo
-- 	WHERE ID_Jogo > 90785;

INSERT INTO Colaborador (ID_Colab, Nome)
VALUES
(1, 'Sr. Clamídeo'),
(2, 'Serginho');

CALL RegistarTransacao('2023-01-05', 1, 1, '1,1;3,1;', 'C');
CALL RegistarTransacao('2023-02-10', 4, 1, '2,1;', 'C');
CALL RegistarTransacao('2023-03-15', 5, 2, '4,2;1,1;', 'V');
CALL RegistarTransacao('2023-01-25', 6, 1, '7,1;', 'C');
CALL RegistarTransacao('2023-02-18', 2, 2, '5,1;1,1;', 'V');
CALL RegistarTransacao('2023-03-05', 7, 2, '6,1;', 'C');
CALL RegistarTransacao('2023-01-10', 3, 2, '2,2;1,2;', 'V');
CALL RegistarTransacao('2023-02-28', 9, 2, '9,1;1,1;', 'C');
CALL RegistarTransacao('2023-03-20', 10, 1, '8,1;', 'C');
CALL RegistarTransacao('2023-01-15', 8, 2, '3,3;', 'V');

SELECT tc.Num_Transac, tc.ID_Jogo, tc.Qtd, tc.Valor_Total, t.Qtd AS Soma_Qtds, t.Valor_Total AS Soma_Valores_Totais
	FROM TransaçãoContem tc
    JOIN Transação t ON tc.Num_Transac = t.Num_Transac;
    
-- DELETE FROM TransaçãoContem;
