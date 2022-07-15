-- QUERYs
use DBConsorcio

-- Listar todos os clientes do estado de SP que possuem mais de 60% das parcelas pagas;
SELECT DISTINCT CLI.ID, cli.Nome, (100/count(par.ID) *count(par.DataPagamento)) as Porcentagem
	, count(par.ID) as QtdDeParcelas, count(par.DataPagamento) as qtdParcelarPagas FROM Clientes cli
Join Financiamentos fin on cli.ID = fin.ClienteID
Join Parcelamentos par on fin.ID = par.FinanciamentoID
where CLI.UF = 'sp'
GROUP BY CLI.ID, cli.Nome
HAVING (100/count(par.ID) *count(par.DataPagamento)) > 60


-- DATA ATUAL considerei como sendo a Data do último vencimento
SELECT top(4)* FROM Clientes cli
Join Financiamentos fin on cli.ID = fin.ClienteID
Join Parcelamentos par on fin.ID = par.FinanciamentoID
where par.DataDoVencimento > fin.DataDoUltimoVencimento and par.DataPagamento is null
