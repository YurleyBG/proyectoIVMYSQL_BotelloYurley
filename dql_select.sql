use CampusLands_ERP;

-- 1.realizar una consulta que permita extraer los campers que estan en proceso de ingreso

select nombre1,nombre2,apellido1,apellido2 from campers where id_estado=1;

-- 2.realizar una consulta que permita extraerlos campers que estan en Inscrito

select nombre1,nombre2,apellido1,apellido2 from campers where id_estado=2;

-- 3.hacer una consulta que muestre los estados

select * from Tipo_estado;

-- 4.calcular la edad de los camper segun su fecha de nacimiento

select  nombre1,nombre2,apellido1,apellido2, 2024-year(fecha_nacimiento) as edad from campers;

-- 5.hacer una consulta que muetres cuantos campers son menores de edad

select  nombre1,nombre2,apellido1,apellido2,count(*) from campers where 2024-year(fecha_nacimiento)<18 group by 1,2,3,4 ;

-- 6.crear una consulta que permita ver los campers con riesgos alto que el nombre se muestre en una sola columna

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Camper , nivel_riesgo from campers where nivel_riesgo='alto';

-- 7.crear una consulta que permita ver los campers con riesgos medios que el nombre se muestre en una sola columna

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Camper , nivel_riesgo from campers where nivel_riesgo='medio';

-- 8.hacer una consulta que muestre la cantidad de campers que son mujeres 

select count(*) as cantidad_mujeres from campers where sexo='F';

-- 9.hacer una consulta que muestre la cantidad de campers que son hombres

select count(*) as cantidad_hombres from campers where sexo='M';

-- 10.hacer una consulta que muestre todo los datos de los campers que tienen el apellido garcia 

select * from campers where apellido1='garcia' or apellido2='garcia';

-- 11. mostrar los componentes que tengan un nivel de complejidad bajo 

select * from componentes_modulos where nivel_complejidad='bajo';

-- 12.mostrar los componentes que tengan un nivel de complejidad alto

select * from componentes_modulos where nivel_complejidad='alto';

-- 13.mostrar los modulos con sus componentes o lenguajes a ver

select  nombre, componentes from modulos m inner join componentes_modulos cm on m.id_componentes=cm.id;

-- 14. cual es el estado de los modulos

select estado from modulos m inner join Tipo_Estado tm on m.id_estado=tm.id ;

-- 15.crear una consulta que muestre el nombre de la ruta con su modulo correspondiente

select r.nombre as ruta, m.nombre as modulos from ruta r inner join modulos m on r.id_modulo=m.id;

-- 16.crear una consulta que muestre la ruta , el modulo y componentes

select r.nombre as ruta, m.nombre as modulos,componentes from ruta r inner join modulos m on r.id_modulo=m.id inner join  Componentes_Modulos c 
on m.id_componentes=c.id;

-- 17. crear una consulta  que calcule el total de dias que se tienen previstos

select timedatediff( fecha_fin, fecha_inicio) as dias from ruta;

-- 18.mostrar la tabla Inscripcion_camper_rutas

select * from Inscripcion_camper_rutas;

-- 19.mostrar a que ruta se registro cada camper

select id_camper, r.nombre from Inscripcion_camper_rutas icr inner join ruta r on icr.id_ruta=r.id;

-- 20.muestre la cantidad de dias que se estiman para la rutas que eligio cada camper

select r.nombre, datediff( fecha_estimada_fin, icr.fecha_inicio) as dias from Inscripcion_camper_rutas icr inner join ruta r 
on icr.id_ruta=r.id group by 1,2;

-- 21.mostrar la tabla salon 

select * from  salones;

-- 22.calcular cuantas rutas se ven en cada salon

select count(s.id) as cantidad , r.nombre from salones s inner join  areas a on a.id_salon=s.id inner join  horario h 
on a.id_horario=h.id inner join ruta r on h.id_ruta=r.id group by 2;

-- 23.mostrar la tabla trainers

select * from trainers;

-- 24.muestre solo los nombre1 que comiencen que con h

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer from trainers where left(nombre1, 1)='h' ;

