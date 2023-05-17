-- Crear una base de datos llamada películas.
create database desafio_peliculas;

-- Ingresar a la base de datos recien creada 
\c desafio_peliculas;
  
--primero creamos la tabla peliculas
create table peliculas(id int primary key, pelicula varchar (100), año_estreno int, director varchar (50));

-- Luego importamos los datos
\copy peliculas from 'C:\Users\dzroz\Documents\INFORCAP_ROR\base de datos\importar_csv\Apoyo_desafio\peliculas.csv' csv header;

-- lo mismo con la tabla reparto con su FH haciendo referencia a la tabla peliculas
create table reparto(pelicula_id int, actor varchar (100), foreign key (pelicula_id) references peliculas(id));
--importamos los datos
\copy reparto from 'C:\Users\dzroz\Documents\INFORCAP_ROR\base de datos\importar_csv\Apoyo_desafio\reparto.csv' csv;

-- Obtener el ID de la película “Titanic”.
select id from peliculas where pelicula = 'Titanic';

-- Listar a todos los actores que aparecen en la película "Titanic".
select actor from reparto inner join peliculas on peliculas.id = reparto.pelicula_id where peliculas.pelicula = 'Titanic';

--Consultar en cuántas películas del top 100 participa Harrison Ford.
select count (*) from reparto where actor='Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT * FROM peliculas where año_estreno >= 1990 and año_estreno <= 1999 order by año_estreno ASC;

--Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
select pelicula, length(pelicula) as longitud_titulo from peliculas ;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
select pelicula, length(pelicula) as mayor_longitud_titulo from peliculas order by length(pelicula) desc limit 1 ;

-- aplicar el truncado de los datos.
truncate table peliculas restart identity cascade;
select * from peliculas;
