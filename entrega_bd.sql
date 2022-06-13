DROP TABLE IF EXISTS TRABALHA;
DROP TABLE IF EXISTS TERCEIRIZADO;
DROP TABLE IF EXISTS ESTAGIARIO;
DROP TABLE IF EXISTS CONCURSADO;
DROP TABLE IF EXISTS FUNCPSS;
DROP TABLE IF EXISTS DOCENTES;
DROP TABLE IF EXISTS AGENTES;
DROP TABLE IF EXISTS DICIPLINAS;
DROP TABLE IF EXISTS CURSOS;
DROP TABLE IF EXISTS COLEGIADOS;
DROP TABLE IF EXISTS DEPARTAMENTOS;
DROP TABLE IF EXISTS FUNCIONARIOS;

##### link para o git https://github.com/Phocosta/TrabalhodeBD


create table FUNCIONARIOS(
    id INTEGER primary key,
        NomeFunc varchar(80),
        dataEntrada date
);


create table AGENTES(
    idFunc integer primary key,
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);
    
create table DOCENTES(
    idFunc integer primary key,
        idColeg integer,
        foreign key(idColeg) references COLEGIADOS(idColeg),
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table DEPARTAMENTOS(
    idDepto integer primary key,
        idGerente integer,
        NomeDepto VARCHAR(40),
        foreign key(idGerente) references CONCURSADO(idFunc)
);


create table COLEGIADOS(
    idColeg integer primary key,
    NomeColeg VARCHAR(30),
    idCord integer,
    foreign key(idCord) references CONCURSADO(idFunc)
);


create table ESTAGIARIOS(
    idFunc integer primary key,
        idSuperv integer,
        dataSaida date,
        foreign key(idSuperv) references CONCURSADO(idFunc),
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table FUNCPSS(
    idFunc integer primary key,
    dataSaida date,
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table TERCEIRIZADOS(
    idFunc integer primary key,
        nomeEmpresa varchar(40),
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table CONCURSADOS(
        idFunc integer primary key,
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table TRABALHA(
        idFunc integer,
        idDepto integer,
        primary key (idFunc, idDepto),
        foreign key(idFunc) references AGENTE(idFunc),
        foreign key(idDepto) references DEPARTAMENTOS(idDepto)
);


create table CURSOS(
        idCurs integer primary key,
        idColeg integer,
        foreign key(idColeg) references COLEGIADOS(idColeg)
);


create table DICIPLINAS(
        idDicip integer primary key,
        idCurs integer,
        foreign key(idCurs) references Cursos(idCurs)
);
