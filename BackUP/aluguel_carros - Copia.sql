/*USE bancocarros;*/

set @sql = 'INSERT INTO carros (placa, nome, tipo_carro) VALUES (?,?,?)';
PREPARE disponiveis FROM @sql;
SET @placa = 'MNL3K96', @nome = 'Chevrolet Onyx', @tipo_carro = 'hatchback'; 
EXECUTE disponiveis USING @placa, @nome, @tipo_carro;
DEALLOCATE PREPARE disponiveis;

SELECT * FROM carros;

/*SELECT * FROM endereco 
JOIN usuario ON usuario.CPF = endereco.cpf;*/
