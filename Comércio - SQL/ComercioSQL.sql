CREATE DATABASE COMERCIO;
USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50) NOT NULL,
	SEXO ENUM ('M','F') NOT NULL,
	EMAIL VARCHAR(40) NOT NULL UNIQUE,
	CPF VARCHAR(14) UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	DDD CHAR(2) NOT NULL,
	TIPO ENUM ('CEL','COM','RES'),
	NUMERO VARCHAR(12) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (IDCLIENTE)
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(25) NOT NULL,
	NUMERO VARCHAR(4) NOT NULL,
	BAIRRO VARCHAR(25) NOT NULL,
	CIDADE VARCHAR(25) NOT NULL,
	ESTADO CHAR(2),
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (IDCLIENTE) 
);

CREATE TABLE PRODUTO(
	NUMERO INT(2),
	NOME VARCHAR(10)
);

CREATE TABLE VENDEDOR(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (40) NOT NULL,
	SEXO ENUM ("M","F") NOT NULL,
	JANEIRO FLOAT (8,2),
	FEVEREIRO FLOAT (8,2),
	MARÇO FLOAT (8,2), 
	ABRIL FLOAT (8,2), 
	MAIO FLOAT (8,2), 
	JUNHO FLOAT (8,2), 
	JULHO FLOAT (8,2), 
	AGOSTO FLOAT (8,2), 
	SETEMBRO FLOAT (8,2), 
	OUTUBRO FLOAT (8,2), 
	NOVEMBRO FLOAT (8,2), 
	DEZEMBRO FLOAT (8,2)
);

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
----------------------------------Arco de Inserção de Dados---------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

	
INSERT INTO CLIENTE VALUES (NULL,'Renan Moreira','M','moreirarmcm@gmail.com','123.456.789-00');
INSERT INTO CLIENTE VALUES (NULL,'Rayane Moreira','F','raymoreirarmcm@email.com','122.446.789-00');
INSERT INTO CLIENTE VALUES (NULL,'Karine Gruünwaldt','F','karinwgnw@gmail.com','111.416.789-10');
INSERT INTO CLIENTE VALUES (NULL,'Tatye Missako','F','missako@email.com','123.456.000-01');
INSERT INTO CLIENTE VALUES (NULL,'Rodolfo Daario','M','daarioii@email.com','216.621.729-74');
INSERT INTO CLIENTE VALUES (NULL,'Lucas Oliveira','M','oliveiralucas@email.com','438.456.217-84');
INSERT INTO CLIENTE VALUES (NULL,'Hanna Arenth','F',NULL,'451.456.217-04'); 


INSERT INTO ENDERECO VALUES (NULL,'Rua Amoreira','4','Vila Amora','São Paulo', 'SP',1);
INSERT INTO ENDERECO VALUES (NULL,'Rua Felicidade','200','Jardim da Saúde','São Paulo','SP',2);
INSERT INTO ENDERECO VALUES (NULL,'Est. do Boldo','265','Caída da Concórdia','São José', 'RS',3);
INSERT INTO ENDERECO VALUES (NULL,'Tr. da Vitória', '19','Campanário','Cunha Porã','SC',4);
INSERT INTO ENDERECO VALUES (NULL,'Rod. Oswaldo Aranha','1001','BR KM 14','Rio de Janeiro','RJ',5);
INSERT INTO ENDERECO VALUES (NULL,'Rua João Miguel','184','Vila Mariana','Aparecida','SP',6);
INSERT INTO ENDERECO VALUES (NULL,'Jardim Itapeva ','1043','Vila Alpina','João Pessoa','PE',7);


