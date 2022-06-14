DROP TABLE IF EXISTS TRABALHA;
DROP TABLE IF EXISTS TERCEIRIZADOS;
DROP TABLE IF EXISTS ESTAGIARIOS;
DROP TABLE IF EXISTS FUNCPSS;
DROP TABLE IF EXISTS AGENTES;
DROP TABLE IF EXISTS DICIPLINAS;
DROP TABLE IF EXISTS CURSOS;
DROP TABLE IF EXISTS DOCENTES;
DROP TABLE IF EXISTS COLEGIADOS;
DROP TABLE IF EXISTS DEPARTAMENTOS;
DROP TABLE IF EXISTS CONCURSADOS;
DROP TABLE IF EXISTS FUNCIONARIOS;

##### link para o git https://github.com/Phocosta/TrabalhodeBD

create table FUNCIONARIOS(
        id integer primary key,
        idade integer,
        telefone varchar(11),
        NomeFunc varchar(80),
        dataEntrada date
);

create table AGENTES(
        idFunc integer primary key,
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);

create table CONCURSADOS(
        idFunc integer primary key,
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);

create table COLEGIADOS(
       idColeg integer primary key,
       nomeColeg VARCHAR(30),
       idCord integer,
       foreign key(idCord) references CONCURSADOS(idFunc)
);

create table DOCENTES(
        idFunc integer primary key,
        idColeg integer,
        grauFormacao varchar(20),
        foreign key(idColeg) references COLEGIADOS(idColeg),
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);

create table DEPARTAMENTOS(
        idDepto integer primary key,
        idGerente integer,
        NomeDepto VARCHAR(40),
        foreign key(idGerente) references CONCURSADOS(idFunc)
);

create table ESTAGIARIOS(
       idFunc integer primary key,
       idSuperv integer,
       tempoDeEstagioAnos integer,
       foreign key(idSuperv) references CONCURSADOS(idFunc),
       foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);

create table FUNCPSS(
       idFunc integer primary key,
       tempoDeContratoAnos integer,
       foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);

create table TERCEIRIZADOS(
        idFunc integer primary key,
        nomeEmpresa varchar(40),
        telefoneEmpresa varchar(11),
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);

create table TRABALHA(
        idFunc integer,
        idDepto integer,
        primary key (idFunc, idDepto),
        foreign key(idFunc) references AGENTES(idFunc),
        foreign key(idDepto) references DEPARTAMENTOS(idDepto)
);

create table CURSOS(
        idCurs integer primary key,
        idColeg integer,
        nomeCurso varchar(40),
        foreign key(idColeg) references COLEGIADOS(idColeg)
);

