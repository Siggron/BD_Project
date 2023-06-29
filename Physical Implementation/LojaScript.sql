CREATE SCHEMA Loja;
-- DROP SCHEMA Loja;
USE Loja;

CREATE TABLE IF NOT EXISTS Jogo (
    ID_Jogo INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    ESRB VARCHAR(8) NULL,
    Plataforma VARCHAR(20) NOT NULL,
    Publicadora VARCHAR(30) NULL,
    Ano_Lanc INT NULL,
    Preço DECIMAL(5,2) NOT NULL,
    Qtd INT NOT NULL,
		PRIMARY KEY (ID_Jogo)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Cliente (
    ID_Cliente INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Data_Nasc DATE NOT NULL,
		PRIMARY KEY (ID_Cliente)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
CREATE TABLE IF NOT EXISTS Colaborador (
    ID_Colab INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
		PRIMARY KEY (ID_Colab)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Transação (
	Num_Transac INT NOT NULL,
    Data_Transac DATE NOT NULL,
    Qtd INT NOT NULL,
    Valor_Total DECIMAL(5,2) NOT NULL,
    Tipo CHAR(1) NOT NULL,
    ID_Cliente INT NOT NULL,
    ID_Colab INT NOT NULL,
		PRIMARY KEY (Num_Transac),
        FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
        FOREIGN KEY (ID_Colab) REFERENCES Colaborador(ID_Colab)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS TransaçãoContem (
    Num_Transac INT NOT NULL,
    ID_Jogo INT NOT NULL,
    Qtd INT NOT NULL,
    Valor_Total DECIMAL(5,2) NOT NULL,
		PRIMARY KEY (Num_Transac, ID_Jogo),
		FOREIGN KEY (Num_Transac) REFERENCES Transação(Num_Transac),
		FOREIGN KEY (ID_Jogo) REFERENCES Jogo(ID_Jogo)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Jogo_Géneros (
    ID_Jogo INT NOT NULL,
    Género VARCHAR(50) NOT NULL,
		PRIMARY KEY (ID_Jogo, Género),
		FOREIGN KEY (ID_Jogo) REFERENCES Jogo(ID_Jogo)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
CREATE TABLE IF NOT EXISTS Jogo_Desenvolvedores (
    ID_Jogo INT NOT NULL,
    Desenvolvedor VARCHAR(50) NOT NULL,
		PRIMARY KEY (ID_Jogo, Desenvolvedor),
		FOREIGN KEY (ID_Jogo) REFERENCES Jogo(ID_Jogo)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    
CREATE TABLE IF NOT EXISTS ClienteEmail (
    ID_Cliente INT NOT NULL,
    Email VARCHAR(50) NOT NULL,
		PRIMARY KEY (ID_Cliente, Email),
		FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
)
ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ClienteContacto (
    ID_Cliente INT NOT NULL,
    Contacto INT NOT NULL,
		PRIMARY KEY (ID_Cliente, Contacto),
		FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
)
ENGINE=InnoDB 
DEFAULT CHARSET=utf8mb4;
