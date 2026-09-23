# ElectroHogar
IMPLEMENTACIÓN DE LA BASE DE DATOS ELECTROHOGAR
1. Introducción

El presente documento describe el diseño e implementación de la base de datos ElectroHogar, desarrollada con el propósito de organizar y gestionar la información relacionada con la comercialización de productos electrodomésticos.

La solución permite administrar diferentes procesos del negocio, entre ellos la gestión de marcas, categorías, productos, clientes, proveedores, almacenes, inventario, ventas, detalles de venta, pagos, entregas, unidades serializadas y garantías.

Para el desarrollo de la base de datos se trabajó inicialmente con el diseño lógico y diseño físico, mediante los cuales se establecieron las entidades, atributos, relaciones, tipos de datos, claves primarias, claves foráneas y demás restricciones necesarias para estructurar correctamente la información.

Posteriormente, la base de datos fue implementada en SQL Server, utilizando Docker como entorno de ejecución y un volumen para garantizar la persistencia de los archivos físicos de la base de datos.
2. Diseño lógico

El diseño lógico de la base de datos ElectroHogar representa la estructura conceptual de la solución. En esta etapa se identificaron las principales entidades que intervienen en los procesos del negocio y se establecieron las relaciones entre ellas.

Entre las principales entidades se encuentran Brand, Category, Customer, Customer_Phone, Product, Supplier, Warehouse, Inventory, Sale, Sale_Detail, Payment, Delivery, Serialized_Unit y Warranty, entre otras.

El diseño lógico permite comprender cómo se organiza la información antes de realizar su implementación física en SQL Server.

Evidencia del diseño lógico

Figura 1. Diseño lógico de la base de datos ElectroHogar.

<img width="1157" height="653" alt="image" src="https://github.com/user-attachments/assets/ac228240-6e9c-4655-8085-6ab8c98f098a" />

Diseño lógico:
https://datamodeler.redgate-platform.com/doc/039E9GrOjHUKbN1b4aDNB7mkFWuw5Iy8 

3. Diseño físico

El diseño físico corresponde a la representación de la base de datos en una estructura que puede ser implementada directamente en un sistema gestor de bases de datos.

En esta etapa se definieron las tablas que forman parte de ElectroHogar, los campos correspondientes a cada tabla, los tipos de datos, las claves primarias, las claves foráneas y las restricciones de integridad.

El diseño físico fue desarrollado considerando la estructura necesaria para almacenar la información de los diferentes procesos de la empresa y mantener la relación entre los datos.

Evidencia del diseño físico

Figura 2. Diseño físico de la base de datos ElectroHogar.

<img width="1020" height="617" alt="image" src="https://github.com/user-attachments/assets/73e028e0-e7dc-44f1-82f7-dce0d456358c" />

Diseño físico:
https://datamodeler.redgate-platform.com/doc/RLYIgau7tJDrb1BLxoi3p1kVPn5J5CE8

4. Diccionario de datos

El diccionario de datos constituye el documento de referencia de la estructura de la base de datos ElectroHogar. En este se detallan las tablas, campos, tipos de datos y características principales de cada elemento.

Su finalidad es permitir una mejor comprensión de la información almacenada y facilitar el mantenimiento, desarrollo y futuras modificaciones de la base de datos.

El diccionario de datos fue elaborado a partir del diseño lógico y físico desarrollado para el proyecto.

Evidencia del diccionario de datos

Figura 3. Diccionario de datos de ElectroHogar.

<img width="807" height="649" alt="image" src="https://github.com/user-attachments/assets/efd1ac06-16a9-42ed-b164-67ca49373d40" />

Diccionario de datos:
https://drive.google.com/file/d/187SSFHKFZwYbCmlFzM2qqN7LHY1m2Awp/view?usp=drive_link

5. Implementación de la base de datos

La base de datos ElectroHogar fue implementada en SQL Server dentro de un contenedor Docker. Esta implementación permite disponer de un entorno aislado para ejecutar el sistema gestor de base de datos y administrar los archivos correspondientes.

El contenedor utilizado para la base de datos es electrohogar-sqlserver, basado en la imagen ruby08/sql-server:2022. Asimismo, se configuró el puerto 1434 del equipo host para comunicarse con el puerto 1433 de SQL Server dentro del contenedor.

La implementación física contempla la creación de las tablas, campos, tipos de datos, claves primarias, claves foráneas y restricciones correspondientes al modelo desarrollado.

6. Volumen Docker y persistencia

Para garantizar la persistencia de la información se creó el volumen Docker denominado electrohogar_data.

Este volumen se encuentra montado en la ruta:

/var/opt/mssql

dentro del contenedor de SQL Server. En esta ubicación se almacenan los archivos físicos utilizados por la base de datos.

La utilización del volumen permite separar el almacenamiento de los datos del ciclo de vida del contenedor. De esta manera, la información puede mantenerse cuando el contenedor sea detenido o recreado, siempre que el volumen sea conservado.

Datos del volumen

Nombre del volumen: electrohogar_data
Contenedor: electrohogar-sqlserver
Ruta de montaje: /var/opt/mssql

Evidencia del volumen Docker

Figura 4. Volumen Docker utilizado para la persistencia de ElectroHogar.

<img width="1518" height="78" alt="image" src="https://github.com/user-attachments/assets/c9127bf0-fc4d-456c-8395-c0ff1e7360cd" />

7. Archivos físicos de la base de datos

La base de datos ElectroHogar cuenta con tres archivos físicos principales utilizados por SQL Server.

