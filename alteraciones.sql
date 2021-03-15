-- LAS ALTERACIONES HACERLAS EN ÚLTIMA INSTANCIA

use TiendaOnline;

-- añadir columna fecha_nacimiento al final de cliente
alter table cliente add fecha_nacimiento date;

-- eliminar columna anterior
alter table cliente drop fecha_nacimiento;

-- añadir columna persona de contacto al principio de cliente
alter table cliente add persona_contacto varchar(40) FIRST;

-- cambiar nombre columna tlfn por teléfono de cliente
alter table cliente change tlfn telefono varchar(12);

-- cambiar tipo de datos de fecha en pedido
alter table pedido change fecha fecha date;

-- añadir columna edad en vendedor después de la columna nombre
alter table vendedor add edad int(3) after nombre;

-- mover columna stock antes de precio en producto
ALTER TABLE producto MODIFY stock INT NOT NULL AFTER nombre;

-- añadir columna edad en cliente después de apellidos
alter table cliente add edad int(3) after apellidos;

-- eliminar columnas edad y persona_contacto de cliente
alter table cliente drop column persona_contacto, drop column edad;

-- cambiar nombre de la tabla producto por artículo
alter table producto rename articulo;