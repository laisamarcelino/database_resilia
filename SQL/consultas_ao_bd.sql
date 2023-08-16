#1. Selecionar a quantidade total de estudantes cadastrados no banco;

SELECT 
    count(id_estudante) as total_de_estudantes
FROM
    resilia.estudantes;


#2. Selecionar quais pessoas facilitadoras atuam em mais de uma turma;

CREATE VIEW nome_id_funcionario AS
SELECT 
    nome,
    id_pessoa
FROM
    resilia.pessoas
WHERE 
    tipo_de_cadastro = 'Funcionário';

CREATE VIEW id_facilitador_contador AS
SELECT 
    id_facilitador,
    count(id_turma) AS contador
FROM
    facilitadores_turma
group by
	id_facilitador;

SELECT 
    facilitadores.id_facilitador,
    nome_id_funcionario.nome
FROM 
    resilia.facilitadores
INNER JOIN 
    nome_id_funcionario ON facilitadores.id_pessoa = nome_id_funcionario.id_pessoa
INNER JOIN 
    id_facilitador_contador ON id_facilitador_contador.id_facilitador = facilitadores.id_facilitador
WHERE
    (area_atuacao = 'Hard' OR area_atuacao = 'Soft') AND (id_facilitador_contador.contador > 1);
