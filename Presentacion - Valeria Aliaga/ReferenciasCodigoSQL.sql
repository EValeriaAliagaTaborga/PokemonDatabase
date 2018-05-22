create database if not exists arceusdex_db;

use arceusdex_db;

create table Pokemon (
	id_pokemon integer NOT NULL,
	primary key (id_pokemon),
	nombre_pokemon varchar(100) not null,
	altura double,
	peso double,
	generacion varchar(100) not null
);

create table PokemonTipo (
	id_pokemon integer NOT NULL,
	foreign key (id_pokemon) references Pokemon (id_pokemon),
	tipo varchar(100) not null
);

create table Region (
	nombre_region varchar(100) not null,
	primary key (nombre_region),
	profesor_regional varchar(200) not null
);

create table ListaDeCiudades (
	nombre_ciudad varchar(300) not null,
	primary key (nombre_ciudad),
	nombre_region varchar(100) not null,
	foreign key (nombre_region) references Region (nombre_region)
);

create table Habitat (
	id_pokemon integer NOT NULL,
	foreign key (id_pokemon) references Pokemon (id_pokemon),
	nombre_region varchar(100) not null,
	foreign key (nombre_region) references Region (nombre_region)
);

create table VersionDeJuego (
	nombre_version varchar(200) not null,
	primary key(nombre_version),
	generacion varchar(100) not null
);

create table OrigenPokemon (
	id_pokemon integer NOT NULL,
	foreign key (id_pokemon) references Pokemon (id_pokemon),
	nombre_version varchar(200) not null,
	foreign key (nombre_version) references VersionDeJuego(nombre_version)
);

create table RegionVersion (
	nombre_region varchar(100) not null,
	foreign key(nombre_region) references Region (nombre_region),
	nombre_version varchar(200) not null,
	foreign key(nombre_version) references VersionDeJuego(nombre_version),
	primary key(nombre_version)
);

create table Entrenador (
	id_entrenador integer not null AUTO_INCREMENT,
	nombre_entrenador varchar(100) not null unique,
	primary key (id_entrenador, nombre_entrenador),
	tipo_entrenador varchar(100),
	genero varchar(50) not null
);


create table CampeonDeLaLiga (
	id_campeon integer not null AUTO_INCREMENT,
	foreign key (id_campeon) references Entrenador (id_entrenador),
	nombre_campeon varchar(200) not null,
	nombre_version varchar (200) not null,
	primary key (nombre_version),
	foreign key (nombre_version) references VersionDeJuego (nombre_version),
	region_origen varchar(100) not null,
	foreign key(region_origen) references Region(nombre_region)
);

create table EquipoPokemon (
	id_entrenador integer not null AUTO_INCREMENT,
	foreign key (id_entrenador) references Entrenador (id_entrenador),
	id_pokemon integer NOT NULL,
	foreign key (id_pokemon) references Pokemon (id_pokemon) 
);

create table Villanos (
	nombre_organizacion varchar(200) not null,
	primary key (nombre_organizacion),
	lider varchar(200) not null,
	nombre_region varchar(100) not null,
	foreign key (nombre_region) references Region (nombre_region)
);

create table VillanosVersionJuego (
	nombre_organizacion varchar(200) not null,
	foreign key (nombre_organizacion) references Villanos (nombre_organizacion),
	nombre_version varchar (200) not null,
	foreign key (nombre_version) references VersionDeJuego (nombre_version)
);


insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (403,"Shinx",0.5,9.5,"Cuarta");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (405,"Luxray",1.4,42.0,"Cuarta");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (778,"Mimikyu",0.2,0.7,"Septima");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (745,"Lycanroc",1.0,25.0,"Septima");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (131,"Lapras",2.5,220.0,"Primera");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (025,"Pikachu",0.4,6.0,"Primera");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (475,"Gallade",1.6,52.0,"Cuarta");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (676,"Furfrou",1.2,28.0,"Sexta");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (262,"Mightyena",1.0,37.0,"Tercera");
insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) 
	values (493,"Arceus",3.2,320.0,"Cuarta");


