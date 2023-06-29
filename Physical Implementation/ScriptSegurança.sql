-- CREATE USER 'clamídeo'@'localhost' IDENTIFIED BY 'clamídeo';
-- GRANT ALL PRIVILEGES ON loja.* TO 'clamídeo'@'localhost';

CREATE USER 'clamideo'@'localhost' IDENTIFIED BY 'clamideo';
GRANT ALL PRIVILEGES ON loja.* TO 'clamideo'@'localhost';
GRANT ALL PRIVILEGES ON loja.* TO 'clamideo'@'localhost';
GRANT PROCESS ON *.* TO 'clamideo'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'funcionario';
GRANT SELECT, INSERT, UPDATE ON loja.Cliente TO 'funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.ClienteEmail TO 'funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.ClienteContacto TO 'funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.Transação TO 'funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.TransaçãoContem TO 'funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.Jogo TO 'funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.Jogo_Géneros TO 'funcionario'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.Jogo_Desenvolvedores TO 'funcionario'@'localhost';

CREATE USER 'utilizador'@'localhost' IDENTIFIED BY 'utilizador';
GRANT SELECT, INSERT, UPDATE ON loja.Cliente TO 'utilizador'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.ClienteEmail TO 'utilizador'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja.ClienteContacto TO 'utilizador'@'localhost';
GRANT SELECT ON loja.Jogo TO 'utilizador'@'localhost';
GRANT SELECT ON loja.Jogo_Géneros TO 'utilizador'@'localhost';
GRANT SELECT ON loja.Jogo_Desenvolvedores TO 'utilizador'@'localhost';
GRANT SELECT (Num_Transac, Data_Transac, Qtd, Valor_Total, Tipo, ID_Cliente) ON loja.Transação TO 'utilizador'@'localhost';
GRANT SELECT (Num_Transac, Qtd, Valor_Total, ID_Jogo) ON loja.TransaçãoContem TO 'utilizador'@'localhost';

SELECT * 
 	FROM mysql.user;
    
-- DROP USER 'clamideo'@'localhost';
    
-- REVOKE DELETE ON loja.* FROM 'clamídeo'@'localhost';
-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'utilizador'@'localhost';