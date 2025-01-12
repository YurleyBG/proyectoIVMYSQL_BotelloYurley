use CampusLands_ERP;

-- 1.crea una funcion que calcule la nota teorica al multiplicar esta por 30 y dividirla en 100

delimiter //
create function calcular_nota_teorica (id_evaluacion int)
returns int deterministic
begin
	declare nota int;
    set nota=(select nota_teorica*30/100 as nota_teorica from evaluaciones_modulos where id=id_evaluacion);
    return nota;
end //
delimiter ;

select calcular_nota_teorica(1);
-- 2.crea una funcion que calcule la nota practica al multiplicar esta por 60 y dividirla en 100

delimiter //
create function calcular_nota_prectica(id_evaluacion int)
returns int deterministic
begin
	declare nota int;
    set nota=(select nota_teorica*60/100 as nota_teorica from evaluaciones_modulos where id=id_evaluacion);
    return nota;
end //
delimiter ;

select calcular_nota_prectica(1);

-- 3.crea una funcion que calcule la nota quiz y trabajos al multiplicar esta por 10 y dividirla en 100

delimiter //
create function  calcular_nota_quiztrabajos(id_evaluacion int )
returns int deterministic
begin
	declare nota int;
    set nota=(select nota_teorica*10/100 as nota_teorica from evaluaciones_modulos where id=id_evaluacion);
    return nota;
end //
delimiter ;

select calcular_nota_quiztrabajos(1);

-- 4.crear una funcion que calcule la nota final

delimiter //
create function calcular_nota_final(id_evaluacion int)
returns float deterministic
begin
		declare Nota float;
        set Nota=(select nota_teorica*30/100 + Nota_Practica*60/100 +  Nota_trabajo_quiz*10/100 as nota_final from evaluaciones_modulos);
        return Nota;
end //
delimiter ;

select calcular_nota_final(1);

-- 5.crear una funcion que diga si el camper aprobo o desaprobo segun su nota final

delimiter //
create function  Estado_Historial_Academico(id_evaluacion int, id_campercito int)
returns varchar(30) deterministic
begin
	 declare estado varchar(30);
     declare nota_final int;
     set nota_final=(select nota_final from evaluaciones_modulos where id=id_evaluacion);
     if nota_final>=60 then 
		update historial_academico set id_estado=4 where id_camper=id_campercito;
	 end if ;
	if nota_final<60 then
		update historial_academico set id_estado=3 where id_camper=id_campercito;
	end if ;
	
   set estado=(select te.estado from tipo_estado te inner join historial_academico ha on te.id_estado=ha.id);
   return estado;
    
end //
delimiter ;
select Estado_Historial_Academico(1,1);

-- 6.crear una funcion que segun la nota final muestre cual fue el camper con mejor resultado 

delimiter //
create function mejor_camper ()
returns varchar(80) deterministic
begin
	 declare camper varchar(80);
     set camper=(select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper from(select  nota_teorica*30/100 + Nota_Practica*60/100 +  Nota_trabajo_quiz*10/100 as nota_final
		from historial_academico inner join campers on campers.id=historial_academico.id_camper inner join evaluaciones_modulos 
		on  historial_academico.id_Evaluaciones_modulos=evaluaciones_modulos.id group by 1,2 order by 2 desc limit 1)as obtener );
     return camper;
end //
delimiter ;
select mejor_camper();

-- 7.crear una funcion que calcule el promedio de campers mujeres registradas

delimiter //
create function promedio_mujeres ()
returns int deterministic
begin
  declare promedio int;
  set promedio =(select avg(suma) from (select sum(id) from campers where sexo='F')as obtener);
  return promedio;
end //
delimiter ;

select  promedio_mujeres();

-- 8.crear una funcion que calcule el promedio de campers hombres  registrados

delimiter //
create function promedio_hombres()
returns int deterministic
begin
  declare promedio int;
  set promedio =(select avg(suma) from (select sum(id) from campers where sexo='M')as obtener);
  return promedio;
end //
delimiter ;

select  promedio_hombres();

-- 9.crear una funcion que calcule la cantidad de estudiantes aprobados

delimiter //
create function campers_aprobados()
returns int deterministic
begin
	declare aprobados int ;
    set aprobados=(select count(*) as cantidad_aprobado from historial_academico ha inner join tipo_estado te on ha.id_estado=te.id where te.estado='Aprobado');
    return aprobados;