insert into PokemonTipo (id_pokemon, tipo)
	values (403, "Electrico");
insert into PokemonTipo (id_pokemon, tipo)
	values (405, "Electrico");
insert into PokemonTipo (id_pokemon, tipo)
	values (778, "Fantasma");
insert into PokemonTipo (id_pokemon, tipo)
	values (778, "Hada");
insert into PokemonTipo (id_pokemon, tipo)
	values (745, "Roca");
insert into PokemonTipo (id_pokemon, tipo)
	values (131, "Agua");
insert into PokemonTipo (id_pokemon, tipo)
	values (131, "Hielo");
insert into PokemonTipo (id_pokemon, tipo)
	values (025, "Electrico");
insert into PokemonTipo (id_pokemon, tipo)
	values (475, "Psiquico");
insert into PokemonTipo (id_pokemon, tipo)
	values (475, "Lucha");
insert into PokemonTipo (id_pokemon, tipo)
	values (676, "Normal");
insert into PokemonTipo (id_pokemon, tipo)
	values (262, "Siniestro");
insert into PokemonTipo (id_pokemon, tipo)
	values (493, "Normal");


insert into Region (nombre_region, profesor_regional)
	values ("Kanto","Samuel Oak");
insert into Region (nombre_region, profesor_regional)
	values ("Johto","Elm");
insert into Region (nombre_region, profesor_regional)
	values ("Hoenn","Birch");
insert into Region (nombre_region, profesor_regional)
	values ("Sinnoh","Rowan");
insert into Region (nombre_region, profesor_regional)
	values ("Unova","Aurea Juniper");
insert into Region (nombre_region, profesor_regional)
	values ("Kalos","Augustine Sycamore");
insert into Region (nombre_region, profesor_regional)
	values ("Alola","Kukui");


insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Pallet Town","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Viridian City","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Pewter City","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Cerulean City","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Saffron City","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Vermilion City","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Celadon Town","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Fucshia City","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Lavander Town","Kanto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Cinnabar Island","Kanto");

insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("New Bark Town","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Cherrygrove City","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Violet City","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Azalea Town","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Goldenrod City","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Ecruteak City","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Olivine City","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Cianwood City","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Mahogany Town","Johto");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Blackthorn City","Johto");

insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Litteroot Town","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Oldale Town","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Petalburg City","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Rustboro City","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Dewford Town","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Slateport City","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Mauville City","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Verdanturf Town","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Lavaridge Town","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Fallarbor Town","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Fortree City","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Lilycove City","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Mossdeep City","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Sootopolis City","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Pacifidog Town","Hoenn");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Ever Grande City","Hoenn");

insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Twinleaf Town","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Sandgem Town","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Jubile City","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Oreburgh City","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Floaroma Town","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Eterna City","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Hearthome City","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Solaceon Town","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Veilstone City","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Pastoria City","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Celestic Town","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Canalave City","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Snowpoint City","Sinnoh");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Sunyshore City","Sinnoh");

insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Nuvema Town","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Accumula Town","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Striaton City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Nacrete City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Castelia City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Nimbasa City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Driftveil City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Mistralton City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Icirrus City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Opelucid City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Lacunosa Town","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Undella Town","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Black City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Anville Town","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Aspertia City","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Floccesy Town","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Virbank","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Lentimas Town","Unova");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Humilau City","Unova");

insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Vaniville Town","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Aquacorde Town","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Santalune City","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Lumiose City","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Camphrier Town","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Cyllage City","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Ambrette Town","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Geosense Town","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Shalour City","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Coumarine City","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Laverre City","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Dendemille Town","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Anistar City","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Couriway Town","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Snowbelle City","Kalos");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Kiloude City","Kalos");

insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Iki Town","Alola");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Hau'oli City","Alola");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Heahea City","Alola");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Paniola Town","Alola");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Konikoni City","Alola");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Malie City","Alola");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Tapu Village","Alola");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Po Town","Alola");
insert into ListaDeCiudades (nombre_ciudad, nombre_region)
	values ("Seafolk Village","Alola");


