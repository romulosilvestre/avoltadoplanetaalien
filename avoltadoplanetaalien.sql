CREATE DATABASE avoltadoplanetaalien;
USE avoltadoplanetaalien;


CREATE TABLE verbo (
    id INT PRIMARY KEY auto_increment,
    nomeverbo VARCHAR(40),
    fk_bloom_id INT
);

CREATE TABLE bloom (
    id INT PRIMARY KEY auto_increment,
    nome VARCHAR(40)
);


CREATE TABLE historia (
    id INT PRIMARY KEY auto_increment,
    titulo VARCHAR(150),
    descricao LONGTEXT,
    final VARCHAR(200)
);

CREATE TABLE competencia (
    id INT PRIMARY KEY auto_increment,
    descricao LONGTEXT,
    fk_verbo_id INT
);

CREATE TABLE etapa (
    id INT PRIMARY KEY auto_increment,
    instrucao LONGTEXT,
    ponto INT,
    tipo CHAR(1), /*nao aceitou nchar*/
    fk_verbo_id INT
);

CREATE TABLE Missao (
    id INT PRIMARY KEY auto_increment,
    hash char(22), /*nao aceitou nchar*/
    titulo VARCHAR(80),
    forca INT,
    fk_competencia_id INT,
    fk_etapa_id INT
);

CREATE TABLE MissaoHistoria (
    id INT PRIMARY KEY auto_increment,
    fk_Missao_id INT,
    fk_historia_id INT
);
 
ALTER TABLE competencia ADD CONSTRAINT FK_competencia_2
    FOREIGN KEY (fk_verbo_id)
    REFERENCES verbo (id)
    ON DELETE CASCADE;
 
ALTER TABLE verbo ADD CONSTRAINT FK_verbo_2
    FOREIGN KEY (fk_bloom_id)
    REFERENCES bloom (id)
    ON DELETE CASCADE;
 
ALTER TABLE etapa ADD CONSTRAINT FK_etapa_2
    FOREIGN KEY (fk_verbo_id)
    REFERENCES verbo (id)
    ON DELETE CASCADE;
 
ALTER TABLE Missao ADD CONSTRAINT FK_Missao_2
    FOREIGN KEY (fk_competencia_id)
    REFERENCES competencia (id)
    ON DELETE CASCADE;
 
ALTER TABLE Missao ADD CONSTRAINT FK_Missao_3
    FOREIGN KEY (fk_etapa_id)
    REFERENCES etapa (id)
    ON DELETE CASCADE;
 
ALTER TABLE MissaoHistoria ADD CONSTRAINT FK_MissaoHistoria_2
    FOREIGN KEY (fk_Missao_id)
    REFERENCES Missao (id)
    ON DELETE CASCADE;
 
ALTER TABLE MissaoHistoria ADD CONSTRAINT FK_MissaoHistoria_3
    FOREIGN KEY (fk_historia_id)
    REFERENCES historia (id)
    ON DELETE CASCADE;
    
/*--------------------HISTORIA DO JOGO--------------------*/    
select * from historia;
insert into historia(titulo, descricao,final) 
values
('Planeta Alien',
'No ano de 3250 a terra foi destruída por alienígenas do Planeta Alien. Esses extraterrestes eram desenvolvedores de tecnologia avançada em seu planeta, mas aprenderam com os humanos a linguagem de marcação HTML, a linguagem de estilização CSS e a linguagem de programação Java Script.
Antes de destruir a terra por inteiro, escolheu um casal de cada Mamífero e fez uma mutação genética com a tecnologia do planeta Alien e as tecnologias aprendidas no planeta Terra: HTML, CSS e Java Script.
Todos os Mamíferos mutantes, aceitaram tranquilamente a mutação genética, mas um e apenas um, chamado de Furão Mutante Guerreiro, não aceitou. Ele foi levado para o Planeta Alien, mas a sua memória ainda continuou na terra. Um dia essas memórias se misturaram com sua mutação genética e ele se revoltou contra os aliens.
A revolta fez nascer missões. E cada missão ganha um nível de força que o torna mais poderoso aumentando a possibilidade de destruir mais aliens e assim salvar também os seus amigos terrestres.',
'Final do Jogo');
insert into historia(titulo, descricao,final) 
values ('Etapa1', 'Nessa etapa da missão, será avaliado sua capacidade de memorizar', 'voce chegou ao final da etapa');

/*-------------------- BLOOM --------------------*/ 
select * from bloom;
insert into bloom(nome) 
values
('memorizar'),
('compreender'),
('aplicar'),
('analisar'),
('avaliar'),
('criar');

/*-------------------- VERBO --------------------*/ 
select * from verbo;
insert into verbo (nomeverbo) 
values
('listar'), ('relembrar'), ('reconhecer'), ('identificar'), ('localizar'), ('descrever'), ('criar'),
('esquematizar'), ('relacionar'), ('explicar'), ('demonstrar'), ('parafrasear'), ('associar'), ('converter');

update verbo set fk_bloom_id = 1 where id <=7;
update verbo set fk_bloom_id = 2 where id > 7;

/*-------------------- ETAPA --------------------*/ 
select * from etapa;

/*-------------------- COMPETENCIA --------------------*/
SELECT * FROM competencia;


/*-------------------- MISSAO --------------------*/
SELECT * FROM missao; 
insert into missao(has, titulo, forca) 
values
('','Encontrar Tags', 1),('','Encontrar Selectores',2),
('','Encontrar Scripts',3),('','Encontrar Exceptions',4),
('','Encontrar Conditions',5),('','Encontrar Loops',6),
('','Encontrar Arrays',7),('','Encontrar Fuctions',8),
('','Encontrar Objects',9),('','Encontrar DataBases',10);