-- 25.  muestre el trainer que su nuemero de telefono termine en 4

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer from trainers where right(telefono, 1)=4 ;

-- 26.muestre el horario de cada trainer

select t.id , h.hora_inicio, h.hora_fin from trainers t inner join horario h on t.id=h.id_trainer;

-- 27.muestre la ruta que tiene cada trainer

select t.id , r.nombre from trainers t inner join ruta r on t.id_ruta=r.id;

-- 28.muestre la edad de cada trainer segun su fecha de nacimiento

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer , 2024-year(fecha_nacimiento) from trainers ;

-- 29.muestre los nombres de los trainers que tengan en su apellido garcia

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer  from trainers where apellido1='garcia' or apellido2='garcia';

-- 30.muestre la tabla horario 

select * from horarios;

-- 31.muestre las rutas que se ven en el horario de 6am hasta las 10am 

select r.nombre from ruta r inner join horario h on h.id_ruta=r.id where hora_inicio='06:00' and hora_fin='10:00';

-- 32.muestre las rutas que se ven en el horario de 10am hasta las 2pm

select r.nombre from ruta r inner join horario h on h.id_ruta=r.id where hora_inicio='10:00' and hora_fin='14:00';

-- 33.muestre las rutas que se ven en el horario de 2pm hasta las 6pm

select r.nombre from ruta r inner join horario h on h.id_ruta=r.id where hora_inicio='14:00' and hora_fin='18:00';

-- 34.calcular la cantidad de horas semanales que tiene cada ruta(solo hay clase 5 dias a la semana) teniendo en cuenta que cada ruta dicta clase de 4 horas

select id_ruta, sum(horas_semanales*5) as horas_semanales from horario group by 1 ;

-- 35.muestre los trainers que se trabajan en el horario de 6am hasta las 10am 

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer  
from trainers t inner join horario h on h.id_trainer=t.id where hora_inicio='06:00' and hora_fin='10:00';

-- 36.muestre los trainers que se trabajan en el horario de 10am hasta las 2pm 

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer 
from trainers t inner join horario h on h.id_trainer=t.id where hora_inicio='10:00' and hora_fin='14:00';

-- 37.muestre los trainers que se trabajan en el horario de 2pm hasta las 6pm

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer  
from trainers t inner join horario h on h.id_trainer=t.id where hora_inicio='14:00' and hora_fin='18:00';

-- 38.calculec cuantos estudiantes se han inscrito en septiembre del 2024 

select count(id)as cantidad_inscripciones from inscripcion_camper_rutas where year(fecha_Inscripcion)='2024' and month(fecha_Inscripcion)='09';

-- 39.calcular la nota teorica total al multiplicar la nota teorica por el 30%

select nota_teorica*30/100 as nota_total_teorica from evaluaciones_modulos;

-- 40.calcular la nota practica total al multiplicar la nota practica por el 60%

select Nota_Practica*60/100 as nota_total_practica from evaluaciones_modulos;

-- 41.calcular la nota trabajo_quiz total al multiplicar la nota trabajo_quiz por el 10%

select Nota_trabajo_quiz*10/100 as Nota_total_trabajoquiz from evaluaciones_modulos;

-- 42.sacar la nota final

select nota_teorica*30/100 + Nota_Practica*60/100 +  Nota_trabajo_quiz*10/100 as nota_final from evaluaciones_modulos;

-- 43.mostrar la cantidad de estudiantes que aprobaron

select count(*) as cantidad_aprobado from historial_academico ha inner join tipo_estado te on ha.id_estado=te.id where te.estado='Aprobado';

-- 44.mostrar la cantidad de estudiantes que desaprobaron

select count(*) as cantidad_aprobado from historial_academico ha inner join tipo_estado te on ha.id_estado=te.id where te.estado='desaprobado';

-- 45.mostrar la tabla de evaluaciones_modulos

select * from evaluaciones_modulos;

-- 46.mostrar cual es la ruta que mas tiene campers inscriptos

select r.nombre,count(id_camper) cantidad_campers from inscripcion_camper_rutas icr inner join ruta r on icr.id_ruta=r.id group by 1 limit 1;