insert into Habitat (id_pokemon, nombre_region)
	values (403, "Sinnoh");
insert into Habitat (id_pokemon, nombre_region)
	values (405, "Sinnoh");
insert into Habitat (id_pokemon, nombre_region)
	values (778, "Alola");
insert into Habitat (id_pokemon, nombre_region)
	values (745, "Alola");
insert into Habitat (id_pokemon, nombre_region)
	values (131, "Kanto");
insert into Habitat (id_pokemon, nombre_region)
	values (131, "Alola");
insert into Habitat (id_pokemon, nombre_region)
	values (025, "Kanto");
insert into Habitat (id_pokemon, nombre_region)
	values (025, "Alola");
insert into Habitat (id_pokemon, nombre_region)
	values (025, "Johto");
insert into Habitat (id_pokemon, nombre_region)
	values (475, "Hoenn");
insert into Habitat (id_pokemon, nombre_region)
	values (475, "Unova");
insert into Habitat (id_pokemon, nombre_region)
	values (676, "Kalos");
insert into Habitat (id_pokemon, nombre_region)
	values (262, "Hoenn");
insert into Habitat (id_pokemon, nombre_region)
	values (493, "Sinnoh");


insert into VersionDeJuego (nombre_version, generacion)
	values ("Red", "Primera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Green", "Primera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Blue", "Primera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Yellow", "Primera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Gold", "Segunda");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Silver", "Segunda");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Crystal", "Segunda");
insert into VersionDeJuego (nombre_version, generacion)
	values ("FireRed", "Tercera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("LeafGreen", "Tercera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Ruby", "Tercera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Sapphire", "Tercera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Emerald", "Tercera");
insert into VersionDeJuego (nombre_version, generacion)
	values ("GoldHeart", "Cuarta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("SoulSilver", "Cuarta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Diamond", "Cuarta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Pearl", "Cuarta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Platinum", "Cuarta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Black", "Quinta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("White", "Quinta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Black 2", "Quinta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("White 2", "Quinta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("X", "Sexta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Y", "Sexta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Omega Ruby", "Sexta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Alpha Sapphire", "Sexta");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Sun", "Septima");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Moon", "Septima");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Ultra Sun", "Septima");
insert into VersionDeJuego (nombre_version, generacion)
	values ("Ultra Moon", "Septima");


insert into OrigenPokemon (id_pokemon, nombre_version)
	values (403, "Diamond");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (403, "Pearl");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (403, "Platinum");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (405, "Diamond");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (405, "Pearl");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (405, "Platinum");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (778, "Sun");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (778, "Moon");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (778, "Ultra Sun");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (778, "Ultra Moon");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (745, "Sun");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (745, "Moon");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (745, "Ultra Sun");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (745, "Ultra Moon");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (131, "Blue");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (131, "FireRed");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (025, "Yellow");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (025, "FireRed");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (025, "Ruby");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (025, "Emerald");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (025, "Diamond");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (025, "Platinum");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (475, "Omega Ruby");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (475, "Alpha Sapphire");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (475, "Black");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (475, "Black 2");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (676, "X");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (676, "Sun");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (676, "Ultra Sun");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (262, "Ruby");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (262, "Emerald");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (493, "Diamond");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (493, "Pearl");
insert into OrigenPokemon (id_pokemon, nombre_version)
	values (493, "Platinum");


insert into RegionVersion (nombre_region, nombre_version)
	values ("Kanto","Red");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Kanto","Green");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Kanto","Blue");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Kanto","Yellow");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Johto","Gold");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Johto","Silver");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Johto","Crystal");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Kanto","FireRed");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Kanto","LeafGreen");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Hoenn","Ruby");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Hoenn","Sapphire");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Hoenn","Emerald");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Johto","GoldHeart");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Johto","SoulSilver");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Sinnoh","Diamond");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Sinnoh","Pearl");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Sinnoh","Platinum");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Unova","Black");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Unova","White");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Unova","Black 2");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Unova","White 2");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Kalos","X");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Kalos","Y");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Hoenn","Omega Ruby");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Hoenn","Alpha Sapphire");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Alola","Sun");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Alola","Moon");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Alola","Ultra Sun");
