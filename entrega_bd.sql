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
        foreign key(idGerente) references FUNCIONARIOS(id)
);


create table COLEGIADOS(
    idColeg integer primary key,
        NomeColeg VARCHAR(30)
);


create table ESTAGIARIOS(
    idFunc integer primary key,
        idSuperv integer,
        dataSaida date,
        foreign key(idSuperv) references FUNCIONARIOS(id),
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table FUNCPSS(
    idFunc integer primary key,
    dataSaida date,
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table TERCEIRIZADO(
    idFunc integer primary key,
        nomeEmpresa varchar(40),
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table CONCURSADO(
    idFunc integer primary key,
        foreign key(idFunc) references FUNCIONARIOS(id) ON DELETE CASCADE
);


create table TRABALHA(
    idFunc integer,
        idDepto integer,
        primary key (idFunc, idDepto),
        foreign key(idFunc) references FUNCIONARIOS(id),
        foreign key(idDepto) references DEPARTAMENTOS(idDepto)
);


create table DICIPLINA(
    idDicip integer primary key,
        idColeg integer,
        foreign key(idColeg) references COLEGIADOS(idColeg)
);