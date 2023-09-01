use mechanicshop;
-- Dados para a tabela clients

INSERT INTO clients (IdVehicle, Fname, Minit, Lname, CPF)
VALUES
    ('ABC1234', 'João', 'A.', 'Silva', '12345678900'),
    ('XYZ5678', 'Maria', 'B.', 'Santos', '98765432100'),
    ('ASD9876', 'Paulo', 'G.', 'Mendes', '77788899900'),
    ('RTY1234', 'Fernanda', 'H.', 'Almeida', '11122233344'),
    ('UIO5678', 'Rafael', 'I.', 'Cunha', '55566677788'),
    ('PAS0987', 'Cristina', 'J.', 'Pereira', '99988877766'),
    ('FDS7654', 'Marcos', 'K.', 'Lopes', '33344455566'),
    ('ZXC4321', 'Viviane', 'L.', 'Santana', '66655544411'),
    ('VBN8765', 'Hugo', 'M.', 'Freitas', '22211133300'),
    ('TYU6543', 'Luiza', 'N.', 'Ribeiro', '55544466688'),
    ('QWE3456', 'Ana', 'D.', 'Oliveira', '44598677788'),
    ('RTY9876', 'Pedro', 'E.', 'Ferreira', '44455566677'),
    ('UIO1234', 'Carolina', 'F.', 'Gomes', '77788899911'),
    ('PAS5678', 'Ricardo', 'G.', 'Martins', '88899911122'),
    ('FDS0987', 'Sofia', 'H.', 'Rodrigues', '22233344455');

-- Dados para a tabela clientVehicle
INSERT INTO clientVehicle (LicensePlate, VehicleType, Color, VehicleBrand)
VALUES
    ('ABC1234', 'Carro', 'Vermelho', 'Toyota'),
    ('XYZ5678', 'Moto', 'Azul', 'Honda'),
    ('ASD9876', 'Carro', 'Prata', 'Ford'),
    ('RTY1234', 'Moto', 'Preto', 'Yamaha'),
    ('UIO5678', 'Carro', 'Branco', 'Chevrolet'),
    ('PAS0987', 'Moto', 'Vermelho', 'Suzuki'),
    ('FDS7654', 'Van', 'Preto', 'Volkswagen'),
    ('ZXC4321', 'Carro', 'Azul', 'Hyundai'),
    ('VBN8765', 'Moto', 'Branco', 'Kawasaki'),
    ('TYU6543', 'Carro', 'Prata', 'Renault'),
    ('QWE3456', 'Moto', 'Amarelo', 'Ducati'),
    ('RTY9876', 'Van', 'Vermelho', 'Fiat'),
    ('UIO1234', 'Carro', 'Preto', 'Nissan'),
    ('PAS5678', 'Moto', 'Azul', 'Triumph'),
    ('FDS0987', 'Caminhão', 'Branco', 'Mercedes');
    
-- Dados para a tabela orders
INSERT INTO orders (IdOrderClient, OrderDescription, ServiceValue)
VALUES
    (1, 'Troca de óleo', 150.00),
    (2, 'Revisão completa', 2500.00),
    (3, 'Alinhamento e balanceamento', 175.00),
    (4, 'Verificação de freios', 220.00),
    (5, 'Lavagem e limpeza interna', 100.00),
    (6, 'Troca de filtro de ar', 3000.00),
    (7, 'Verificação de fluídos', 150.00),
    (8, 'Troca de pastilhas de freio', 200.00),
    (9, 'Polimento e enceramento', 250.00),
    (10, 'Diagnóstico eletrônico', 180.00),
    (11, 'Reparo no sistema de ar condicionado', 600.00),
    (12, 'Balanceamento de rodas', 150.00),
    (13, 'Troca de lâmpadas', 200.00),
    (14, 'Reparo na parte elétrica', 250.00),
    (15, 'Inspeção de suspensão', 180.00);