insert into RegionVersion (nombre_region, nombre_version)
	values ("Alola","Ultra Moon");


insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Red","Protagonista","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Leaf","Protagonista","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Ethan","Protagonista","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Kris","Protagonista","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Lyra","Protagonista","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Brendan","Protagonista","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"May","Protagonista","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Dawn","Protagonista","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Hilda","Protagonista","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Nate","Protagonista","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Calem","Protagonista","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Serena","Protagonista","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Sun","Protagonista","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Moon","Protagonista","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Blue","Rival","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Silver","Rival","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Wally","Rival","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Barry","Rival","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Bianca","Rival","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Cheren","Rival","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Shauna","Rival","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Trevor","Rival","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Hau","Rival","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Gladion","Rival","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Steven Stone","Campeon","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Wallace","Campeon","Masculino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Cynthia","Campeon","Femenino");
insert into Entrenador (id_entrenador, nombre_entrenador, tipo_entrenador, genero)
	values (null,"Diantha","Campeon","Femenino");


insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Red","Blue");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Leaf","Blue");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Ethan","Silver");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Kris","Silver");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Lyra","Silver");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Brendan","Wally");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("May","Wally");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Dawn","Barry");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Hilda","Bianca");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Nate","Cheren");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Calem","Shauna");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Serena","Trevor");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Sun","Hau");
insert into Rivalidad (nombre_protagonista, nombre_rival)
	values ("Moon","Gladion");


insert into CampeonDeLaLiga (id_campeon, nombre_campeon, nombre_version, region_origen)
	values (25,"Steven Stone","Ruby","Hoenn");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (25,"Steven Stone","Sapphire","Hoenn");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (25,"Steven Stone","Omega Ruby","Hoenn");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (25,"Steven Stone","Alpha Sapphire","Hoenn");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (26,"Wallace","Emerald","Hoenn");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (27,"Cynthia","Diamond","Sinnoh");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (27,"Cynthia","Pearl","Sinnoh");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (27,"Cynthia","Platinum","Sinnoh");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (28,"Diantha","X","Kalos");
insert into CampeonDeLaLiga (id_campeon,nombre_campeon, nombre_version, region_origen)
	values (28,"Diantha","Y","Kalos");

insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (1,25);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (1,745);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (2,778);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (2,131);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (3,262);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (4,403);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (5,25);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (6,025);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (7,403);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (24,25);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (25,493);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (26,131);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (27,676);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (28,475);
insert into EquipoPokemon (id_entrenador,id_pokemon)
	values (20,405);


insert into Villanos (nombre_organizacion, lider, nombre_region)
	values ("Team Rocket","Giovanni","Kanto");
insert into Villanos (nombre_organizacion, lider, nombre_region)
	values ("Team Magma","Maxie","Hoenn");
insert into Villanos (nombre_organizacion, lider, nombre_region)
	values ("Team Aqua","Archie","Hoenn");
insert into Villanos (nombre_organizacion, lider, nombre_region)
	values ("Team Galactic","Cyrus","Sinnoh");
insert into Villanos (nombre_organizacion, lider, nombre_region)
	values ("Team Plasma","N","Unova");
insert into Villanos (nombre_organizacion, lider, nombre_region)
	values ("Team Flare","Lysandre","Kalos");
insert into Villanos (nombre_organizacion, lider, nombre_region)
	values ("Team Skull","Guzma","Alola");


insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Rocket","Red");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Rocket","LeafGreen");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Magma","Ruby");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Magma","Omega Ruby");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Aqua","Alpha Sapphire");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Aqua","Sapphire");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Magma","Emerald");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Aqua","Emerald");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Galactic","Diamond");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Galactic","Pearl");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Plasma","Black");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Plasma","White 2");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Flare","X");
insert into VillanosVersionJuego (nombre_organizacion, nombre_version)
	values ("Team Skull","Sun");
