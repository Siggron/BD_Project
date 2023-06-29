INSERT INTO Jogo (ID_Jogo, Nome, ESRB, Plataforma, Publicadora, Ano_Lanc, Preço, Qtd)
VALUES
(1, 'The Witcher 3: Wild Hunt', 'M', 'PC', 'CD Projekt', 2015, 29.99, 5),
(2, 'Red Dead Redemption 2', 'M', 'PlayStation 4', 'Rockstar Games', 2018, 49.99, 8),
(3, 'The Legend of Zelda: Breath of the Wild', 'E10+', 'Nintendo Switch', 'Nintendo', 2017, 59.99, 3),
(4, 'GTA V', 'M', 'Xbox One', 'Rockstar Games', 2013, 39.99, 10),
(5, 'FIFA 22', 'E', 'PlayStation 5', 'EA Sports', 2021, 69.99, 2),
(6, 'Assassins Creed Valhalla', 'M', 'Xbox Series X', 'Ubisoft', 2020, 49.99, 6),
(7, 'Minecraft', 'E10+', 'PC', 'Mojang Studios', 2011, 19.99, 12),
(8, 'Cyberpunk 2077', 'M', 'PlayStation 4', 'CD Projekt', 2020, 39.99, 4),
(9, 'Super Mario Odyssey', 'E10+', 'Nintendo Switch', 'Nintendo', 2017, 49.99, 7),
(10, 'Call of Duty: Warzone', 'M', 'PC', 'Activision', 2020, 65.99, 15);

INSERT INTO Cliente (ID_Cliente, Nome, Data_Nasc)
VALUES
(1, 'João Silva', '1990-05-10'),
(2, 'Maria Santos', '1985-12-15'),
(3, 'Pedro Costa', '1993-07-20'),
(4, 'Ana Rodrigues', '1988-03-25'),
(5, 'Rui Oliveira', '1992-09-05'),
(6, 'Sara Ferreira', '1995-01-30'),
(7, 'Miguel Almeida', '1991-11-02'),
(8, 'Carla Pereira', '1987-06-18'),
(9, 'André Sousa', '1994-04-12'),
(10, 'Inês Gomes', '1989-08-28');

INSERT INTO Colaborador (ID_Colab, Nome)
VALUES
(1, 'Sr. Clamídeo'),
(2, 'Serginho');


INSERT INTO Transação (Num_Transac, Data_Transac, Qtd, Valor_Total, Tipo, ID_Cliente, ID_Colab)
VALUES
(1, '2023-01-05', 2, 89.98, 'C', 1, 1),
(2, '2023-02-10', 1, 49.99, 'C', 4, 1),
(3, '2023-03-15', 3, 109.97, 'V', 5, 2),
(4, '2023-01-25', 1, 19.99, 'C', 6, 1),
(5, '2023-02-18', 2, 99.98, 'V', 2, 2),
(6, '2023-03-05', 1, 49.99, 'C', 7, 2),
(7, '2023-01-10', 4, 159.96, 'V', 3, 2),
(8, '2023-02-28', 2, 79.98, 'C', 9, 2),
(9, '2023-03-20', 1, 39.99, 'C', 10, 1),
(10, '2023-01-15', 3, 179.97, 'V', 8, 2);

INSERT INTO TransaçãoContem (Num_Transac, ID_Jogo, Qtd, Valor_Total)
VALUES
(1, 1, 1, 29.99),
(1, 3, 1, 59.99),
(2, 2, 1, 49.99),
(3, 4, 2, 79.98),
(3, 1, 1, 29.99),
(4, 7, 1, 19.99),
(5, 5, 1, 69.99),
(5, 1, 1, 29.99),
(6, 6, 1, 49.99),
(7, 2, 2, 99.98),
(7, 1, 2, 59.98),
(8, 9, 1, 49.99),
(8, 1, 1, 29.99),
(9, 8, 1, 39.99),
(10, 3, 3, 179.97);

INSERT INTO Jogo_Géneros (ID_Jogo, Género)
VALUES
(1, 'RPG'),
(1, 'Ação'),
(2, 'Ação'),
(2, 'Aventura'),
(3, 'Aventura'),
(4, 'Ação'),
(4, 'Aventura'),
(5, 'Esporte'),
(6, 'Ação'),
(7, 'Sandbox'),
(7, 'Aventura'),
(8, 'RPG'),
(8, 'Ação'),
(9, 'Aventura'),
(9, 'Plataforma'),
(10, 'Ação');

INSERT INTO Jogo_Desenvolvedores (ID_Jogo, Desenvolvedor)
VALUES
(1, 'CD Projekt'),
(2, 'Rockstar Games'),
(3, 'Nintendo'),
(4, 'Rockstar Games'),
(5, 'EA Sports'),
(6, 'Ubisoft'),
(7, 'Mojang Studios'),
(8, 'CD Projekt'),
(9, 'Nintendo'),
(10, 'Activision');

INSERT INTO ClienteEmail (ID_Cliente, Email)
VALUES
(1, 'joao.silva@gmail.com'),
(1, 'silvinha@gmail.com'),
(2, 'maria.santos@hotmail.com'),
(3, 'pedro.costa@gmail.com'),
(4, 'ana.rodrigues@yahoo.com'),
(4, 'ana.rodrigues2000@gmail.com'),
(4, 'anaaaaaaaaaaaa@hotmail.com'),
(5, 'rui.oliveira@gmail.com'),
(6, 'sara.ferreira@hotmail.com'),
(6, 'sara.ferreira@gmail.com'),
(7, 'miguel.almeida@gmail.com'),
(8, 'carla.pereira@yahoo.com'),
(9, 'andre.sousa@gmail.com'),
(10, 'ines.gomes@hotmail.com');

INSERT INTO ClienteContacto (ID_Cliente, Contacto)
VALUES
(1, '912345678'),
(1, '213789345'),
(2, '919876543'),
(3, '911234567'),
(3, '993345111'),
(4, '916543219'),
(5, '917654321'),
(5, '939992001'),
(6, '919876543'),
(7, '912345678'),
(8, '911234567'),
(9, '917654321'),
(10, '916543219');