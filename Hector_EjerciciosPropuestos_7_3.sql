----------------------------------------------------------------------------------------------------------------------------------
--1º Tabla Codigo Postal
CREATE OR REPLACE TYPE TABJCODIGOP2 AS OBJECT(

    codProvincia number(2),
    codLocalidad number (3),

MEMBER PROCEDURE inicializarobjetoCodigoP (codProvincia NUMBER, codLocalidad NUMBER)
);
CREATE OR REPLACE TYPE BODY TABJCODIGOP2 AS
MEMBER PROCEDURE inicializarobjetoCodigoP (p_CodProvincia NUMBER, p_CodLocalidad NUMBER) IS
BEGIN
    codProvincia:=p_CodProvincia;
    codLocalidad:=p_CodLocalidad;

END inicializarobjetoCodigoP;
END;
/

DECLARE
--Creamos un codigo postal
    COD1 TABJCODIGOP2 := NEW TABJCODIGOP2 (47, 012);
BEGIN
--Mostramos el primer codigo postal
    DBMS_OUTPUT.PUT_LINE(cod1.codLocalidad);
--Añadimos un nuevo codigo postal llamado al metodo
    cod1.inicializarobjetoCodigoP(47,009);
    DBMS_OUTPUT.PUT_LINE(cod1.codLocalidad);
END;
/
----------------------------------------------------------------------------------------------------------------------------------
--2º Tabla domicilio
CREATE OR REPLACE TYPE tobjdomicilio2 AS OBJECT(

    tipoVia         VARCHAR2(30),
    nombreVia       VARCHAR2(30),
    numero          NUMBER(2),
    restoDomicilio  VARCHAR2(30),

MEMBER PROCEDURE inicializarObjetoDomicilio (p_tipoVia VARCHAR, p_nombreVia VARCHAR, p_numero VARCHAR, p_restoDomicilio VARCHAR)
);
CREATE OR REPLACE TYPE BODY tobjdomicilio2 AS
MEMBER PROCEDURE inicializarObjetoDomicilio (p_tipoVia VARCHAR, p_nombreVia VARCHAR, p_numero VARCHAR, p_restoDomicilio VARCHAR) IS
BEGIN
    tipoVia:=p_tipoVia;
    nombreVia:=p_nombreVia;
    numero:=p_numero;
    restoDomicilio:=p_restoDomicilio;

END inicializarObjetoDomicilio;
END;
----------------------------------------------------------------------------------------------------------------------------------
--3º Tabla nombre
DECLARE
    domi tobjdomicilio2 := NEW tobjdomicilio2 ('Avenida','Postigo',10,'1ºA');
BEGIN
    DBMS_OUTPUT.PUT_LINE(domi.tipoVia);
    domi.inicializarObjetoDomicilio('Calle','Darsena',30,'5ºB');
    DBMS_OUTPUT.PUT_LINE(domi.tipoVia);
END;
/

CREATE OR REPLACE TYPE tobjnombre2 AS OBJECT(

    nombre              VARCHAR2(30),
    sgApellido          VARCHAR2(30),
    prApellido          VARCHAR(30),

MEMBER PROCEDURE inicializarObjetoNombre (nombre VARCHAR, sgApellido VARCHAR, p_pr_apellido VARCHAR)
);
CREATE OR REPLACE TYPE BODY tobjnombre2 AS
MEMBER PROCEDURE inicializarObjetoNombre (nombre VARCHAR, sgApellido VARCHAR, p_pr_apellido VARCHAR) IS
BEGIN
    self.nombre:=nombre;
    self.sgApellido:=sgApellido;
    prApellido:=p_pr_apellido;

END inicializarObjetoNombre;
END;


DECLARE
    nombre tobjnombre2 := NEW tobjnombre2 ('Ángela','Negro','Castilla');
BEGIN
    DBMS_OUTPUT.PUT_LINE(nombre.nombre);
    nombre.inicializarObjetoNombre('Marcos','Blanco','Rodriguez');
    DBMS_OUTPUT.PUT_LINE(nombre.nombre);
END;
/
----------------------------------------------------------------------------------------------------------------------------------
--4º Tabla datos personales
CREATE OR REPLACE TYPE tobjdatosP2 AS OBJECT(

    codigoDP        VARCHAR2(5),
    codigoPostal    tabjcodigop2,
    domicilio       tobjdomicilio2,
    nombreCompleto  tobjnombre2,
    fechaNacimiento DATE,

MEMBER PROCEDURE inicializarObjetoDato (p_codigoDP VARCHAR, p_codigoPostal TABJCODIGOP2, p_domicilio tobjdomicilio2, p_nombreCompleto  tobjnombre2, p_fechaNacimiento DATE)
);
CREATE OR REPLACE TYPE BODY tobjdatosP2 AS
MEMBER PROCEDURE inicializarObjetoDato (p_codigoDP VARCHAR, p_codigoPostal TABJCODIGOP2, p_domicilio tobjdomicilio2, p_nombreCompleto  tobjnombre2, p_fechaNacimiento DATE) IS
BEGIN
    codigoDP:=p_codigoDP;
    codigoPostal:=p_codigoPostal;
    domicilio:=p_domicilio;
    nombreCompleto:=p_nombreCompleto;
    fechaNacimiento:=p_fechaNacimiento;

END inicializarObjetoDato;
END;


DECLARE
    dato tobjdatosP2:= new tobjdatosP2('A5', COD1, domi, nombre, '18/4/1991');
BEGIN
    DBMS_OUTPUT.PUT_LINE(dato.codigodp);
    dato.inicializarObjetoDato('A6', COD1, domi, nombre, '18/4/1991');
    DBMS_OUTPUT.PUT_LINE(dato.codigodp);
END;
/
set serveroutput on;