-- Criação das entidades com seus atributos, chaves primárias e estrangeiras.
CREATE TABLE tb_contato (
    id_contato SERIAL NOT NULL,
    telefone VARCHAR(70) NULL,
    nome VARCHAR(100) NULL,
    email VARCHAR(70) NULL,
    PRIMARY KEY (id_contato)
);

CREATE TABLE tb_empresa (
    id_empresa SERIAL NOT NULL,
    cnpj VARCHAR(70) NULL,
    nome VARCHAR(100) NULL,
    id_contato INT NOT NULL,
    PRIMARY KEY (id_empresa),
    CONSTRAINT tb_empresa_fk_id_contato FOREIGN KEY (id_contato) REFERENCES tb_contato (id_contato)
);

CREATE TABLE tb_tecnologia (
    id_tecnologia SERIAL NOT NULL,
    titulo VARCHAR(100) NULL,
    descricao VARCHAR(500) NULL,
    area VARCHAR(50) NULL,
    PRIMARY KEY (id_tecnologia)
);

CREATE TABLE tb_relatorio (
    id_relatorio SERIAL NOT NULL,
    id_empresa INT NOT NULL,
    id_tecnologia INT NOT NULL,
    data_registro DATE NULL,
    PRIMARY KEY (id_relatorio),
    CONSTRAINT tb_relatorio_fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES tb_empresa (id_empresa),
    CONSTRAINT tb_relatorio_fk_id_tecnologia FOREIGN KEY (id_tecnologia) REFERENCES tb_tecnologia (id_tecnologia)
);
---------------------------------------------------------------------------------------------------------------------
-- Inserindo os dados no banco de dado criado.
INSERT INTO tb_contato (telefone,nome,email) VALUES
    ('11-987226540','Matilda Santos','santos_cs@sonhos.com'),
    ('11-902881765','Lucas Alberto','albert_ad@armazem.com'),
    ('11-972881927','Daniela Freitas','freitas_ds@sabores.com'),
    ('11-982774635','Jeferson Batista','batista_tl@techlab.com');
    
INSERT INTO tb_empresa (cnpj,nome,id_contato) VALUES
    ('22.222.222/0001-22','Criando Sonhos Web',1),
    ('55.555.555/0001-55','Armazém dos dados',2),
    ('11.111.111/0001-11','Doceria Sabores',3),
    ('33.333.333/0001-33','TechLab inc.',4);
    
INSERT INTO tb_tecnologia (titulo,descricao,area) VALUES
    ('web development','desenvolvimento web de aplicações e sites','front'),
    ('marketing digital','Comunicação visual voltada ao amrketing empresarial','front'),
    ('fullstack devops','Aplicação de operações de desenvolvimento fullstack','front'),
    ('data analysis','Análise exploratória de dados estruturados e não estruturados','dados'),
    ('big data','Aplicações em Big Data','dados'),
    ('data security','Pilares da segurança de dados durante toda pipeline','dados'),
    ('data production pipeline','Ciclo completo de produção dos dados','dados'),
    ('e-commerce','Comercio online','front'),
    ('backend devops','Aplicação de operações de desenvolvimento backend','dados'),
    ('metaverse development','Desenvolvimento e exploração do Metaverso','front'),
    ('programming logic','Lógica de programação','front/dados'),
    ('BI','Utilização de BI para aprimorar a pipeline','dados');
    
INSERT INTO tb_relatorio (id_relatorio,id_empresa,id_tecnologia,data_registro) VALUES
    ('1','1','1','2021-02-05'),
    ('2','1','2','2021-02-10'),
    ('3','1','3','2021-02-25'),
    ('4','1','8','2021-02-26'),
    ('5','1','11','2021-03-14'),
    ('6','2','4','2022-01-06'),
    ('7','2','5','2022-01-15'),
    ('8','2','6','2022-01-23'),
    ('9','2','7','2022-01-27'),
    ('10','2','9','2022-01-28'),
    ('11','2','11','2022-02-03'),
    ('12','2','12','2022-02-12'),
    ('13','2','10','2022-02-14'),
    ('14','3','2','2021-02-07'),
    ('15','3','8','2021-02-17'),
    ('16','4','4','2021-02-18'),
    ('17','4','5','2021-02-25'),
    ('18','4','6','2021-02-26'),
    ('19','4','7','2022-01-14'),
    ('20','4','9','2022-01-28');