create table DICIPLINAS(
        idDic integer primary key,
        nomeDic varchar(40),
        idProf integer,
        idCurs integer,
        foreign key(idProf) references DOCENTES(idFunc),
		foreign key(idCurs) references CURSOS(idCurs)
);
#### TODOS OS FUNCIONARIOS ###
INSERT INTO FUNCIONARIOS (id, idade, telefone, nomeFunc, dataEntrada)
VALUES		### Gerentes Concursados De Departamentos
			(001, 37, 44998076301, 'Angela Maria', '2009-10-1'),
			(002, 45, 44998076703, 'Fabiano Krul', '2011-9-1'),
			(003, 50, 44998076402, 'Angelo Cunha', '1999-10-1'),
			(004, 36, 44998076307, 'Liandre Rob', '2003-10-1'),
			(005, 39, 44998076209, 'Ceres Cruz', '2007-3-1'),
			(006, 30, 44998076105, 'Adalberto Jorje', '2006-12-1'),
			(007, 32, 44998076202, 'Liane Books', '2020-1-1'),
			(008, 31, 44998076103, 'Paulo Peque', '2013-3-1'),
			(009, 41, 44998076107, 'Genesio Piris', '2007-8-1'),
			(010, 29, 44998076101, 'Meire Gruz', '2008-11-1'),
			#Funcionarios Agentes dos Departamentos (Estagiarios)
			(011, 47, 44997076301, 'Luiz Felipe', '2021-10-1'),
			(012, 65, 44997076703, 'Pedro Costa', '2021-9-1'),
			(013, 20, 44997076402, 'Natalya Heim', '2021-10-1'),
			(014, 66, 44997076307, 'Joao Cardoso', '2021-10-1'),
			(015, 49, 44997076209, 'Daniele Marques', '2021-7-1'),
			(016, 50, 44997076105, 'Jeniffer Lima', '2021-12-1'),
			(017, 52, 44997076202, 'Ana Ofelia', '2022-1-1'),
			(018, 51, 44997076103, 'Mirele Lima', '2022-3-1'),
			(019, 31, 44997076107, 'Lucas Alexandre', '2021-8-1'),
			(020, 49, 44999076101, 'Vinicios Andrade', '2021-11-1'),
            #Funcionarios Agentes dos Departamentos (Terceirizados e PSS)
			(021, 47, 44999076301, 'Maria Fernanda', '2020-10-1'),
			(022, 65, 44999076703, 'Bruna Cruz', '2021-9-1'),
			(023, 20, 44997576402, 'Raquel Bibli', '1999-10-1'),
			(024, 66, 44998576307, 'Kelly Dutra', '2003-10-1'),
			(025, 49, 44998276209, 'Olga Aparecida', '2007-3-1'),
			(026, 50, 44998276105, 'Monique Lima', '2006-12-1'),
			(027, 52, 44938076202, 'Dora Ofelia', '2020-1-1'),
			(028, 51, 44938076103, 'Joaquim Robert', '2022-3-1'),
			(029, 31, 44928076107, 'Ingridi Almeida', '2021-8-1'),
			(030, 49, 44928076101, 'Julia Agrada', '2020-11-1'),
			(031, 37, 44958076301, 'Lira Limpa', '2021-7-1'),
            (032, 37, 44968076301, 'Fabricio Terc', '2021-10-1'),           
            ###Docentes Concursado Cordenador
			(033, 50, 44995076402, 'Rosana Cristina', '1999-10-1'),
			(034, 36, 44995076307, 'Jesus Lucas', '2003-10-1'),
			(035, 39, 44995076209, 'Willia Costa', '2007-3-1'),
			(036, 30, 44995076105, 'Mateus Jorje', '2006-12-1'),
			(037, 32, 44996076202, 'Leticia Books', '2020-1-1'),
			(038, 31, 44996076103, 'Rodrigo Peque', '2013-3-1'),
			(039, 41, 44996076107, 'Rony Piris', '2007-8-1'),
			(040, 29, 44999076101, 'Jessica Lima', '2008-11-1'),
			(041, 37, 44888076301, 'Raquel Char', '2009-10-1'),
			(042, 45, 44995076703, 'Marco Junior', '2011-9-1'),
            ###Docentes Pertencenstes Colegiados (PSS)
			(043, 50, 44998076492, 'Rogerio Cunha', '1999-10-1'),
			(044, 36, 44998076397, 'Mario Rob', '2003-10-1'),
			(045, 39, 44998076999, 'Lara Cristina', '2007-3-1'),
			(046, 30, 44998076195, 'Jeferson Lima', '2006-12-1'),
			(047, 32, 44998076292, 'Poyer Magri', '2020-1-1'),
			(048, 31, 44998076193, 'Dara Vilhosa', '2013-3-1'),
			(049, 41, 44998076197, 'Julia Luiza', '2007-8-1'),
			(050, 45, 44998076793, 'Eloisa Krul', '2011-9-1');
            
INSERT INTO AGENTES (idFunc)
VALUES 		(1),
			(2),
			(3),
			(4),
			(5),
			(6),
			(7),
			(8),
			(9),
			(10),
            (11),
			(12),
			(13),
			(14),
			(15),
			(16),
			(17),
			(18),
			(19),
			(20),
            (21),
			(22),
			(23),
			(24),
			(25),
			(26),
			(27),
			(28),
			(29),
			(30),
            (31),
			(32);
            
INSERT INTO CONCURSADOS (idFunc)
VALUES 		#Concursados Gerentes de Setores
			(1),
			(2),
			(3),
			(4),
			(5),
			(6),
			(7),
			(8),
			(9),
			(10),
            #Concursados Cordenadores de Colegiados
			(33),
			(34),
			(35),
			(36),
			(37),
			(38),
			(39),
			(40),
            (41),
			(42);
            
INSERT INTO	COLEGIADOS (idColeg, nomeColeg, idCord)
VALUES		(1, 'Adiministracao', 33),
			(2, 'CienciasContabeis', 34),
			(3, 'CienciasEconomicas', 35),
            (4, 'Letras', 36),
			(5, 'Matematica', 37),
            (6, 'Geografia', 38),
			(7, 'Historia', 39),
            (8, 'Centro de Desenvolvimento Agroidustrial', 40),
			(9, 'Pedagodia', 41),
            (10, 'Turismo e Meio-Ambiente', 42);
            
INSERT INTO DOCENTES (idFunc, idColeg, grauFormacao)
VALUES		#Docentes Concursados Cordenadores
			(33, 1, 'Doutor'),
            (34, 2, 'Doutor'),
            (35, 3, 'Doutor'),
            (36, 4, 'Doutor'),
            (37, 5, 'Doutor'),
            (38, 6, 'Doutor'),
            (39, 7, 'Doutor'),
            (40, 8, 'Doutor'),
            (41, 9, 'Doutor'),
            (42, 10, 'Doutor'),
            #Docentes PSS
			(43, 1, 'Mestre'),
            (44, 2, 'Mestre'),
            (45, 3, 'Mestre'),
            (46, 4, 'Mestre'),
            (47, 5, 'Mestre'),
            (48, 6, 'Mestre'),
            (49, 7, 'Mestre'),
            (50, 8, 'Mestre'); 

