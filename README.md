# CampusLands ERP
## Seguimiento Académico para CampusLands

El objetivo de este proyecto fue diseñar y desarrollar una base de datos que permita gestionar de manera eficiente todas las operaciones relacionadas con el seguimiento académico de los campers matriculados en el programa intensivo de programación de CampusLands. Este sistema debe facilitar la gestión de inscripciones, rutas de aprendizaje, evaluaciones, reportes, y asignaciones de entrenadores y áreas de entrenamiento, garantizando una solución robusta y optimizada.

# Requisitos del sistema , Instalación y Ejecucion

Se requiere de la app mysql workbench en la pc  para poder ejecutar los script.

Al tener el primer requisito lo siguiente que debera hacer es clonar el repositorio  en git bash usando el siguiente comando
`git clone https://github.com/YurleyBG/ProyectoIV_mysql_BotelloYurley.git`
despues de haber hecho eso debe obtener la carpeta en tus archivos, luego accederas a mysql workbench y abriras inicialmente el archivo ddl que contiene las tablas de la base de datos,
luego el dml que son las inserciones para cada tabla y asi con cada archivo.

para ejecutar cada archivo deberas hacerlo con el rayito en la parte superior.

# Estructura de la Base de Datos

+ ddl: Contiene las tablas.
+ dml: Contiene los insert para cada tabla.
+ dql_usuario: Contiene 5 usuarios cada uno con permisos diferente a la hora de ingresar a la base de datos.
+ dql_select: Contiene 100 consultas posibles dentro de dicha base.
+ dql_procedimientos: Contiene 20 procedimientos posibles.
+ dql_funciones: Contiene 20  funciones posibles.
+ dql_event: Contiene 20 eventos posibles dentro de la base de datos.
+ dql_triggers: Contiene 20 eventos posibles en la base de datos.
+ diagrama.png: Contiene el diagrama lògico para el analice de la base de datos.

# Consultas
Se trata de una forma de acceder a las bases de datos y de realizar operaciones basica y complejas.

``` sql
	realizar una consulta que permita extraer los campers que estan en proceso de ingreso
  select nombre1,nombre2,apellido1,apellido2 from campers where id_estado=1;

  select avg(cantidad) as Promedio_mujeres from (select count(*) as cantidad from  inscripcion_camper_rutas icr  inner join campers c 
  on icr.id_camper=c.id where c.sexo='F') as obtener ;
```
# Procedimientos
Estan funciones buscan realizar acciones de manera ordenada  para obtener un resultado especificas como actualizar, eliminar o insertar nuevos datos.
```sql
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
  
```

# Triggers
 son objetos de base de datos que se activan cuando se produce un evento en una tabla
```sql
 
```
# Eventos
son tareas que se ejecutan de manera programada, es decir, según un cronograma predefinido. 
```sql
  
```
# Creditos
Este proyecto fue desarrollado por Yurley Botello Garcia.


