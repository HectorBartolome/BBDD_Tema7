DECLARE
    EMPLEADO1 profesor;
    EMPLEADO2 alumno;
BEGIN
    CP tobjcodigop:=tobjcodigop(003,28);
    DOMIC tobjdomicilio:= tobjdomicilio('Plaza','España',103,,'1oA');
    NOMB tobjnombre:= tobjnombre ('Dolores','SANCHEZ','GOMEZ,');
    OBDP tobjdatosP:= tobjdatosP('20987',CP,DOMIC,NOMB,'04/05/1975');
    EMPLEADO1:= NEW profesor('1/9/2021',OBDP);
    EMPLEADO2:= NEW alumno (4,4,5,7,tobjdatosP('18943',tobjcodigop(660,28),tobjdomicilio('calle','Laguna,',12,,'Boadilla del Monte'),tobjnombre('Luis','MARIN','SOL,'),'30/01/2002'));
END;
/