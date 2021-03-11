use TiendaOnline;

-- Mostrar la cantidad de productos que fueron vendidos por cada vendedor
select vendedor.nombre as Vendedor, sum(pedido.cantidad) as Total 
from producto, vendedor, pedido
where producto.id_vendedor = vendedor.id_vendedor 
and pedido.id_producto = producto.id_producto
group by vendedor.id_vendedor
order by Total desc; 

-- Mostrar cuántos vendedores existen en cada categoria ordenada por el
-- número de vendedores descendentemente 
select categoria.nombre as categoria, count(distinct vendedor.id_vendedor) as numero_vendedores
from vendedor, categoria, producto 
where producto.id_vendedor = vendedor.id_vendedor
and producto.id_categoria = categoria.id_categoria
group by categoria.id_categoria
order by numero_vendedores desc;

-- Mostrar el nombre de los producutos de la categoria Frutas
select distinct producto.nombre as frutas_en_stock
from producto, categoria
where producto.id_categoria = categoria.id_categoria
and categoria.nombre = 'Frutas';

-- Mostrar el producto que mas veces se ha comprado y cuantas veces
select producto.nombre, count(pedido.id_producto) as veces_vendido
from producto, pedido
where producto.id_producto = pedido.id_producto
group by pedido.id_producto
order by veces_vendido desc
limit 1;

-- Mostrar el precio del producto con el precio mas caro y el mas barato
select nombre as producto, precio
from producto
where precio = (select max(precio) from producto) 
or precio = (select min(precio) from producto)
order by precio desc;

-- Mostrar el nombre y apellidos de los 10 clientes que más cantidad de productos han comprado y cuántos
select cliente.nombre, cliente.apellidos, sum(pedido.cantidad) as productos_comprados
from cliente, pedido
where cliente.dni = pedido.dni_cliente
group by pedido.dni_cliente
order by productos_comprados desc
limit 10;

-- Mostrar telefono de los clientes que compraron en el mes de Abril
select distinct cliente.nombre, cliente.tlfn, pedido.fecha
from cliente, pedido
where cliente.dni = pedido.dni_cliente
and month(pedido.fecha) = 4;

-- Mostrar los distintas categorias que hay en la tienda online
select nombre as categorias from categoria group by nombre;

-- Mostrar el nombre y apellidos de los 4 primeros clientes que menos compras han
-- realizado y tambien el total de dichas compras 
select cliente.nombre, cliente.apellidos, producto.precio * pedido.cantidad as precio_total
from cliente , pedido, producto
where cliente.dni = pedido.dni_cliente
and producto.id_producto = pedido.id_producto
group by pedido.dni_cliente
order by precio_total asc
limit 4;

-- Ingresos de cada pedido
select pedido.id_pedido as pedido, producto.precio * pedido.cantidad as ingresos
from producto, pedido
where producto.id_producto = pedido.id_producto
order by pedido asc;