INSERT INTO DEPARTAMENTOS (idDepto, idGerente, nomeDepto)
VALUES 		(1, 1, 'RecursosHumanos'),
			(2, 2, 'CentroDeInformatica'),
			(3, 3, 'SetorFinanceiro'),
			(4, 4, 'SecretariaAcademica'),
			(5, 5, 'SecretariadeCurso'),
			(6, 6, 'CentroCienciasSociasAplicadas'),
			(7, 7, 'Biblioteca'),
			(8, 8, 'DivisaoJuridica'),
			(9, 9, 'SetorLimpeza'),
			(10, 10, 'DivisaodeEstagio');
            
INSERT INTO ESTAGIARIOS (idFunc, idSuperv, tempoDeEstagioAnos)
VALUES 		(11, 2, 2),
			(12, 2, 1),
			(13, 3, 1),
			(14, 3, 2),
			(15, 3, 2),
			(16, 4, 1),
			(17, 4, 2),
			(18, 5, 1),
			(19, 5, 2),
			(20, 5, 2);

INSERT INTO	FUNCPSS (idFunc, tempoDeContratoAnos)
VALUES 		#Agentes PSS
			(21, 2),
			(22, 1),
            #Docentes PSS
            (43, 2),
			(44, 2),
            (45, 2),
			(46, 3),
            (47, 2),
			(48, 1),
            (49, 1),
			(50, 1);
            
INSERT INTO TERCEIRIZADOS (idFunc, nomeEmpresa, telefoneEmpresa)
VALUES 		(23, 'Bibliotech',  '35236699'),
			(24, 'Bibliotech',  '35236699'),
			(25, 'Direitop',  '35239944'),
			(26, 'LimpraMax',  '35238744'),
			(27, 'LimpraMax',  '35238744'),
			(28, 'LimpraMax',  '35238744'),
			(29, 'LimpraMax',  '35238744'),
			(30, 'LimpraMax',  '35238744'),
			(31, 'LimpraMax',  '35238744'),
			(32, 'LimpraMax',  '35238744');
            
INSERT INTO TRABALHA (idFunc, idDepto)
VALUES 		#Agentes Concursados
			(1, 1),
			(2, 2),
			(3, 3),
			(4, 4),
			(5, 5),
			(6, 6),
			(7, 7),
			(8, 8),
			(9, 9),
			(10, 10),
            #Agentes Estagiarios
			(11, 2),
			(12, 2),
			(13, 3),
			(14, 3),
			(15, 3),
			(16, 4),
			(17, 4),
			(18, 5),
			(19, 5),
			(20, 5),
            #Agentes Pss 
            (21, 5),
			(22, 7),
            #Agentes Terceirizados
			(23, 7),
			(24, 8),
			(25, 9),
			(26, 9),
			(27, 9),
			(28, 9),
			(29, 9),
			(30, 9),
			(31, 9),
			(32, 10);

INSERT INTO CURSOS (idCurs, idColeg, nomeCurso)
VALUES		(1, 1, 'Bacharelado em Administracao'),
			(2, 2, 'Bacharelado em Contabilidade'),
			(3, 3, 'Bacharelado em Economia'),
			(4, 4, 'Licenciatura em Letras'),
			(5, 5, 'Licenciatura em Matematica'),
			(6, 6, 'Licenciatura em Geografia'),
			(7, 7, 'Licenciatura em Historia'),
			(8, 8, 'Engenharia de Producao Agro-Idustrial'),
			(9, 9, 'Bacharelado em Pedagogia'),
			(10, 10, 'Bacharelado em Turismo'),
			(11, 6, 'Bacharelado em Geografia'),
			(12, 4, 'Ingles basico'),
			(13, 4, 'Ingles medio'),
			(14, 4, 'Ingles avancado');

INSERT INTO DICIPLINAS (idDic, nomeDic, idProf, idCurs)
VALUES		(11 , 'TGA', 33, 1),
			(21 , 'Matematica para Contabilidade', 34, 2),
			(31 , 'Macroeconomia', 35, 3),
			(41 , 'Literatura', 36, 4),
			(51 , 'Ensino de Matematica Basica', 37, 5),
			(61 , 'Geoprocessamento', 38, 6),
			(71 , 'Historia Brasileira 1', 39, 7),
			(81 , 'Calculo de Eficiencia', 40, 8),
			(91 , 'Psico Pedagogia', 41, 9),
			(101 , 'Hospedagem', 42, 10),
			(12 , 'Administracao Rural', 43, 1),
			(22 , 'Probabilidade', 44, 2),
			(32 , 'Micro Economia', 45, 3),
			(42 , 'Generos Textuais', 46, 4),
			(52 , 'Ensino Matematica Avancada', 47, 5),
			(62 , 'Geografia Brasileira', 48, 6),
			(72 , 'Historia brasileira 2', 49, 7),
			(82 , 'Calculo 1', 50, 8),
			(92 , 'Pedagogia Infanto Juvenil', 41, 9),
			(102 , 'Gerenciamento de Hoteis', 42, 10);
