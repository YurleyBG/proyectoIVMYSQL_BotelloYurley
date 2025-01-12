use CampusLands_ERP;

-- 1.cree un procedimiento que registre nuevos campers

Delimiter //
Create procedure regitrar_camper(in nombre1 varchar(35), in nombre2 varchar(35) ,in apellido1 varchar(35),
in apellido2 varchar(35),in fecha_Nacimiento date,in direccion varchar(50),in acudiente varchar(50),in telefono varchar(15) ,
in sexo enum('F','M'),in nivel_Riesgo enum('Bajo','Medio','Alto') ,in id_estado int)
begin
	INSERT INTO Campers (nombre1, nombre2, apellido1, apellido2, fecha_Nacimiento, direccion, acudiente, telefono, sexo, nivel_Riesgo, id_estado) 
	VALUES (nombre1, nombre2, apellido1, apellido2, fecha_Nacimiento, direccion, acudiente, telefono, sexo, nivel_Riesgo, id_estado) ;
end //
 Delimiter ;
call regitrar_camper('yurley',null,'Botello','Garcia','2007-02-22','cre 5e 2-65 abañales','Ana rosa','3087654839','F','Bajo',4);

-- 2.cree un procedimiento que actualice el estado del camper

Delimiter //
Create procedure actualizar_estado(in id_in int, in new_estado int)
begin
	Update campers set id_estado = new_estado where id = id_in;
end // 
Delimiter ;

call actualizar_estado(40,4);

-- 3.cree un procedimiento que inserte nuevos estados

Delimiter //
Create procedure Ingresar_estados(in estado varchar(50))
begin
	INSERT INTO Tipo_Estado (estado) VALUES (estado);
end//
 Delimiter ;
call Ingresar_estados('Completo');

-- 4.cree un procedimiento que inserte la nuevas inscripciones a otra ruta para los campers

Delimiter //
Create procedure Ingresar_inscripciones(in id_camper int,
in fecha_Inscripcion date,in id_ruta int,in fecha_inicio date ,in fecha_estimada_fin date ,in id_estado int)
begin
	INSERT INTO Inscripcion_camper_rutas(id_camper, fecha_Inscripcion, id_ruta, fecha_inicio, fecha_estimada_fin, id_estado)VALUES
    (id_camper, fecha_Inscripcion, id_ruta, fecha_inicio, fecha_estimada_fin, id_estado);
end// 
Delimiter ;
call Ingresar_inscripciones(41,'2025-01-11',4,'2025-01-13','2025-06-13',2);


-- 5.cree un procedimiento que permita ingresar las notas de un respetivo modulo
Delimiter //
Create procedure Ingresar_Notas(in Nota_teorica int ,in Nota_Practica int ,in Nota_trabajo_quiz int,in Nota_final int ,in id_modulo int )
begin
	INSERT INTO Evaluaciones_modulos (Nota_teorica, Nota_Practica, Nota_trabajo_quiz, Nota_final, id_modulo)
	VALUES(Nota_teorica, Nota_Practica, Nota_trabajo_quiz, Nota_final, id_modulo);
end// 
 Delimiter ;

call Ingresar_Notas(89,97,95,94,4);

-- 6.crea un procedimieno que permita actualizar las nota practica de un modulo segun la id

Delimiter //
Create procedure actualizar_nota_practica(in id_in int, in new_nota int)
begin
	Update evaluaciones_modulos set Nota_Practica = new_nota where id = id_in;
end // 
Delimiter ;

call actualizar_nota_practica(1,75);

-- 7.crea un procedimiento que permita actualizar el salon en donde se llevara una respectiva clase 

Delimiter //
Create procedure actualizar_salon(in id_in int, in new_Idsalon int)
begin
	Update areas set id_salon = new_Idsalon where id = id_in;
end // 
Delimiter ;

call actualizar_salon(1,7);

-- 8.crea un procedimiento que permita registrar nuevas rutas

Delimiter //
Create procedure Ingresar_rutas(in nombre varchar(100),in fecha_inicio date ,in fecha_fin date,in id_modulo int)
begin

	INSERT INTO Ruta (nombre, fecha_inicio, fecha_fin, id_modulo)VALUES(nombre, fecha_inicio, fecha_fin, id_modulo);
end //
 Delimiter ;

call Ingresar_rutas('Java_exper','2025-01-11','2025-06-13',4);

-- 9.crea un procedimiento que permita registrar nuevos modulos

Delimiter //
Create procedure Ingresar_modulo(in nombre varchar(100),in Horas_totales int,in id_componentes int,in id_estado int )
begin
	INSERT INTO Modulos (nombre, Horas_totales, id_componentes, id_estado) VALUES(nombre, Horas_totales, id_componentes, id_estado);
end//
 Delimiter ;

call Ingresar_modulo('Java',120,4,9);

-- 10.crea un procedimieto que permita eliminar rutas

