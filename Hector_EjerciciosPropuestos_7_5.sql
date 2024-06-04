SET SERVEROUTPUT ON;
CREATE OR REPLACE TYPE persona2 AS OBJECT(
    nombre VARCHAR2 (30),
    edad NUMBER (3),
    CONSTRUCTOR FUNCTION persona2 (nombre VARCHAR2, edad NUMBER)
RETURN SELF AS RESULT
);

CREATE OR REPLACE TYPE BODY persona2 AS
CONSTRUCTOR FUNCTION persona2 (
        nombre VARCHAR2,
        edad NUMBER
) RETURN SELF AS RESULT IS
    BEGIN
        SELF.nombre := nombre;
        SELF.edad := edad;
        RETURN;
    END;
END;
/
DECLARE
    V_persona persona2;
BEGIN
    V_persona := new persona2('Pepe','34');
    dbms_output.put_line(V_persona.nombre||' '||V_persona.edad);
END;