INSERT INTO TELEFONE VALUES (NULL,'11','CEL','91234-5678',1);
INSERT INTO TELEFONE VALUES (NULL,'49','CEL','94326-9876',2);
INSERT INTO TELEFONE VALUES (NULL,'91','CEL','95832-8192',3);
INSERT INTO TELEFONE VALUES (NULL,'21','CEL','93021-3826',4);
INSERT INTO TELEFONE VALUES (NULL,'11','CEL','94027-1936',5);
INSERT INTO TELEFONE VALUES (NULL,'65','CEL','92735-3281',6);
INSERT INTO TELEFONE VALUES (NULL,'50','COM','2731-3711',7);

INSERT INTO PRODUTO VALUES (1,'Vassoura');
INSERT INTO PRODUTO VALUES (2,'Rodo');
INSERT INTO PRODUTO VALUES (3,'Esponja');
INSERT INTO PRODUTO VALUES (4,'Creme');
INSERT INTO PRODUTO VALUES (5,'Shampoo');
INSERT INTO PRODUTO VALUES (6,'Pano de prato');
INSERT INTO PRODUTO VALUES (7,'Toalha');

INSERT INTO VENDEDOR VALUES (NULL,"Cássio","M",1000.00,2754.00,1232.50,3219.00,2143.40,7829.50,6584.00,2186.00,3829.10,2432.80,2918.30,1237.00);
INSERT INTO VENDEDOR VALUES (NULL,"Ana Paula","F",2352.00,3743.00,5432.50,3219.00,2343.40,7829.50,3291.00,2186.00,3829.10,1363.80,1384.30,4364.00);
INSERT INTO VENDEDOR VALUES (NULL,"Ana Júlia","F",7642.00,7654.00,6895.50,3219.00,2143.40,6584.50,3291.00,2186.00,3829.10,2938.80,2852.30,3275.00);
INSERT INTO VENDEDOR VALUES (NULL,"Ronaldo","M",2365.00,7654.00,2142.50,3219.00,2143.40,2349.50,3291.00,2186.00,3829.10,3721.80,1986.30,2694.00);
INSERT INTO VENDEDOR VALUES (NULL,"Agatha","F",2875.00,1234.00,1245.50,3219.00,6584.40,7829.50,3291.00,2186.00,3829.10,9732.80,2118.30,4829.00);
INSERT INTO VENDEDOR VALUES (NULL,"Guilherme","M",9863.00,1234.00,2146.50,6584.00,2143.40,2349.50,3291.00,2186.00,3829.10,7521.80,9876.30,8753.00);
INSERT INTO VENDEDOR VALUES (NULL,"Rodrigo","M",2345.00,1021.00,6584.50,3219.00,2143.40,7829.50,3234.00,2186.00,3829.10,2364.80,2918.30,1542.00);
INSERT INTO VENDEDOR VALUES (NULL,"Jaciara","F",5432.00,1653.00,6483.50,2521.00,9632.40,6943.50,7421.00,2634.00,7524.10,1373.80,1496.30,1542.00);

SELECT* FROM VENDEDOR;


--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-------------------------Arco de Projeção, Seleção e Junção de Dados------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

SELECT* FROM CLIENTE 
WHERE IDCLIENTE = 3;
SELECT* FROM ENDERECO
WHERE IDENDERECO = 2;

SELECT NOME, SEXO 
FROM CLIENTE 
WHERE SEXO = 'F'; 

SELECT NOME, EMAIL, CIDADE, ESTADO 
FROM CLIENTE 
	INNER JOIN ENDERECO 
		ON IDCLIENTE = ID_CLIENTE;

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.MODELO, T.CONTATO 
FROM CLIENTE C 
	INNER JOIN ENDERECO E 
		ON C.IDCLIENTE = E.ID_CLIENTE 
	INNER JOIN TELEFONE T 
		ON C.IDCLIENTE = T.ID_CLIENTE  
WHERE SEXO = 'M'; 
--Relatorio Geral