-- 47.mostrar cual es la ruta que mas tiene campers inscriptos y su trainer

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer , r.nombre,count(id_camper) cantidad_campers from inscripcion_camper_rutas icr 
inner join ruta r on icr.id_ruta=r.id inner join trainers t on r.id=t.id_ruta group by 1,2 limit 1;

-- 48.mostrar la cantidad de ruta que dicta cada trainer

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer , count(id_ruta) as cantidad_rutas from  ruta r 
inner join trainers t on r.id=t.id_ruta group by 1 ;

-- 49.mostrar cuales fueron los 5 camper que obtuvieron mayor nota final 

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper , nota_teorica*30/100 + Nota_Practica*60/100 +  Nota_trabajo_quiz*10/100 as nota_final
from historial_academico inner join campers on campers.id=historial_academico.id_camper inner join evaluaciones_modulos 
on  historial_academico.id_Evaluaciones_modulos=evaluaciones_modulos.id group by 1,2 order by 2 desc limit 5;

-- 50.mostrar cual es el trainer de mayor edad

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer , 2024-year(fecha_nacimiento) as edad from trainers 
order by 2 desc limit 1 ;

-- 51. mostrar cual es el trainer mas joven

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as Trainer , 2024-year(fecha_nacimiento) as edad from trainers
 order by 2 asc limit 1 ;
 
-- 52. mostrar la cantidad de campers  que tiene cada ruta

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as campers , count(id_ruta) as cantidad_rutas from  campers c inner join inscripcion_camper_rutas icr
on icr.id_camper=c.id inner join ruta r on icr.id_ruta=r.id group by 1;

-- 53. mostrar el salon y la ruta que se ve junto al nombre de trainer

select distinct salon , r.nombre,concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as trainer from salones s inner join areas a on s.id=a.id_salon
inner join horario h on  a.id_horario=h.id inner join ruta r  on h.id_ruta=r.id inner join trainers t on r.id=t.id_ruta ;

-- 54. cual fue el modulo que mas tuvo estudiantes que aprobaron

select m.nombre, count(id_camper) as CAmpers_aprobados from historial_academico ha inner join evaluaciones_modulos em on ha.id_evaluaciones_modulos=em.id
inner join modulos m on m.id=em.id_modulo where ha.id_estado=4 group by 1 limit 1;

-- 55.cual fue el modulo que tuvo mas estudiantes que desaprobaron

select m.nombre, count(id_camper) as CAmpers_DEsaprobados from historial_academico ha inner join evaluaciones_modulos em on ha.id_evaluaciones_modulos=em.id
inner join modulos m on m.id=em.id_modulo where ha.id_estado=3 group by 1 limit 1 ;

-- 56.mostrar cual a sido la nota promedio mas baja que se a tenido

select nota_promedio  from reportes order by 1 asc limit 1;

-- 57.mostrar cual a sido la nota promedio mas alta que se a tenido

select nota_promedio  from reportes order by 1 desc limit 1;

-- 58.mostrar cuales han sido las rutas que mas horas se tomaron para finalizar  

select r.nombre, horas_utilizadas from reportes inner join ruta r on r.id=reportes.id_ruta order by 2 desc limit 4 ;

-- 59.mostrar cuales han sido las rutas que menos horas se tomaron para finalizar 

select r.nombre, horas_utilizadas from reportes inner join ruta r on r.id=reportes.id_ruta order by 2 asc limit 6 ;

-- 60.mostrar cual ha sido la tasa de exito mas alta

select tasa_exito  from reportes order by 1 desc limit 1;

-- 61.mostrar cual ha sido la tasa de exito mas baja

select tasa_exito  from reportes order by 1 asc limit 1;

-- 62.cual es la cantidad de dia que se estimaron para la finalizacion de la ruta a la hora de la inscripcion y cuales fueron las rutas que mas demoraba

select r.nombre,datediff(fecha_estimada_fin,icr.fecha_inicio) as cantidad_dias from ruta r inner join inscripcion_camper_rutas icr on
icr.id_ruta=r.id group by 1,2 order by 2 desc limit 14;