-- Dados para a tabela payments
INSERT INTO payments (IdPayerClient, IdPayment, typePayment, SecondTypePayment, OrderValue, limitAvailable, Installment)
VALUES
    (1, 1, 'Cartão', NULL, 150.00, 2000.00, 3),
    (2, 2, 'Boleto', NULL, 2500.00, null, 1),
    (3, 3, 'Cartão', NULL, 175.00, 220.00, 2),
    (4, 4, 'Pix', 'Cartão', 220.00, null, 1),
    (5, 5, 'Boleto', NULL, 100.00, null, 1),
    (6, 6, 'Cartão', NULL, 3000.00, 5500.00, 8),
    (7, 7, 'Cartão', NULL, 150.00, 180.00, 1),
    (8, 8, 'Pix', 'Cartão', 200.00, null, 1),
    (9, 9, 'Boleto', NULL, 250.00, null, 9),
    (10, 10, 'Cartão', NULL, 180.00, 200.00, 2),
    (11, 11, 'Cartão', NULL, 600.00, 850.00, 5),
    (12, 12, 'Boleto', NULL, 150.00, null, 1),
    (13, 13, 'Cartão', NULL, 200.00, 220.00, 1),
    (14, 14, 'Pix', 'Cartão', 250.00, null, 1),
    (15, 15, 'Cartão', NULL, 180.00, 220.00, 10);

-- Dados para a tabela service
INSERT INTO service (IdService, TypeService, ServiceDetails)
VALUES
    (1, 'Troca de óleo', 'Substituição do óleo do motor e do filtro de óleo.'),
    (2, 'Revisão completa', 'Verificação completa do veículo, incluindo freios, suspensão e fluidos.'),
    (3, 'Alinhamento e balanceamento', 'Ajuste de alinhamento das rodas e balanceamento.'),
    (4, 'Verificação de freios', 'Inspeção e manutenção dos sistemas de freio.'),
    (5, 'Lavagem e limpeza interna', 'Limpeza interna e externa do veículo.'),
    (6, 'Troca de filtro de ar', 'Substituição do filtro de ar do motor.'),
    (7, 'Verificação de fluídos', 'Verificação e reposição de fluídos do veículo.'),
    (8, 'Troca de pastilhas de freio', 'Substituição das pastilhas de freio.'),
    (9, 'Polimento e enceramento', 'Polimento e enceramento da pintura.'),
    (10, 'Diagnóstico eletrônico', 'Diagnóstico de problemas eletrônicos no veículo.'),
    (11, 'Reparo no sistema de ar condicionado', 'Manutenção e reparo no sistema de ar condicionado.'),
    (12, 'Balanceamento de rodas', 'Balanceamento das rodas do veículo.'),
    (13, 'Troca de lâmpadas', 'Substituição de lâmpadas queimadas.'),
    (14, 'Reparo na parte elétrica', 'Manutenção e reparo em sistemas elétricos do veículo.'),
    (15, 'Inspeção de suspensão', 'Inspeção e ajuste dos sistemas de suspensão do veículo.');
    
  
