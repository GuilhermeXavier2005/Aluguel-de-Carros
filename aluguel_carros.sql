USE bancocarros;

/*DELIMITER $$
CREATE FUNCTION VarAleatorio(tamanho INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE letras VARCHAR(62) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    DECLARE Aleatoria VARCHAR(100) DEFAULT '';
    DECLARE contador INT DEFAULT 1;
    
    WHILE contador <= tamanho DO
        SET Aleatoria = CONCAT(Aleatoria, SUBSTRING(letras, FLOOR(1 + RAND() * 62), 1));
        SET contador = contador + 1;
    END WHILE;

    RETURN Aleatoria;
END $$
DELIMITER ;*/

SET @valorAleatorio :=  VarAleatorio(10);

set @sql = 'INSERT INTO documentos (CRL_V, licenciamento, placa) VALUES (?,?,?)';
PREPARE disponiveis FROM @sql;
SET @CRL_V = @valorAleatorio, @licenciamento = '2025-04-30', @placa = 'JRC5U10';
EXECUTE disponiveis USING @CRL_V, @licenciamento, @placa;
DEALLOCATE PREPARE disponiveis;

set @sql = 'INSERT INTO crl_v (renavam, chassi, ano_modelo, cor, categoria, combustivel, municipio, crl_v) VALUES (?,?,?,?,?,?,?,?)';
PREPARE documentosDisponiveis FROM @sql;
SET @crl_v = @valorAleatorio, @renavam = '90123456789', @chassi = 'VF3CUHMR0KT012345', @ano_modelo = '2022-01-01', @cor = 'amarelo', @categoria = 'particular', 
@combustivel = 'Flex', @municipio = 'Florianopolis - SC';
EXECUTE documentosDisponiveis USING @renavam, @chassi, @ano_modelo, @cor, @categoria, @combustivel, @municipio, @crl_v;
DEALLOCATE PREPARE documentosDisponiveis;

SELECT * FROM crl_v
JOIN documentos ON documentos.CRL_V = crl_v.crl_v
JOIN carros ON carros.placa = documentos.placa;