-- 63.sacar la nota teorica y ver cuales fueron el modulo que tuvo mayor desempeño con el nombre del estudiante que saco esa nota

select m.nombre,concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper , nota_teorica*30/100 as nota_teorica
from historial_academico inner join campers on campers.id=historial_academico.id_camper inner join evaluaciones_modulos 
on  historial_academico.id_Evaluaciones_modulos=evaluaciones_modulos.id  inner join modulos m on evaluaciones_modulos.id_modulo=m.id group by 1,2,3 order by 3 desc limit 3;

-- 64.sacar la nota practica y ver cual fue el modulo que tuvo mayor desempeño con el nombre del estudiante que saco esa nota

select m.nombre,concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper , nota_practica*60/100 as nota_practica
from historial_academico inner join campers on campers.id=historial_academico.id_camper inner join evaluaciones_modulos 
on  historial_academico.id_Evaluaciones_modulos=evaluaciones_modulos.id  inner join modulos m on evaluaciones_modulos.id_modulo=m.id group by 1,2,3 order by 3 desc limit 3;

-- 65.sacar la nota quiz,trabajos  y ver cual fue el modulo que tuvo mayor desempeño con el nombre del estudiante que saco esa nota

select m.nombre,concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper , Nota_trabajo_quiz*10/100 as Nota_trabajo_quiz
from historial_academico inner join campers on campers.id=historial_academico.id_camper inner join evaluaciones_modulos 
on  historial_academico.id_Evaluaciones_modulos=evaluaciones_modulos.id  inner join modulos m on evaluaciones_modulos.id_modulo=m.id group by 1,2,3 order by 3 desc limit 3;

-- 66.sacar la nota final y ver cual fue el modulo que tuvo mayor desempeño con el nombre del estudiante que saco esa nota

select m.nombre,concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper , nota_teorica*30/100 + Nota_Practica*60/100 +  Nota_trabajo_quiz*10/100 as nota_final
from historial_academico inner join campers on campers.id=historial_academico.id_camper inner join evaluaciones_modulos 
on  historial_academico.id_Evaluaciones_modulos=evaluaciones_modulos.id  inner join modulos m on evaluaciones_modulos.id_modulo=m.id 
group by 1,2,3 order by 3 desc limit 3;

-- 67.cuantos de los campers inscripto para la ruta 'Desarrollo de Aplicaciones con React' son mujeres

select r.nombre as ruta,c.nombre1 as camper, count(*) as cantidad from ruta r inner join inscripcion_camper_rutas icr on r.id=icr.id_ruta inner join campers c 
on icr.id_camper=c.id where r.nombre='Desarrollo de Aplicaciones con React'  and c.sexo='F'group by 1,2;

-- 68.mostrar los  modulos y su horas_totales

select nombre , horas_totales from modulos;

-- 69.mostrar las rutas y su fecha_fin

select nombre, fecha_fin from ruta;

-- 70.cuales son las rutas que no tienen ningun camper inscripto

select r.nombre , count(id_camper) campers_inscripto from ruta r left join inscripcion_camper_rutas icr on r.id=icr.id_ruta group by 1 order by 2 asc limit 7;

-- 71.cuales  son las rutas que tiene mas campers inscripto
select r.nombre , count(id_camper) campers_inscripto from ruta r left join inscripcion_camper_rutas icr on r.id=icr.id_ruta group by 1 order by 2 desc limit 3;

-- 72.mostrar los acudiente que su nombre comience con "A"

select acudiente from campers where left(acudiente,1)='A';

-- 73.mostrar los datos de los campers mayores a 20 años

select * , 2024-year(fecha_nacimiento) as 'edad' from campers where 2024-year(fecha_nacimiento)>20;

-- 74.mostrar a cuantas rutas se encuentra inscripto un camper

select nombre1 , count(id_ruta) as  rutas_inscriptas from campers c inner join inscripcion_camper_rutas icr on c.id=icr.id_camper group by 1 ;

-- 75.mostrar la cantidad de camper registrados

select count(*) as campers_registrados from campers;

