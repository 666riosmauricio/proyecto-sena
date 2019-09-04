create database Entregapp;

use Entregapp;

create table usuarios (
	numeroDocumento varchar(10) not null primary key,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    email varchar(50) not null,
    password varchar(50) not null,
    direccion varchar(50) not null,
    telefono varchar(10) not null,
    celular varchar(10) not null,
    telefono2 varchar(10) not null,
    celular2 varchar(10) not null
);

create table empleados (
	numeroDocumento varchar(10) not null primary key,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    email varchar(50) not null,
    password varchar(50) not null,
    direccion varchar(50) not null,
    telefono varchar(10) not null,
    celular varchar(10) not null,
    telefono2 varchar(10) not null,
    celular2 varchar(10) not null,
    fechaNacimiento date not null
);

create table paquetes (
	idPaquete int primary key auto_increment not null,
    peso int not null,
    largo int not null,
    ancho int not null,
    direccionRecoger varchar(50) not null,
    personaEntrega varchar(50) not null,
    telefonoEntrega varchar(10) not null,
    horarioRecoger time not null,
    direccionEntrega varchar(50) not null,
    personaRecibe varchar(50) not null,
    telefonoRecibe varchar(10) not null,
    horarioEntregar time not null,
    sugerencias varchar(100) not null,
    usuarioPaquete varchar(10) not null,
    foreign key (usuarioPaquete) references usuarios(numeroDocumento),
    empleadoPaquete varchar(10) not null,
    foreign key (empleadoPaquete) references empleados(numeroDocumento)
    
    on delete no action
    on update no action
);

create table documentos (
	idDocumento int primary key auto_increment not null,
    peso int not null,
    largo int not null,
    ancho int not null,
    direccionRecoger varchar(50) not null,
    personaEntrega varchar(50) not null,
    telefonoEntrega varchar(10) not null,
    horarioRecoger time not null,
    direccionEntrega varchar(50) not null,
    personaRecibe varchar(50) not null,
    telefonoRecibe varchar(10) not null,
    horarioEntregar time not null,
    sugerencias varchar(100) not null,
    usuarioDocumento varchar(10) not null,
    foreign key (usuarioDocumento) references usuarios(numeroDocumento),
    empleadoDocumento varchar(10) not null,
    foreign key (empleadoDocumento) references empleados(numeroDocumento)
    
    on delete no action
    on update no action
);

create table compras (
	idCompras int not null primary key auto_increment,
    productos varchar(50) not null,
    cantidad int not null,
    precio int not null,
    direccionRecoger varchar(50) not null,
    direccionEntrega varchar(50) not null,
    personaRecibe varchar(50) not null,
    telefono varchar(10) not null,
    sugerencias varchar(100) not null,
    usuarioCompras varchar(10) not null,
    foreign key (usuarioCompras) references usuarios(numeroDocumento),
    empleadoCompras varchar(10) not null,
    foreign key (empleadoCompras) references empleados(numeroDocumento)
    
    on delete no action
    on update no action
    
);
 create table pagos (
	idPagos int not null auto_increment primary key,
    numeroTarjeta varchar(15) not null,
    mesExpiracion varchar(10) not null,
    añoExpiracion year not null,
    nombreTarjeta varchar(20) not null,
    usuarioPago varchar(50) not null,
    foreign key (usuarioPago) references usuarios (numeroDocumento)
    
    on delete no action
    on update no action
 );
 
create table pagosUsuarios (
	idPagoUsuario int not null primary key auto_increment,
    usuarioPago varchar(50) not null,
    foreign key (usuarioPago) references usuarios (numeroDocumento)
    
    on delete no action 
    on update no action

);