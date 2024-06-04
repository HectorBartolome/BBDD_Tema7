SET SERVEROUTPUT ON;
--creacion objetos
CREATE OR REPLACE TYPE EMPLEADO AS OBJECT(
    dni VARCHAR2(9),
    nombre VARCHAR2 (30),
    apellido1 VARCHAR2(30),
    apellido2 VARCHAR2(39),
    telefono NUMBER (3),
    CONSTRUCTOR FUNCTION EMPLEADO (dni VARCHAR2,nombre VARCHAR2,apellido1 VARCHAR2,apellido2 VARCHAR2, telefono NUMBER)
RETURN SELF AS RESULT
)NOT FINAL;

CREATE OR REPLACE TYPE INSPECTOR UNDER EMPLEADO(
    especialidad VARCHAR2(30)
);
CREATE OR REPLACE TYPE POLICIA UNDER EMPLEADO(
    categoria VARCHAR2(30),
    salarioBase NUMBER (6,2),
    MEMBER FUNCTION calcularSalario(salarioBase NUMBER) RETURN NUMBER
);

--creacion funcion 
CREATE OR REPLACE TYPE BODY POLICIA AS
MEMBER FUNCTION calcularSalario(salarioBase NUMBER) RETURN NUMBER IS
    V_salarioFinal NUMBER(6,2);
    V_salarioBase NUMBER :=salarioBase;
    BEGIN
        IF (self.categoria='LOCAL') THEN
            V_salarioFinal:=V_salarioBase*1.05;
        ELSIF (self.categoria='NACIONAL') THEN
            V_salarioFinal:=V_salarioBase*1.15;
        ELSIF (self.categoria='OPERACIONES ESPECIALES') THEN
            V_salarioFinal:=V_salarioBase*1.20;
        END IF;

        RETURN V_salarioFinal;
    END;
END;
/
--CREACION DE TABLAS
CREATE TABLE POLICIAS OF POLICIA;
CREATE TABLE INSPECTORES OF INSPECTOR;
