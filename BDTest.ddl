-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-05-28 23:17:59 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE user gerald identified by account unlock 
;

CREATE TABLE gerald.alternativa (
    idalternativa        NUMBER(20, 5) NOT NULL,
    puntajealternativa   FLOAT(126),
    estado               CHAR(1 BYTE),
    pregunta_idpregunta  NUMBER(10, 3) NOT NULL,
    enunciado            VARCHAR2(1000 CHAR)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.alternativa_pk ON
    gerald.alternativa (
        idalternativa
    ASC,
        pregunta_idpregunta
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.alternativa
    ADD CONSTRAINT alternativa_pk PRIMARY KEY ( idalternativa,
                                                pregunta_idpregunta )
        USING INDEX gerald.alternativa_pk;

CREATE TABLE gerald.autor (
    idautor  NUMBER(10, 3) NOT NULL,
    nombre   VARCHAR2(100 CHAR)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.autor_nombre_un ON
    gerald.autor (
        nombre
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX gerald.autor_pk ON
    gerald.autor (
        idautor
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.autor
    ADD CONSTRAINT autor_pk PRIMARY KEY ( idautor )
        USING INDEX gerald.autor_pk;

ALTER TABLE gerald.autor
    ADD CONSTRAINT autor_nombre_un UNIQUE ( nombre )
        USING INDEX gerald.autor_nombre_un;

CREATE TABLE gerald.autor_test (
    autor_idautor      NUMBER(10, 3) NOT NULL,
    evaluacion_idtest  NUMBER(10, 3) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.autor_test_pk ON
    gerald.autor_test (
        autor_idautor
    ASC,
        evaluacion_idtest
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.autor_test
    ADD CONSTRAINT autor_test_pk PRIMARY KEY ( autor_idautor,
                                               evaluacion_idtest )
        USING INDEX gerald.autor_test_pk;

CREATE TABLE gerald.estudiante (
    idestudiante         NUMBER(10, 3) NOT NULL,
    nombre               VARCHAR2(100 CHAR),
    primerapellido       VARCHAR2(100 CHAR),
    segundoapellido      VARCHAR2(100 CHAR),
    rut                  VARCHAR2(100 CHAR),
    programa_idprograma  NUMBER(10, 3) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.estudiante_pk ON
    gerald.estudiante (
        idestudiante
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.estudiante
    ADD CONSTRAINT estudiante_pk PRIMARY KEY ( idestudiante )
        USING INDEX gerald.estudiante_pk;

CREATE TABLE gerald.evaluacion (
    idtest               NUMBER(10, 3) NOT NULL,
    nombre               VARCHAR2(100 CHAR) NOT NULL,
    descripcion          VARCHAR2(200 BYTE),
    fechacreacion        DATE,
    puntajeprueba        FLOAT(126),
    programa_idprograma  NUMBER(10, 3)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.evaluacion_nombre_un ON
    gerald.evaluacion (
        nombre
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX gerald.evaluacion_pk ON
    gerald.evaluacion (
        idtest
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.evaluacion
    ADD CONSTRAINT evaluacion_pk PRIMARY KEY ( idtest )
        USING INDEX gerald.evaluacion_pk;

ALTER TABLE gerald.evaluacion
    ADD CONSTRAINT evaluacion_nombre_un UNIQUE ( nombre )
        USING INDEX gerald.evaluacion_nombre_un;

CREATE TABLE gerald.pregunta (
    idpregunta         NUMBER(10, 3) NOT NULL,
    enunciado          VARCHAR2(1000 CHAR),
    puntajepregunta    FLOAT(126),
    evaluacion_idtest  NUMBER(10, 3)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.pregunta_pk ON
    gerald.pregunta (
        idpregunta
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.pregunta
    ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta )
        USING INDEX gerald.pregunta_pk;

CREATE TABLE gerald.programa (
    idprograma  NUMBER(10, 3) NOT NULL,
    nombre      VARCHAR2(1000 CHAR)
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.programa_pk ON
    gerald.programa (
        idprograma
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.programa
    ADD CONSTRAINT programa_pk PRIMARY KEY ( idprograma )
        USING INDEX gerald.programa_pk;

CREATE TABLE gerald.resultado (
    idresultado              NUMBER(10, 3) NOT NULL,
    puntajeobtenido          FLOAT(126),
    cantidadcorrectas        FLOAT(126),
    cantidadincorrectas      FLOAT(126),
    nota                     FLOAT(126),
    estado                   CHAR(1 BYTE),
    estudiante_idestudiante  NUMBER(10, 3),
    evaluacion_idtest        NUMBER(10, 3) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.resultado_pk ON
    gerald.resultado (
        idresultado
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.resultado
    ADD CONSTRAINT resultado_pk PRIMARY KEY ( idresultado )
        USING INDEX gerald.resultado_pk;

CREATE TABLE gerald.unidad (
    idunidad             NUMBER(10, 3) NOT NULL,
    nombre               VARCHAR2(200 CHAR),
    descripcion          VARCHAR2(1000 CHAR),
    programa_idprograma  NUMBER(10, 3) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX gerald.unidad_pk ON
    gerald.unidad (
        idunidad
    ASC )
        TABLESPACE system PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE gerald.unidad
    ADD CONSTRAINT unidad_pk PRIMARY KEY ( idunidad )
        USING INDEX gerald.unidad_pk;

ALTER TABLE gerald.alternativa
    ADD CONSTRAINT alternativa_pregunta_fk FOREIGN KEY ( pregunta_idpregunta )
        REFERENCES gerald.pregunta ( idpregunta )
    NOT DEFERRABLE;

ALTER TABLE gerald.autor_test
    ADD CONSTRAINT autor_test_autor_fk FOREIGN KEY ( autor_idautor )
        REFERENCES gerald.autor ( idautor )
    NOT DEFERRABLE;

ALTER TABLE gerald.autor_test
    ADD CONSTRAINT autor_test_evaluacion_fk FOREIGN KEY ( evaluacion_idtest )
        REFERENCES gerald.evaluacion ( idtest )
    NOT DEFERRABLE;

ALTER TABLE gerald.estudiante
    ADD CONSTRAINT estudiante_programa_fk FOREIGN KEY ( programa_idprograma )
        REFERENCES gerald.programa ( idprograma )
    NOT DEFERRABLE;

ALTER TABLE gerald.evaluacion
    ADD CONSTRAINT evaluacion_programa_fk FOREIGN KEY ( programa_idprograma )
        REFERENCES gerald.programa ( idprograma )
    NOT DEFERRABLE;

ALTER TABLE gerald.pregunta
    ADD CONSTRAINT pregunta_evaluacion_fk FOREIGN KEY ( evaluacion_idtest )
        REFERENCES gerald.evaluacion ( idtest )
    NOT DEFERRABLE;

ALTER TABLE gerald.resultado
    ADD CONSTRAINT resultado_estudiante_fk FOREIGN KEY ( estudiante_idestudiante )
        REFERENCES gerald.estudiante ( idestudiante )
    NOT DEFERRABLE;

ALTER TABLE gerald.resultado
    ADD CONSTRAINT resultado_evaluacion_fk FOREIGN KEY ( evaluacion_idtest )
        REFERENCES gerald.evaluacion ( idtest )
    NOT DEFERRABLE;

ALTER TABLE gerald.unidad
    ADD CONSTRAINT unidad_programa_fk FOREIGN KEY ( programa_idprograma )
        REFERENCES gerald.programa ( idprograma )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                            11
-- ALTER TABLE                             20
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
-- CREATE USER                              1
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
