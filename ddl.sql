create database CampusLands_ERP;
use CampusLands_ERP;

create table if not exists Tipo_Estado(
id int auto_increment primary key not null,
estado varchar(50) not null
);
create table if not exists Campers(
id int auto_increment primary key not null,
nombre1 varchar(35)not null, 
nombre2 varchar(35) ,
apellido1 varchar(35) not null ,
apellido2 varchar(35),
fecha_Nacimiento date,
direccion varchar(50) not null,
acudiente varchar(50),
telefono varchar(15) not null,
sexo enum('F','M'),
nivel_Riesgo enum('Bajo','Medio','Alto') not null,
id_estado int,
foreign key (id_estado) references Tipo_Estado(id)
);
create table if not exists Componentes_Modulos(
id int auto_increment primary key not null,
componentes varchar(100) not null,
descripcion varchar(100),
nivel_complejidad enum('Bajo','Medio','Alto') not null
);
create table if not exists Modulos(
id int auto_increment primary key not null,
nombre varchar(100) not null,
Horas_totales int not null,
id_componentes int,
foreign key (id_componentes) references Componentes_Modulos(id),
id_estado int,
foreign key (id_estado) references Tipo_Estado(id)
);

create table if not exists Ruta(
id int auto_increment primary key not null,
nombre varchar(100) not null,
fecha_inicio date not null,
fecha_fin date,
id_modulo int,
foreign key (id_modulo) references Modulos(id)

);
create table if not exists Inscripcion_camper_rutas(
id int auto_increment primary key not null,
id_camper int not null,
foreign key (id_camper) references Campers(id),
fecha_Inscripcion date,
id_ruta int not null,
foreign key (id_ruta) references Ruta(id),
fecha_inicio date not null,
fecha_estimada_fin date ,
id_estado int not null,
foreign key (id_estado) references Tipo_Estado(id)
);
create table if not exists Salones (
id int auto_increment primary key not null,
salon varchar(35) not null,
ubicacion varchar(30)
);
create table if not exists Trainers (
id int auto_increment primary key not null,
nombre1 varchar(35)not null, 
nombre2 varchar(35) ,
apellido1 varchar(35) not null ,
apellido2 varchar(35),
fecha_Nacimiento date,
direccion varchar(50) not null,
email varchar(50),
telefono varchar(15) not null,
id_Ruta int,
foreign key (id_Ruta) references Ruta(id)
);

create table if not exists Horario(
id int auto_increment primary key not null,
hora_inicio varchar(15) not null,
hora_fin varchar(15) not null,
horas_semanales int not null,
id_Ruta int,
foreign key (id_Ruta) references Ruta(id),
id_Trainer int not null,
foreign key (id_Trainer) references Trainers(id)
);

create table if not exists Areas (
id int auto_increment primary key not null,
cantidad_campers int(33) not null,
id_Horario int not null,
foreign key (id_Horario) references Horario(id),
id_salon int not null,
foreign key (id_salon) references Salones(id)
);
create table if not exists Reportes (
id int auto_increment primary key not null,
id_Ruta int,
foreign key (id_Ruta) references Ruta(id),
fecha date,
cantidad_campers_aprobaron int not null,
nota_promedio int ,
horas_utilizadas int,
tasa_exito  float 
);
create table if not exists Evaluaciones_modulos (
id int auto_increment primary key not null,
id_modulo int not null,
foreign key (id_modulo) references modulos(id),
Nota_teorica int ,
Nota_Practica int ,
Nota_trabajo_quiz int,
Nota_final int 
);
create table if not exists Historial_Academico(
id int auto_increment primary key not null,
id_camper int not null,
foreign key (id_camper) references Campers(id),
id_Evaluaciones_modulos int not null,
foreign key (id_Evaluaciones_modulos) references Evaluaciones_modulos(id),
id_estado int not null,
foreign key (id_estado) references Tipo_Estado(id)  
);