-- 76.mostrar el nombre y apellido de los campers con su estado
select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper , te.estado from campers c inner join tipo_estado te on 
c.id_estado=te.id;
-- 77.mostrar cuantos trainers hay registrados 

select count(*) as trainers from trainers;

-- 78.mostrar la cantidad de rutas que tiene un trainer

select t.nombre1, count(id_ruta) as rutas from trainers t group by 1;

-- 79.mostrar cual es el modulo mas escogido por los estudiantes 

select m.nombre, count(id_ruta) cantidad from ruta r left join inscripcion_camper_rutas icr on r.id=icr.id_ruta inner join modulos m 
on m.id=r.id_modulo group by 1 ;

-- 80.mostrar la cantidad de campers que aprobaron de la ruta 10

select sum(cantidad_campers_aprobaron)as cantidad_campers_aprobado_ruta10 from reportes where id_ruta=10;

-- 81.mostrar la cantidad de campers que aprobaron de la ruta 3

select sum(cantidad_campers_aprobaron) as cantidad_campers_aprobado_ruta3 from reportes where id_ruta=3; 

-- 82.mostrar la tasa de exito que se tuvo con respecto a la ruta 40

select tasa_exito from reportes where id_ruta=40;

-- 83.mostrar los trainers que su numero de telefono termina en 3

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as trainer from trainers where right(telefono,1)=3;

-- 84.mostrar los trainer que su nombre comienza com lu

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as trainer from trainers where nombre1 like '%lu%';

-- 85.mostrar los trainer que su apellido es solano

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as trainer from trainers where apellido1='serrano' or apellido2='serrano';

-- 86.mostrar los trainer que su año de nacimiento es 1992

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as trainer from trainers where year(fecha_nacimiento)='1992';

-- 87.mostrar los trainer que su mes de nacimiento es 02

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as trainer from trainers where month(fecha_nacimiento)='02';

-- 88.mostrar los campers que su año de nacimiento es 2007 o 2006

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper from campers  where year(fecha_nacimiento)='2007' or '2006';

-- 89.mostrar los campers que su mes de nacimiento es julio

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper from campers  where month(fecha_nacimiento)='07' ;

-- 90.mostrar la cantidad de campers que nacieron en 2000

select count(*) as Cantida_campers from campers  where year(fecha_nacimiento)='2000' ;

-- 91. mostrar la id, nombres y apellidos de los campers que su nombre tiene lu al inicio

select id ,concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper from campers where nombre1 like '%lu%';

-- 92.mostrar los campers que su numero de telefono termine en 9

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper from campers where right(telefono,1)=9;

-- 93.mostrar la direccion en la que vive cada camper

select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2,'') as camper , direccion from campers ;

-- 94. mostrar los campers hombres mayores de edad

select * , 2024-year(fecha_nacimiento) as 'edad' from campers where 2024-year(fecha_nacimiento)>18 and sexo='f';

-- 95. mostrar los campers mujeres mayores de edad

select * , 2024-year(fecha_nacimiento) as 'edad' from campers where 2024-year(fecha_nacimiento)>18 and sexo='M';

-- 96.mostrar los campers mujeres mayores de edad

select * , 2024-year(fecha_nacimiento) as 'edad' from campers where 2024-year(fecha_nacimiento)<18 and sexo='f';

-- 97.mostrar los campers hombres mayores de edad

select * , 2024-year(fecha_nacimiento) as 'edad' from campers where 2024-year(fecha_nacimiento)<18 and sexo='M';

-- 98.cual es el promedio de campers inscriptos hombres

select avg(cantidad) as Promedio_hombre from (select count(*) as cantidad from  inscripcion_camper_rutas icr  inner join campers c 
on icr.id_camper=c.id where c.sexo='M') as obtener ;

-- 99.cual es el promedio de campers inscriptos mujeres

select avg(cantidad) as Promedio_mujeres from (select count(*) as cantidad from  inscripcion_camper_rutas icr  inner join campers c 
on icr.id_camper=c.id where c.sexo='F') as obtener ;

-- 100.mostrar los componentes y la id del modulo

select m.id, componentes from componentes_modulos c inner join modulos m on m.id_componentes=c.id;