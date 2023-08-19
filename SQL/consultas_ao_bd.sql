-- #1. Selecionar a quantidade total de estudantes cadastrados no banco;
SELECT
    count(id_estudante) as total_de_estudantes
FROM
    resilia.estudantes;

-- #2. Selecionar quais pessoas facilitadoras atuam em mais de uma turma;
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
    INNER JOIN nome_id_funcionario ON facilitadores.id_pessoa = nome_id_funcionario.id_pessoa
    INNER JOIN id_facilitador_contador ON id_facilitador_contador.id_facilitador = facilitadores.id_facilitador
WHERE
    (
        area_atuacao = 'Hard'
        OR area_atuacao = 'Soft'
    )
    AND (id_facilitador_contador.contador > 1);

-- #3. Criar uma view que selecione a porcentagem de estudantes com status de evasão agrupados por turma;
CREATE VIEW frequencia_estudante AS
SELECT
    estudantes.frequencia,
    estudantes.id_estudante
FROM
    resilia.estudantes
    INNER JOIN pessoas ON estudantes.id_pessoa = pessoas.id_pessoa
WHERE
    estudantes.frequencia < 75;

CREATE VIEW taxa_de_evasao AS
SELECT
    (COUNT(frequencia) / 50) AS porcentagem_evasao,
    estudantes_turmas.id_turma,
    turmas.nome_sala
FROM
    frequencia_estudante
    INNER JOIN estudantes_turmas ON frequencia_estudante.id_estudante = estudantes_turmas.id_estudante
    INNER JOIN turmas ON estudantes_turmas.id_turma = turmas.id_turma
group by
    estudantes_turmas.id_turma;

select
    *
from
    taxa_de_evasao;

-- #4. Quais são os facilitadores e seus respectivos salários em um curso de duração superior a um determinado valor?
SELECT
    f.id_facilitador,
    f.area_atuacao,
    f.salario,
    c.nome AS nome_curso
FROM
    Facilitadores AS f
    JOIN Facilitadores_turma AS ft ON f.id_facilitador = ft.id_facilitador
    JOIN Turmas AS t ON ft.id_turma = t.id_turma
    JOIN Cursos AS c ON t.id_curso = c.id_curso
WHERE
    c.tempo_duracao > 5
ORDER BY
    id_facilitador;

-- #5. Qual é a média de notas das avaliações para cada uma das turmas?
CREATE VIEW id_turma_nota as
SELECT
    id_turma,
    avaliacoes.nota
FROM
    estudantes_turmas
    INNER JOIN avaliacoes ON avaliacoes.id_avaliacao = estudantes_turmas.id_avaliacao;

-- # Conta a quantidade de alunos por turma 
SELECT
    AVG(nota) as media,
    id_turma_nota.id_turma,
    turmas.nome_sala
FROM
    id_turma_nota
    INNER JOIN turmas ON id_turma_nota.id_turma = turmas.id_turma
GROUP BY
    id_turma;

-- #6: Quais alunos moram em São Paulo?
SELECT
    pessoas.nome,
    endereco.*
FROM
    pessoas
    INNER JOIN endereco ON pessoas.endereco_id = endereco.endereco_id
WHERE
    (pessoas.tipo_de_cadastro = 'Aluno')
    AND (endereco.cidade = 'São Paulo');