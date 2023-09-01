-- Fazendo consultas
use mechanicshop;

-- Determine o gasto total de cada cliente e identifique os serviços solicitados por cada um.

select * from orders;
select * from payments;

SELECT concat(Fname, ' ', Lname) as Cliente, ServiceValue as 'Valor Gasto', TypePayment as 'Formas de Pagamento', 
		Installment as 'Número de Parcelas', OrderDescription as 'Serviço solicitado'
FROM clients
INNER JOIN orders ON IdClient = IdOrderClient
INNER JOIN payments ON IdClient = IdPayerClient;


-- Descubra qual tipo de veículo é o mais comum na oficina.

SELECT VehicleType as 'Tipo de veiculo', count(vehicleType) as 'Quantidade'
FROM clientVehicle
GROUP BY VehicleType
ORDER BY Quantidade desc;


-- Qual foi o serviço mais caro solicitado por um cliente e quem foi esse cliente?

SELECT concat(Fname, ' ', Lname) as Cliente, OrderDescription as 'Descrição do Serviço', ServiceValue as 'Valor do serviço'
FROM orders
INNER JOIN clients ON IdOrderClient = IdClient
ORDER BY ServiceValue DESC
LIMIT 1;


-- Analise quantas peças foram utilizadas para cada serviço na oficina, bem como o fornecedor e estoque de onde foram requisitadas.

SELECT TypeService as 'Tipo de serviço', sp.Quantity as 'Quantidade solicitada',  
		i.Quantity as 'Quantidade em Estoque',  i.Quantity - sp.Quantity as 'Quantidade restante', 
		SocialName as 'Nome do Fornecedor', Location as 'Local Estoque'
FROM serviceParts as sp
INNER JOIN service as s ON sp.IdService = s.IdService
INNER JOIN inventory as i ON sp.IdPart = i.IdParts
INNER JOIN inventoryLocation ON IdInventory = IdLinventory
INNER JOIN supplier ON IdInventory = IdSupplier;


-- Quais são os principais fornecedores de peças para a oficina e qual é o volume de peças fornecidas por cada um?

SELECT SocialName as 'Nome do fornecedor', sp.Quantity as 'Quantidade solicitada', i.Quantity 'Quantidade em Estoque'
FROM supplier su
INNER JOIN inventory i ON IdInventory = IdSupplier
INNER JOIN serviceParts sp ON IdPart = IdParts
ORDER BY sp.Quantity desc
LIMIT 3; 


-- Calcule o número atual de funcionários em cada cargo e o total dos salários em cada um.

SELECT JobTitle as Cargo, count(JobTitle) 'Quantidade de funcionários', SUM(Salary) as 'Salário Total por Área'
FROM employee
GROUP BY JobTitle;


-- Qual é a média de anos de experiência dos funcionários da oficina, considerando a data de contratação?

SELECT COUNT(IdEmployee) AS 'Número de funcionários', 
       ROUND(AVG(DATEDIFF(CURDATE(), ContractedDate) / 365), 2) AS 'Tempo Médio de Serviço (Anos)'
FROM employee;


-- Aplique um aumento de 5% no salário para todos os funcionários que tenham mais de 5 anos (aproximadamente 1826 dias) de serviço, e conceda um aumento adicional de 10% aos que possuírem dependentes.

SELECT DISTINCT CONCAT(e.Fname, ' ', e.Lname) AS 'Nome do Funcionário', 
       e.JobTitle AS Cargo, 
       e.ContractedDate AS 'Data da Contratação',
       e.Salary AS SalarioAnterior,
       CASE 
           WHEN DATEDIFF(CURDATE(), e.ContractedDate) > 1826 AND ed.IdDependent IS NOT NULL THEN ROUND(e.Salary * 1.15, 2)
           WHEN DATEDIFF(CURDATE(), e.ContractedDate) > 1826 THEN ROUND(e.Salary * 1.05, 2)
           ELSE e.Salary
       END AS SalarioAumentado,
       IFNULL(dep_count, 0) AS 'Quantidade de Dependentes'
FROM employee e
LEFT JOIN employeeDependent ed ON e.IdEmployee = ed.IdEmployeeDependent
LEFT JOIN (
   SELECT IdEmployeeDependent, COUNT(*) AS dep_count
   FROM employeeDependent
   GROUP BY IdEmployeeDependent
) dep ON e.IdEmployee = dep.IdEmployeeDependent
ORDER BY Cargo;








