CREATE TYPE tobjcodigop AS OBJECT(
    localidad          NUMBER(3),
    provincia          NUMBER(2)  
);
CREATE TYPE tobjdomicilio AS OBJECT(
    tipoVia         VARCHAR2(30),
    nombreVia       VARCHAR2(30),
    numero          NUMBER(2),
    restoDomicilio  VARCHAR2(30)
);
CREATE TYPE tobjnombre AS OBJECT(
    nombre              VARCHAR2(30),
    sgApellido          VARCHAR2(30),
    prApellido          VARCHAR(30)
);
CREATE TYPE tobjdatosP AS OBJECT(
    codigoDP        VARCHAR2(5),
    codigoPostal    tobjcodigop,
    domicilio       tobjdomicilio,
    nombreCompleto  tobjnombre,
    fechaNacimiento DATE
);