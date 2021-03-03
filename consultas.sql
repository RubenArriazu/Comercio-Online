
-- Mostrar la cantidad de productos que fueron vendidos por cada vendedor
select producto.nombre as Producto, vendedor.nombre as Vendedor, count(pedido.cantidad) as TOTAL 
from producto,vendedor,pedido
where producto.id_vendedor=vendedor.id_vendedor 
and pedido.id_pedido=producto.id_producto
group by vendedor.id_vendedor order by TOTAL desc; 

-- Mostrar cuántos vendedores existen en cada categoria  ordenada por el número de vendedores descendentemente 
select vendedor.nombre count(producto.id_producto) as total
from vendedor, producto
where producto.id_vendedor = vendedor.id_vendedor
group by vendedor.id_categoria
order by total desc;

-- Mostrar el nombre de los prodcutos de la categoria Frutas
select producto.nombre from producto, categoria where producto.id_categoria=categoria.id_categoria and categoria.nombre='Frutas';

-- Mostrar el producto que mas veces se ha comprado y cuantas veces
select producto.nombre, count(pedido.id_producto) as total from producto, pedido
where producto.id_producto=pedido.id_producto group by pedido.id_producto order by total desc

-- Mostrar la descipcion y el precio del producto con el precio mas caro y el mas abrato
select articulos.descripcion,articulos.precio from articulos
select producto.descipcion, producto.precio from producto
where producto.precio = (select max(producto.precio) from producto) 
or producto.precio = (select min(producto.precio) from producto);