SELECT C.NOME, IFNULL(C.EMAIL, "Não possui e-mail") AS "E-MAIL", C.SEXO, C.CPF, T.DDD, T.NUMERO AS TELEFONE, E.RUA, E.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T
		ON C.IDCLIENTE = T.ID_CLIENTE  
	INNER JOIN ENDERECO E
		ON C.IDCLIENTE = E.ID_CLIENTE;

--Relatorio dos homens
SELECT C.NOME, C.EMAIL, C.SEXO, C.CPF, T.DDD, T.CONTATO AS TELEFONE, E.RUA, E.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
	ON (C.SEXO = "M") AND (C.IDCLIENTE = T.ID_CLIENTE)  
INNER JOIN ENDERECO E
	ON (C.SEXO = "M") AND (C.IDCLIENTE = E.ID_CLIENTE);

--Relatorio das mulheres
SELECT C.NOME, C.EMAIL, C.SEXO, C.CPF, T.DDD, T.CONTATO AS TELEFONE, E.RUA, E.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN TELEFONE T
	ON (C.SEXO = "F") AND (C.IDCLIENTE = T.ID_CLIENTE)  
INNER JOIN ENDERECO E
	ON (C.SEXO = "F") AND (C.IDCLIENTE = E.ID_CLIENTE);

--Quantidade de homens e mulheres
 SELECT COUNT(*) AS QUANTIDADE, SEXO 
 FROM CLIENTE 
 GROUP BY SEXO;

--IDs e email das mulheres que morem no cenTROo do rio de Janeiro e não tenham celular
SELECT T.DDD, C.EMAIL
FROM TELEFONE T 
	INNER JOIN CLIENTE C
		ON (C.IDCLIENTE = T.ID_CLIENTE AND C.SEXO = "M")
	INNER JOIN ENDERECO E
		ON C.IDCLIENTE = E.ID_CLIENTE AND E.ESTADO = "RJ";

--NOME, EMAIL, E TELEFONE DOS CLIENTES QUE MORAM EM RJ
SELECT C.NOME, C.EMAIL, T.DDD, T.CONTATO, E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T
		ON (C.IDCLIENTE = T.ID_CLIENTE)
	INNER JOIN ENDERECO E
		ON (C.IDCLIENTE = E.ID_CLIENTE AND E.ESTADO = "SP");


SELECT NOME, IFNULL(EMAIL, "Não tem E-Mail") AS "E-MAIL" FROM CLIENTE;

SELECT IDCLIENTE, NOME, SEXO 
	FROM CLIENTE
	ORDER BY NOME ASC;

SELECT* 
	FROM VENDEDOR
ORDER BY NOME;

SELECT IDVENDEDOR, NOME, (JANEIRO+FEVEREIRO+MARÇO+ABRIL+MAIO+JUNHO+JULHO+AGOSTO+SETEMBRO+OUTUBRO+NOVEMBRO+DEZEMBRO) AS "TOTAL DE VENDAS"
	FROM VENDEDOR;
WHERE IDVENDEDOR = 1;

SELECT NOME, MAX(JANEIRO) 
	FROM VENDEDOR
	ORDER BY JANEIRO;

SELECT NOME, MIN(JANEIRO) 
	FROM VENDEDOR;

SELECT NOME, MAX(MARCO) 
	FROM VENDEDOR;
SELECT NOME, MIN(MARCO) 
	FROM VENDEDOR;

SELECT TRUNCATE(AVG(JANEIRO),2) AS "MÉDIA"
	FROM VENDEDOR;

SELECT COUNT(*), SEXO 
	FROM VENDEDOR
GROUP BY SEXO;

SELECT SUM(JANEIRO+FEVEREIRO+MARÇO+ABRIL+MAIO+JUNHO+JULHO+AGOSTO+SETEMBRO+OUTUBRO+NOVEMBRO+DEZEMBRO) AS "SOMA_HOMENS"
	FROM VENDEDOR
