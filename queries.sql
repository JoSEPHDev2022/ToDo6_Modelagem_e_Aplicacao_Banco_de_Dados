-- Queries

-- Qual empresa utiliza o maior número de tecnologias na última pesquisa (1/2022)?

SELECT DISTINCT nome, COUNT(titulo) AS tecnologias FROM
    (SELECT tb_empresa.nome, tb_tecnologia.titulo FROM tb_relatorio
            INNER JOIN tb_empresa
                ON tb_relatorio.id_empresa = tb_empresa.id_empresa
            INNER JOIN tb_tecnologia
                ON tb_relatorio.id_tecnologia = tb_tecnologia.id_tecnologia
            WHERE tb_relatorio.data_registro 
                BETWEEN '2022-01-01' AND '2022-01-31') 
AS tabela
    GROUP BY nome;

-- Qual empresa utilizava o menor número de tecnologias na pesquisa anterior (2/2021)?

SELECT DISTINCT nome, COUNT(titulo) AS tecnologias FROM
    (SELECT tb_empresa.nome, tb_tecnologia.titulo FROM tb_relatorio
            INNER JOIN tb_empresa
                ON tb_relatorio.id_empresa = tb_empresa.id_empresa
            INNER JOIN tb_tecnologia
                ON tb_relatorio.id_tecnologia = tb_tecnologia.id_tecnologia
            WHERE tb_relatorio.data_registro
                BETWEEN '2021-02-01' AND '2021-02-28')
AS tabela
    GROUP BY nome
        ORDER BY tecnologias;

-- Quantas empresas utilizam tecnologias da área de “Dados” atualmente?

SELECT nome AS empresas, COUNT(area = 'dados') AS num_tec_dados FROM
    (SELECT tb_empresa.nome, tb_tecnologia.area FROM tb_relatorio
            INNER JOIN tb_empresa
                ON tb_relatorio.id_empresa = tb_empresa.id_empresa
            INNER JOIN tb_tecnologia
                ON tb_relatorio.id_tecnologia = tb_tecnologia.id_tecnologia
            WHERE tb_tecnologia.area = 'dados') 
AS tabela
    GROUP BY nome, area
        ORDER BY num_tec_dados DESC;

-- Quantas empresas utilizam tecnologias que não são da área de “Dados” atualmente?

SELECT nome AS empresas, COUNT(area = 'front') AS num_tec_front FROM
    (SELECT tb_empresa.nome, tb_tecnologia.area FROM tb_relatorio
            INNER JOIN tb_empresa
                ON tb_relatorio.id_empresa = tb_empresa.id_empresa
            INNER JOIN tb_tecnologia
                ON tb_relatorio.id_tecnologia = tb_tecnologia.id_tecnologia
            WHERE tb_tecnologia.area = 'front') 
AS tabela
    GROUP BY nome, area
        ORDER BY num_tec_front DESC;