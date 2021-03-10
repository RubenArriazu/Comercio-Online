use TiendaOnline;

-- Mostrar la cantidad de productos que fueron vendidos por cada vendedor
select vendedor.nombre as Vendedor, sum(pedido.cantidad) as TOTAL 
from producto,vendedor,pedido
where producto.id_vendedor=vendedor.id_vendedor 
and pedido.id_producto=producto.id_producto
group by vendedor.id_vendedor order by TOTAL desc; 

-- Mostrar cuántos vendedores existen en cada categoria  ordenada por el número de vendedores descendentemente 
-- select categoria.nombre as categoria, count(vendedor.id_vendedor) as total_vendedores
select categoria.nombre as categoria, count(distinct vendedor.id_vendedor) as total_vendedores
from vendedor, categoria, producto 
where producto.id_vendedor = vendedor.id_vendedor and producto.id_categoria=categoria.id_categoria
group by categoria.id_categoria
order by total_vendedores desc;

-- Mostrar el nombre de los prodcutos de la categoria Frutas
select producto.nombre
from producto, categoria
where producto.id_categoria=categoria.id_categoria and categoria.nombre='Frutas';

-- Mostrar el producto que mas veces se ha comprado y cuantas veces
select producto.nombre, count(pedido.id_producto) as total from producto, pedido
where producto.id_producto=pedido.id_producto group by pedido.id_producto order by total desc;

-- Mostrar el precio del producto con el precio mas caro y el mas barato
select producto.precio from producto
where producto.precio = (select max(producto.precio) from producto) 
or producto.precio = (select min(producto.precio) from producto);