end //
delimiter ;
select campers_aprobados();

-- 10.crear una funcion que calcule la cantidad de estudiantes desaprobados

delimiter //
create function campers_Desaprobados()
returns int deterministic
begin
	declare Desaprobados int ;
    set Desaprobados=(select count(*) as cantidad_Desaprobados from historial_academico ha inner join tipo_estado te on ha.id_estado=te.id where te.estado='Desaprobados');
    return Desaprobados;
end //
delimiter ;
select campers_Desaprobados();

-- 11.crear una funcion que muestre el nombre de la ruta segun la id ingresada
delimiter //
create function ruta_nombre(id_ruta int)
returns varchar(50) deterministic
begin
	declare ruta varchar(50);
    set ruta=(select nombre from ruta where id = id_ruta);
    return ruta;
end //
delimiter ;

select ruta_nombre(1);

-- 12. crear una funcion que muestre el nombre del modulo segun la id ingresada

delimiter //
create function modulo_nombre(id_modulo int)
returns varchar(80) deterministic
begin
	declare modulo varchar(80);
    set modulo=(select nombre from modulos where id = id_modulo);
    return modulo;
end //
delimiter ;

select modulo_nombre(1);

-- 13.crear una funcion muestre la cantidad de dias que se destinan para un modulo segun la id ingresada

delimiter //
create function  cantidad_dias( id_b int)
returns int deterministic
begin
	 declare dias_totales int;
	 set dias_totales=(select datediff(fecha_fin,fecha_inicio)from ruta where id=id_b);
	 return dias_totales;
end //
delimiter ;
select cantidad_dias(1);
-- 14.crear una funcion que muestre el camper de mayor edad

delimiter //
create function camper_mayor()
returns int deterministic
begin
	 declare camper varchar(80);
	 set camper =(select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer from(select 2024-year(fecha_nacimiento) as edad from campers 
	 order by 2 asc limit 1 )as obtener);
     return camper;
end //
delimiter ;
select camper_mayor();

-- 15.crear una funcion que muestre el camper de menor edad

delimiter //
create function camper_menor()
returns int deterministic
begin
	 declare camper varchar(80);
	 set camper =(select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper  from(select 2024-year(fecha_nacimiento) as edad from campers
	 order by 2 asc limit 1 )as obtener);
     return camper;
end //
delimiter ;
select camper_menor();

-- 16.crear una funcion que muestre el trainer de menor edad

delimiter //
create function  trainer_menor()
returns int deterministic
begin
	 declare trainer varchar(80);
	 set trainer =(select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer from(select 2024-year(fecha_nacimiento) as edad from trainers 
	 order by 2 asc limit 1 )as obtener);
     return trainer;
end //
delimiter ;
select trainer_menor();

-- 17.crear una funcion que muestre el trainer de mayor edad

delimiter //
create function  trainer_mayor()
returns int deterministic
begin
	 declare trainer varchar(80);
	 set trainer =(select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer from(select 2024-year(fecha_nacimiento) as edad from trainers 
	 order by 2 desc limit 1 )as obtener);
     return trainer;
end //
delimiter ;
select trainer_mayor();

-- 18.crear una funcion que muestre el nivel de riesgo del camper segun la id

delimiter //
create function  nivel_riesgo_camper(id_camper int )
returns varchar(30) deterministic
begin
	declare nivel_riesgo varchar(30);
    set nivel_riesgo=(select nivel_riesgo from campers where id=id_camper);
    return nivel_riesgo;
end //
delimiter ;
select nivel_riesgo_camper(2);

-- 19.crear una funcion que muestre la ruta del trainer 

delimiter //
create function ruta_trainer( id_trainer int)
returns varchar(100) deterministic
begin
	declare ruta varchar(100);
    set ruta=(select nombre from trainer t inner join ruta r on r.id=t.id-ruta  where t.id=id_trainer);
    return ruta;
end //
delimiter ;
select ruta_trainer(1);

-- 20.crear una funcion que muestre los componente segun la id ingresada

delimiter //
create function componentes(id_componente int)
returns varchar(50) deterministic
begin
	declare componente varchar(50);
    set componente=(select componentes from componentes_modulos where id = id_componente);
    return componente;
end //
delimiter ;
select componentes(1)