DROP DATABASE IF EXISTS DBProyecto;
CREATE DATABASE DBProyecto;
USE DBproyecto;
DROP TABLE IF EXISTS Usuario;

CREATE TABLE Usuario (
IDUsuario			INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nombre				VARCHAR(30) NOT NULL,
Nick				VARCHAR(20) NOT NULL,
Contraseña			VARCHAR(20) NOT NULL,
Email				VARCHAR(30) NOT NULL,
Telefono			INT(9)
);

DROP TABLE IF EXISTS Evento;
CREATE TABLE Evento (
IDEvento			INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nombre				VARCHAR(30) NOT NULL,
Fecha				DATETIME NOT NULL,
Localizacion		VARCHAR(40) NOT NULL,
Descripcion			MEDIUMTEXT NOT NULL,
IDAdmin				INT(10) NOT NULL
);

DROP TABLE IF EXISTS UsuarioEvento;
CREATE TABLE UsuarioEvento (
ID					INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
IDUsuario2			INT(10) NOT NULL,
IDEvento2			INT(10) NOT NULL,
FOREIGN KEY ( IDUsuario2 ) REFERENCES Usuario(IDUsuario),
FOREIGN KEY ( IDEvento2 ) REFERENCES Evento(IDEvento)
);

DROP TABLE IF EXISTS Notificaciones;
CREATE TABLE Notificaciones (
IDNotificaciones	INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
NUsuario			INT(10) NOT NULL,
Texto				MEDIUMTEXT NOT NULL,
Fecha				DATETIME NOT NULL,
Vista				BOOLEAN NOT NULL,
FOREIGN KEY ( NUsuario ) REFERENCES Usuario(IDUsuario)
);

DROP TABLE IF EXISTS Mensajes;
CREATE TABLE Mensajes (
IDMensajes			INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
MUsuario			INT(10)  NOT NULL,
MEvento				INT(10) NOT NULL,
Texto				MEDIUMTEXT NOT NULL,
Fecha				DATETIME NOT NULL,
FOREIGN KEY ( MUsuario ) REFERENCES UsuarioEvento(ID),
FOREIGN KEY ( MEvento ) REFERENCES Evento(IDEvento)
);

DROP TABLE IF EXISTS Tarea;
CREATE TABLE Tarea (
IDTarea				INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
TEvento				INT(10) NOT NULL,
Dueño				INT(10) NOT NULL,
Nombre				VARCHAR(30) NOT NULL,
Descripcion			MEDIUMTEXT NOT NULL,
Coste				DECIMAL(3,2),
Estado				BOOLEAN NOT NULL,
FOREIGN KEY ( Dueño ) REFERENCES UsuarioEvento(ID),
FOREIGN KEY ( TEvento ) REFERENCES Evento(IDEvento)
);

INSERT INTO Usuario ( Nombre, Nick, Contraseña, Email, Telefono ) VALUES ( 'Jaime', 'Nick1', 'password1', 'prueba1@gmail.com', 687572384 );
INSERT INTO Usuario ( Nombre, Nick, Contraseña, Email, Telefono ) VALUES ( 'Pablo', 'Nick2', 'password2', 'prueba2@gmail.com', 687572344 );
INSERT INTO Usuario ( Nombre, Nick, Contraseña, Email, Telefono ) VALUES ( 'Jose', 'Nick3', 'password3', 'prueba3@gmail.com', 687572354 );
INSERT INTO Usuario ( Nombre, Nick, Contraseña, Email, Telefono ) VALUES ( 'Marta', 'Nick4', 'password4', 'prueba4@gmail.com', 687672384 );
INSERT INTO Usuario ( Nombre, Nick, Contraseña, Email, Telefono ) VALUES ( 'Sandra', 'Nick5', 'password5', 'prueba5@gmail.com', 687572284 )
INSERT INTO Usuario ( Nombre, Nick, Contraseña, Email, Telefono ) VALUES ( '', '', '', '', );

INSERT INTO Evento ( Nombre, Fecha, Localizacion, Descripcion, IDAdmin ) VALUES ( 'Añonuevo', '2022-12-31', 'Plaza san Marcos', 'Descripcion1', 1);
INSERT INTO Evento ( Nombre, Fecha, Localizacion, Descripcion, IDAdmin ) VALUES ( 'Halloween', '2022-11-01', 'Grabiel Matute', 'Descripcion2', 2);
INSERT INTO Evento ( Nombre, Fecha, Localizacion, Descripcion, IDAdmin ) VALUES ( 'FiestaVerano', '2022-07-15', 'Playa Victoria', 'Descripcion3', 3);
INSERT INTO Evento ( Nombre, Fecha, Localizacion, Descripcion, IDAdmin ) VALUES ( '', '', '', '', );

INSERT INTO UsuarioEvento ( IDUsuario, IDEvento ) VALUES ( 1, 2);
INSERT INTO UsuarioEvento ( IDUsuario, IDEvento ) VALUES ( 2, 2);
INSERT INTO UsuarioEvento ( IDUsuario, IDEvento ) VALUES ( 3, 1);
INSERT INTO UsuarioEvento ( IDUsuario, IDEvento ) VALUES ( 4, 3);
INSERT INTO UsuarioEvento ( IDUsuario, IDEvento ) VALUES ( 5, 1);
INSERT INTO UsuarioEvento ( IDUsuario, IDEvento ) VALUES ( , );


INSERT INTO Notificaciones ( NUsuario, Texto, Fecha, Vista ) VALUES ( 2, 'Texto1', '2022-04-23', TRUE);
INSERT INTO Notificaciones ( NUsuario, Texto, Fecha, Vista ) VALUES ( 5, 'Texto2', '2022-08-24', FALSE);
INSERT INTO Notificaciones ( NUsuario, Texto, Fecha, Vista ) VALUES ( , '', '', );


INSERT INTO Mensajes ( MUsuario, Mevento, Texto, Fecha ) VALUES ( 1, 2, 'Hola', '2022-07-21');
INSERT INTO Mensajes ( MUsuario, Mevento, Texto, Fecha ) VALUES ( 2, 2, 'Hey', '2022-01-10');
INSERT INTO Mensajes ( MUsuario, Mevento, Texto, Fecha ) VALUES ( , , '', '');


INSERT INTO Tarea (Tevento, Dueño, Nombre, Descripcion, Coste, Estado ) VALUES ( 2, 1, 'Comida', 'Carne, patatas y salsa', 20.40, TRUE);
INSERT INTO Tarea (Tevento, Dueño, Nombre, Descripcion, Coste, Estado ) VALUES ( 2, 2, 'Bebidas', 'Cerveza, Cocacola', 17.80, FALSE);
INSERT INTO Tarea (Tevento, Dueño, Nombre, Descripcion, Coste, Estado ) VALUES ( , , '', '', , );