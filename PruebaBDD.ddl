-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-15 17:12:40 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE altern CASCADE CONSTRAINTS;

DROP TABLE alum CASCADE CONSTRAINTS;

DROP TABLE curso CASCADE CONSTRAINTS;

DROP TABLE preguntas CASCADE CONSTRAINTS;

DROP TABLE program CASCADE CONSTRAINTS;

DROP TABLE result CASCADE CONSTRAINTS;

DROP TABLE test CASCADE CONSTRAINTS;

CREATE TABLE altern (
    idaltern           INTEGER NOT NULL,
    descripaltern      VARCHAR2(100 CHAR),
    correcta           CHAR(1),
    porcentaltern      FLOAT(2),
    preguntas_idpregu  INTEGER NOT NULL
);

ALTER TABLE altern ADD CONSTRAINT altern_pk PRIMARY KEY ( idaltern );

CREATE TABLE alum (
    idalum         INTEGER NOT NULL,
    nombalum       VARCHAR2(100 CHAR),
    curso_idcurso  INTEGER NOT NULL
);

ALTER TABLE alum ADD CONSTRAINT alum_pk PRIMARY KEY ( idalum );

CREATE TABLE curso (
    idcurso            INTEGER NOT NULL,
    nombcurso          VARCHAR2(200 CHAR),
    program_idprogram  INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( idcurso );

CREATE TABLE preguntas (
    idpregu      INTEGER NOT NULL,
    enuncpreg    VARCHAR2(200 CHAR),
    puntajepreg  FLOAT(3),
    test_idtest  INTEGER NOT NULL
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( idpregu );

CREATE TABLE program (
    idprogram    INTEGER NOT NULL,
    nombprogram  VARCHAR2(100 CHAR)
);

ALTER TABLE program ADD CONSTRAINT program_pk PRIMARY KEY ( idprogram );

CREATE TABLE result (
    alum_idalum        INTEGER NOT NULL,
    preguntas_idpregu  INTEGER NOT NULL,
    idresult           INTEGER NOT NULL,
    alter1             CHAR(1),
    alter2             CHAR(1),
    alter3             CHAR(1),
    alter4             CHAR(1),
    dateresult         DATE,
    puntaje            FLOAT(3)
);

ALTER TABLE result ADD CONSTRAINT result_pk PRIMARY KEY ( alum_idalum,
                                                          preguntas_idpregu );

CREATE TABLE test (
    idtest       INTEGER NOT NULL,
    nombtest     VARCHAR2(100 CHAR),
    descripcion  VARCHAR2(100 CHAR),
    autortest    VARCHAR2(100 CHAR)
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( idtest );

ALTER TABLE altern
    ADD CONSTRAINT altern_preguntas_fk FOREIGN KEY ( preguntas_idpregu )
        REFERENCES preguntas ( idpregu );

ALTER TABLE alum
    ADD CONSTRAINT alum_curso_fk FOREIGN KEY ( curso_idcurso )
        REFERENCES curso ( idcurso );

ALTER TABLE curso
    ADD CONSTRAINT curso_program_fk FOREIGN KEY ( program_idprogram )
        REFERENCES program ( idprogram );

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_test_fk FOREIGN KEY ( test_idtest )
        REFERENCES test ( idtest );

ALTER TABLE result
    ADD CONSTRAINT result_alum_fk FOREIGN KEY ( alum_idalum )
        REFERENCES alum ( idalum );

ALTER TABLE result
    ADD CONSTRAINT result_preguntas_fk FOREIGN KEY ( preguntas_idpregu )
        REFERENCES preguntas ( idpregu );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