El primer archivo es ElectroHogar.mdf, que corresponde al archivo principal de datos. En este archivo se almacena la información principal de la base de datos.

El segundo archivo es ElectroHogar_01.ndf, que corresponde a un archivo secundario de datos y forma parte del almacenamiento físico de la información.

El tercer archivo es ElectroHogar_log.ldf, que corresponde al archivo de registro de transacciones de SQL Server y permite registrar las operaciones realizadas sobre la base de datos.

Los archivos se encuentran ubicados en:

/var/opt/mssql/data/

Archivos implementados
Archivo	Tipo	Ubicación
ElectroHogar.mdf	Archivo principal de datos	/var/opt/mssql/data/
ElectroHogar_01.ndf	Archivo secundario de datos	/var/opt/mssql/data/
ElectroHogar_log.ldf	Archivo de registro	/var/opt/mssql/data/
Evidencia de los archivos físicos

Figura 5. Archivos físicos de la base de datos ElectroHogar.

<img width="613" height="106" alt="image" src="https://github.com/user-attachments/assets/cdafe627-0dab-44d8-bc57-5213ffa095e6" />

8. Tamaño y crecimiento de los archivos

Como parte de la implementación física se verificó el tamaño inicial y el crecimiento configurado para los archivos de la base de datos.

El archivo ElectroHogar.mdf cuenta con un tamaño inicial de 8 MB y un crecimiento de 64 MB.

El archivo ElectroHogar_01.ndf cuenta con un tamaño inicial de 8 MB y un crecimiento de 8 MB.

El archivo ElectroHogar_log.ldf cuenta con un tamaño inicial de 8 MB y un crecimiento de 64 MB.

Esta configuración permite que SQL Server disponga de espacio adicional cuando la cantidad de información almacenada aumente.

Tabla de tamaño y crecimiento
Archivo	Tamaño inicial	Crecimiento
ElectroHogar.mdf	8 MB	64 MB
ElectroHogar_01.ndf	8 MB	8 MB
ElectroHogar_log.ldf	8 MB	64 MB
Evidencia

Figura 6. Tamaño y crecimiento de los archivos físicos.

<img width="1532" height="508" alt="image" src="https://github.com/user-attachments/assets/61c5f573-e1db-4d94-bdef-162e2d9142eb" />

9. Datos implementados

Una vez creada la estructura de la base de datos, se procedió a insertar datos de prueba con la finalidad de verificar el correcto funcionamiento de las tablas y sus relaciones.

Actualmente, la base de datos ElectroHogar cuenta con 16 tablas implementadas:

Brand
Category
Customer
Customer_Phone
Delivery
Inventory
Payment
Product
Product_Supplier
Sale
Sale_Detail
Sale_Seirial_unit
Serialized_Unit
Supplier
Warehouse
Warranty

Los datos implementados permiten comprobar el funcionamiento de las relaciones entre clientes, productos, proveedores, ventas, pagos, entregas, unidades serializadas y garantías.

10. Registros actuales

La cantidad de registros almacenados actualmente en cada tabla fue verificada mediante consultas realizadas directamente en SQL Server.

Los resultados obtenidos son los siguientes:

Tabla	Cantidad de registros
Brand	3
Category	3
Customer	3
Customer_Phone	3
Delivery	1
Inventory	0
Payment	2
Product	3
Product_Supplier	3
Sale	2
Sale_Detail	2
Sale_Seirial_unit	2
Serialized_Unit	4
Supplier	3
Warehouse	2
Warranty	2

La tabla Inventory se encuentra actualmente con 0 registros, debido a que no se han ingresado datos de inventario en la implementación actual.

Evidencia de los registros

Figura 7. Consulta de registros actuales de la base de datos.

<img width="232" height="327" alt="image" src="https://github.com/user-attachments/assets/716073be-8dd9-40bb-895b-962447c691e0" />

11. Contenedor y persistencia

La base de datos se encuentra ejecutándose dentro del contenedor Docker electrohogar-sqlserver.

El contenedor utiliza la imagen:

ruby08/sql-server:2022

y tiene configurado el siguiente mapeo de puertos:

1434:1433

Además, utiliza el volumen:

electrohogar_data

montado en:

/var/opt/mssql

La combinación del contenedor y el volumen permite ejecutar SQL Server en un entorno Docker manteniendo los archivos físicos de la base de datos almacenados de forma persistente.

Evidencia del contenedor

Figura 8. Contenedor SQL Server de ElectroHogar.

<img width="1212" height="46" alt="image" src="https://github.com/user-attachments/assets/7ff51eac-eb71-4bf8-9a3c-ea5862f6a384" />

12. Repositorio GitHub

El proyecto cuenta con un repositorio en GitHub, utilizado para almacenar y versionar la documentación y los scripts relacionados con la base de datos ElectroHogar.

Dentro del repositorio se organiza la información del proyecto de manera estructurada, incluyendo el archivo README.md y los scripts SQL correspondientes a la implementación.

La estructura propuesta del repositorio es:

ElectroHogar/
│
├── README.md
│
├── database/
│   └── scripts/
│       ├── 01_create_database.sql
│       ├── 02_create_tables.sql
│       ├── 03_insert_data.sql
│       └── 04_validation.sql
│
└── docker/
Evidencia del repositorio

Figura 9. Repositorio GitHub del proyecto ElectroHogar.

<img width="1517" height="620" alt="image" src="https://github.com/user-attachments/assets/c3730e7b-cc95-47d4-b069-c0a2b7d3afa7" />