WHERE SEXO = "M";
SELECT SUM(JANEIRO+FEVEREIRO+MARÇO+ABRIL+MAIO+JUNHO+JULHO+AGOSTO+SETEMBRO+OUTUBRO+NOVEMBRO+DEZEMBRO) AS "SOMA_MULHERES"
	FROM VENDEDOR
WHERE SEXO = "F";

SELECT SEXO, SUM(JANEIRO+FEVEREIRO+MARÇO+ABRIL+MAIO+JUNHO+JULHO+AGOSTO+SETEMBRO+OUTUBRO+NOVEMBRO+DEZEMBRO) AS "SOMA_MULHERES"
	FROM VENDEDOR
GROUP BY SEXO;

SELECT MARÇO AS "MENOR VENDA", NOME 
	FROM VENDEDOR
WHERE MARÇO = (SELECT MAX(MARÇO) 
					FROM VENDEDOR);

SELECT FEVEREIRO, NOME
	FROM VENDEDOR
WHERE FEVEREIRO = (SELECT MAX(FEVEREIRO) 
						FROM VENDEDOR);

SELECT MARÇO, NOME
	FROM VENDEDOR
WHERE MARÇO > (SELECT TRUNCATE(AVG(MARÇO), 2) 
					FROM VENDEDOR;

SELECT NOME, FEVEREIRO
	FROM VENDEDOR
WHERE FEVEREIRO = (SELECT MIN(FEVEREIRO) FROM VENDEDOR);

SELECT NOME, MARÇO
	FROM VENDEDOR
	WHERE MARÇO < (SELECT AVG(MARÇO) 
					FROM VENDEDOR);



--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
---------------------Arco de, Inclusão, Atualização e Exclusão de Dados---------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

UPDATE CLIENTE 
SET EMAIL = "raymoreirarlcm@email.com"
WHERE IDCLIENTE = 2;

UPDATE CLIENTE 
SET NOME = "Karine Grünwaldt", EMAIL = "karinegnw@gmail.com"
WHERE IDCLIENTE = 3;

UPDATE ENDERECO
SET BAIRRO = "São Luís", CIDADE = "Gericó", ESTADO = "MA"
WHERE IDENDERECO = 2;

ALTER TABLE CLIENTE
MODIFY EMAIL VARCHAR (40) UNIQUE;

UPDATE CLIENTE
SET NOME = "Hannah Arenth" 
WHERE IDCLIENTE = 7;

ALTER TABLE PRODUTO
MODIFY NOME VARCHAR(20) NOT NULL;


--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
-----------------------------------PROCEDURES E VIEWS---------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

CREATE VIEW V_RELATORIO_GERAL AS
	SELECT C.NOME, IFNULL(C.EMAIL, "Não possui e-mail") AS "E-MAIL", C.SEXO, C.CPF, T.DDD, T.NUMERO AS TELEFONE, E.RUA, E.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
	FROM CLIENTE C
		INNER JOIN TELEFONE T
			ON C.IDCLIENTE = T.ID_CLIENTE  
		INNER JOIN ENDERECO E
			ON C.IDCLIENTE = E.ID_CLIENTE;


DELIMITER $
CREATE PROCEDURE FAZ_SOMA(X INT, Y INT)
	BEGIN
		SELECT X + Y AS "SOMA";
	END
$

CREATE PROCEDURE NOME_EMPRESA()
	BEGIN
		SELECT "T.E.M.P.L.E Fraternity" AS "Razão Social";
	END
$
DELIMITER ;		 	

CALL FAZ_SOMA(1,2);
CALL NOME_EMPRESA();


--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
------------------------------------------DROPAGENS-----------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
DROP TABLE CLIENTE;
DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE PRODUTO;


DROP VIEW V_RELATORIO_GERAL;

DROP PROCEDURE NOME_EMPRESA;
DROP PROCEDURE FAZ_CONTA;

UPDATE PROCEDURE NOME_EMPRESA
SET SELECT "T.E.M.P.L.E";

DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;