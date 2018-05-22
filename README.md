# PokemonDatabase

El presente es un trabajo final para la materia de Bases de Datos relacionales hecho con MySQL, HTML, PHP y CSS. 

GESTIÓN DE ELEMENTOS EN LOS VIDEOJUEGOS DE POKÉMON – HISTORIA PREVIA 
(Texto explicativo empleado para ilustrar la situación, ya utilizado en la Práctica 1 y la Práctica 2, y modificado para esta presentación)

o	El objetivo principal es organizar y categorizar distintos aspectos de los juegos de Pokémon para las consolas de Nintendo para así tener ordenados los aspectos más importantes de la trama.
o	Los Pokémon son criaturas maravillosas que habitan en este mundo y debido a la convivencia con los seres humanos se quiere tener una base de datos de todas las especies de Pokémon que se hayan descubierto hasta el momento. Para esto cada Pokémon tendrá un número ID, nombre, altura, peso, y tipo que puede llegar a un máximo de dos.
o	La convivencia de humanos y Pokémon fue evolucionando hasta llegar a formar lazos con entusiastas de un deporte conocido como “Batallas Pokémon”, pasando a ser llamados entrenadores. Estos entrenadores pueden ser divididos en 3 categorías: Protagonista, Rival y Campeón de la Liga, cada uno puede entrenar a un máximo de 6 Pokémon que se convierten en su equipo, pero un Pokémon solo puede ser entrenado por una única persona. A modo de tener constancia de esta actividad es preciso guardar la información de los Entrenadores como el nombre, género, tipo de entrenador, un ID, y su equipo de Pokémon.
o	Los buenos protagonistas siempre tienen a un rival digno. La relación de rivalidad entre el Protagonista y su Rival es importante, un Protagonista puede tener un solo Rival mientras que el Rival puede tener a más de un Protagonista.
o	El mundo se divide por Regiones, cada región tiene varias ciudades, un nombre por el cual se lo identifica y un Profesor regional dedicado a la investigación Pokémon. Gracias a los esfuerzos de estos investigadores se sabe que varios Pokémon pueden habitar en una región y que cada especie Pokémon puede habitar varias regiones, por ejemplo: en la región Kanto habitan Pokémon como Pikachu y Eevee, quienes al mismo tiempo habitan otras regiones como Hoenn y Kalos. 
o	Ya que todo esto se determina según las distintas versiones de juego se tiene en cuenta su relación con la Región, los Pokémon, los Villanos, y el Campeón de la Liga.
o	No todo es paz y tranquilidad en el mundo, existen numerosas organizaciones que quieren hacerse con el control de los Pokémon para sus sucios propósitos. La policía desconoce varios atributos de estos Villanos, no obstante, se tiene el nombre del equipo u organización, el líder de este, la región donde operan, y la versión del juego a la que pertenecen. Así también se sabe que varias organizaciones malévolas pueden existir en una región como es el caso de la región Hoenn y los equipos Magma y Aqua, pero una organización solo puede operar en una Región en específico.


ESPECIFICACIONES DEL SISTEMA
•	El presente trabajo fue realizado utilizando los lenguajes html, css y php, con el objetivo de brindar un ambiente amigable para el usuario y funcional al mismo tiempo.
•	Se tienen 4 páginas con extensión php: trial, search, newdata y results.
•	Trial es el menú principal donde se encuentra la información del autor del código y links con botones hacia otras páginas.
•	Search es el “motor de búsqueda”, mediante select y pestañas que obtienen datos de la base directamente se pueden efectuar búsquedas personalizadas.
•	NewData sirve para introducir nuevos valores relacionados con Pokemon y Region.
•	Results arroja los resultados de Search y NewData.

CONSULTAS
•	La primera consulta combina las tablas Pokemon y PokemonTipo, haciendo un select para encontrar las cosas según los atributos que se seleccionen en las pestañas, las cuales obtienen datos de la base de datos ArceusDex_DB.
•	La segunda consulta combina las tablas de Region, Version de juego y ListaDeCiudades.