-- Dados para employee
INSERT INTO employee (Fname, Minit, Lname, CPF, JobTitle, Bdate, Contact, Salary, ContractedDate)
VALUES
    ('Carlos', 'X', 'Souza', '12345678901', 'Mecânico', '1990-05-15', '987654321', 2500.00, '2015-03-20'),
    ('Luciana', 'Y', 'Fernandes', '98765432102', 'Atendente', '1992-08-10', '876543210', 1800.00, '2018-01-12'),
    ('Gustavo', 'Z', 'Ribeiro', '77788899903', 'Gerente', '1985-02-28', '765432109', 4000.00, '2010-11-05'),
    ('Fábio', 'W', 'Silva', '11122233304', 'Técnica', '1993-11-20', '654321098', 2800.00, '2019-06-30'),
    ('Andrea', 'U', 'Pereira', '55566677705', 'Mecânico', '1991-07-07', '543210987', 2600.00, '2017-09-18'),
    ('Camila', 'V', 'Mendes', '99988877706', 'Atendente', '1988-12-03', '432109876', 1900.00, '2016-04-25'),
    ('Leonardo', 'K', 'Santos', '33344455507', 'Mecânico', '1987-04-15', '321098765', 2400.00, '2013-08-08'),
    ('Isabel', 'L', 'Oliveira', '66655544408', 'Técnica', '1995-10-30', '210987654', 2700.00, '2020-02-10'),
    ('Roberto', 'M', 'Freitas', '22211133309', 'Atendente', '1994-06-22', '109876543', 1800.00, '2017-12-05'),
    ('Elena', 'N', 'Ribeiro', '55544466610', 'Gerente', '1989-09-08', '098765432', 4500.00, '2008-07-15'),
    ('Marcela', 'J', 'Cunha', '55566677711', 'Atendente', '1996-03-12', '987654321', 1900.00, '2021-05-30'),
    ('Rafael', 'T', 'Ferreira', '44455566612', 'Mecânico', '1997-01-25', '876543210', 2300.00, '2022-02-18'),
    ('Larissa', 'X', 'Gomes', '77788899913', 'Técnica', '1990-08-09', '765432109', 2800.00, '2014-09-03'),
    ('Giovanni', 'Z', 'Martins', '88899911114', 'Atendente', '1993-05-18', '654321098', 2000.00, '2019-11-20'),
    ('Natália', 'W', 'Rodrigues', '22233344415', 'Mecânica', '1986-11-07', '543210987', 2500.00, '2012-06-14');    
    

-- Dados para a tabela employeeDependent
INSERT INTO employeeDependent (IdEmployeeDependent, IdDependent, Fname, Minit, Lname, Bdate)
VALUES
    (1, 1, 'Pedro', 'X', 'Souza', '2010-03-05'),
    (2, 2, 'Mariana', 'Y', 'Fernandes', '2015-10-15'),
    (3, 3, 'Carlos', 'Z', 'Ribeiro', '2009-08-25'),
    (4, 4, 'Lucia', 'W', 'Silva', '2012-12-10'),
    (4, 5, 'Ricardo', 'W', 'Silva', '2011-04-03'),
    (7, 6, 'Marta', 'K', 'Santos', '2013-11-18'),
    (8, 7, 'Felipe', 'L', 'Oliveira', '2014-09-22'),
    (10, 8, 'Rafael', 'N', 'Ribeiro', '2007-01-30'),
    (11, 9, 'Carolina', 'J', 'Cunha', '2010-12-08'),
    (12, 10, 'Diego', 'T', 'Ferreira', '2018-05-25'),
    (13, 11, 'Aline', 'X', 'Gomes', '2005-09-12'),
    (13, 12, 'Bruno', 'X', 'Gomes', '2017-08-06'),
    (13, 13, 'Julia', 'X', 'Gomes', '2019-02-28');
    
    
-- Dados para a tabela supplier
INSERT INTO supplier (SocialName, CNPJ, Contact)
VALUES
    ('Auto Peças Ltda.', '12345678901234', '987654321'),
    ('Moto Peças S.A.', '56789012345678', '987654322'),
    ('Peças e Componentes', '90123456789012', '987654323'),
    ('Mecânica Rápida', '34567890123456', '987654324'),
    ('Peças Express', '78901234567890', '987654325'),
    ('Moto Center', '23456789012345', '987654326');

-- Dados para Estoque
INSERT INTO inventory (IdParts, Quantity)
VALUES
    (1, 800),
    (2, 950),
    (3, 1200),
    (4, 750),
    (5, 1100),
    (6, 850);

-- Dados para os Locais de cada estoque
INSERT INTO inventoryLocation (IdLinventory, Location)
VALUES
    (1, 'Rio de Janeiro'),
    (2, 'São Paulo'),
    (3, 'Minas Gerais'),
    (4, 'Bahia'),
    (5, 'Paraná'),
    (6, 'Pernambuco');

-- Dados para a tabela serviceParts
INSERT INTO serviceParts (IdService, IdPart, Quantity)
VALUES
    (4, 4, 7),
    (6, 6, 8),
    (10, 4, 9),
    (11, 5, 2),
    (13, 1, 3),
    (14, 2, 8);