delimiter //
create procedure eliminar_ruta (in id_ruta int)
begin 	
	declare eliminar int;
    set eliminar= (select count(*) from ruta where ruta.id=id_ruta);
    if eliminar = 1 then 
		delete from ruta where ruta.id=id_ruta;
    else 
     signal sqlstate '45000' set message_text = 'No hay empleado con esta id';
	end if ;
end //
delimiter ;

call eliminar_ruta(46);
select * from ruta;

-- 11. crea un procedimiento que permita registrar nuevos reportes

Delimiter //
Create procedure Ingresar_reporte(in id_Ruta int,infecha date,in cantidad_campers_aprobaron int ,in nota_promedio int ,in horas_utilizadas int,in tasa_exito  float )
begin
INSERT INTO Reportes (id_Ruta, fecha, cantidad_campers_aprobaron, nota_promedio, horas_utilizadas, tasa_exito) VALUES
(id_Ruta, fecha, cantidad_campers_aprobaron, nota_promedio, horas_utilizadas, tasa_exito) ;
	
end //
 Delimiter ;

call Ingresar_reporte(4, '2025-01-11', 1, 94, 120, 0.1) ;

-- 12.crea un procedimiento que permita actualizar la rutas y trainers en los horarios

Delimiter //
Create procedure actualizar_ruta_trainer(in id_in int, in new_Idruta int,in new_idtrainer int)
begin
	Update horario set id_ruta= new_Idruta , id_trainer=new_idtrainer where id = id_in;
end // 
Delimiter ;

call actualizar_ruta_trainer(1,3,3);

-- 13.crea un procedimiento que actualice el estado de los modulos

Delimiter //
Create procedure actualizar_estado_modulo(in id_in int, in new_idestado int)
begin
	Update modulos set id_estado= new_idestado  where id = id_in;
end // 
Delimiter ;

call actualizar_estado_modulo(1,7);

-- 14.crea un procedimiento que actualice el nivel de complejidad de los componente de cada modulo

Delimiter //
Create procedure actualizar_complejidad(in id_in int, in new_complejidad varchar(20))
begin
	Update componentes_modulos set nivel_complejidad= new_complejidad  where id = id_in;
end // 
Delimiter ;

call actualizar_complejidad(1,'Medio');

-- 15.crea un procedimiento que actualice las horas semanales del horario

Delimiter //
Create procedure actualizar_horassemanales(in id_in int, in new_horas int)
begin
	Update horario set horas_semanales= new_horas  where id = id_in;
end // 
Delimiter ;

call actualizar_horassemanales(1,20);

-- 16.cree un procedimiento que ingrese nuevo trainers

Delimiter //
Create procedure Ingresar_trainer( nombre1 varchar(35), in nombre2 varchar(35) ,in apellido1 varchar(35) ,in apellido2 varchar(35),
in echa_Nacimiento date,in direccion varchar(50), in email varchar(50),in telefono varchar(15) ,in id_Ruta int)
begin
	INSERT INTO Trainers (nombre1, nombre2, apellido1, apellido2, fecha_Nacimiento, direccion, email, telefono, id_Ruta)
    VALUES(nombre1, nombre2, apellido1, apellido2, fecha_Nacimiento, direccion, email, telefono, id_Ruta);
	
end //
 Delimiter ;

call Ingresar_trainer ('yefi', 'Alexander', 'Martínez', 'calderon', '1997-07-20', 'Carrera 45 # 10-55, Bucaramanga', 'yefi.martinez@correo.com', '3021234565', 4) ;

-- 17.cree un procedimiento que actualice la cantidad de campers en el area segun la id

Delimiter //
Create procedure actualizar_cantidad_campers(in id_in int, in new_cantidad int)
begin
	Update areas set cantidad_campers= new_cantidad  where id = id_in;
end // 
Delimiter ;

call actualizar_cantidad_campers(1,2);

-- 18.cree un procedimiento que actualice la tasa de exito

Delimiter //
Create procedure actualizar_tasaexito(in id_in int, in new_exito float)
begin
	Update reportes set tasa_exito= new_exito  where id = id_in;
end // 
Delimiter ;

call actualizar_tasaexito(1,1.5);

-- 19.cree un procedimiento actualice la cantidad de campers aprobado 

Delimiter //
Create procedure actualizar_cantidad_campers_aprobados(in id_in int, in new_cantidad int)
begin
	Update reportes set cantidad_campers_aprobaron= new_cantidad  where id = id_in;
end // 
Delimiter ;

call actualizar_cantidad_campers_aprobados(1,20);

-- 20.cree un procedimiento que elimine area segun la id ingresada

delimiter //
create procedure eliminar_area (in id_area int)
begin 	
	declare eliminar int;
    set eliminar= (select count(*) from areas where areas.id=id_area);
    if eliminar = 1 then 
		delete from areas where areas.id=id_area;
    else 
     signal sqlstate '45000' set message_text = 'No hay empleado con esta id';
	end if ;
end //
delimiter ;

call eliminar_area(30);
select * from areas;