# proyecto-salud-total-medicines

🏥 Proyecto Base de Datos: Salud Total
Este proyecto contiene el código SQL para crear y organizar la base de datos de Salud Total, una tienda en línea que vende productos médicos, vitaminas y artículos de cuidado personal.
🗄️ ¿Cómo está organizada la base de datos? (Las 5 Tablas)
El sistema funciona con 5 tablas conectadas entre sí:
1.	usuarios: Guarda los datos de los clientes (nombre, correo, contraseña y teléfono).
2.	categorias: Organiza los productos en 4 grupos (Dispositivos Médicos, Suplementos, Cuidado Personal y Ortopedia).
3.	productos: Guarda el catálogo con el nombre de cada artículo, su precio, cuántos quedan en inventario y la ruta de su imagen (url_imagen) para cuando se conecte con la página web.
4.	pedidos: Es la factura general. Guarda qué usuario compró, la fecha, el estado (si está pendiente o enviado) y el dinero total de la compra.
5.	detalle_pedidos: Guarda los renglones de la factura. Dice exactamente qué productos y cuántas cantidades se llevaron en cada pedido.
📊 Datos de Prueba Incluidos
Para demostrar que todo funciona, el código mete automáticamente estos datos de ejemplo:
•	4 Categorías médicas.
•	10 Productos reales con precios e inventario (como tensiómetros, glucómetros y vitaminas).
•	4 Usuarios listos para hacer pruebas de inicio de sesión.
•	3 Pedidos de ejemplo con sus cuentas matemáticas exactas para verificar que el dinero cuadre perfectamente.
⚙️ ¿Qué herramientas automáticas incluye?
1. Historial de Compras (sp_ReporteComprasUsuario)
Es una función que junta los datos de las tablas para mostrarle a un cliente específico la lista de todo lo que ha comprado en la tienda desde su perfil.
2. Compra Segura y Automática (sp_RegistrarPedidoCompleto)
Es un proceso inteligente que hace 4 tareas en un solo clic cuando alguien compra:
1.	Revisa si hay stock del producto médico.
2.	Crea la factura del pedido.
3.	Guarda el detalle de lo que compró.
4.	Resta automáticamente las unidades vendidas del inventario para que no se sobrevenda nada.
3. Ranking de Clientes
Un reporte rápido para los administradores que muestra quiénes son los usuarios que más pedidos han hecho y cuánto dinero han gastado en total, ideal para darles descuentos o promociones.

