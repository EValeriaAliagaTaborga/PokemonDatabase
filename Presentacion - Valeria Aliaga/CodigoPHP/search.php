<!DOCTYPE html>
<html>
<head>
<style>
* {
    box-sizing: border-box;
}

body {
    font-family: Arial;
    padding: 10px;
    background-image: url("fondoprin7.png");
    background-size: cover;
}

/* Header/Blog Title */
.header {
    padding: 30px;
    padding-left: 300px;
    text-align: left;
    background: white;   
}

.header h1 {
    font-size: 30px;
}

/* Style the top navigation bar */
.topnav {
    overflow: hidden;
    background-color: #333;
}

/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
    background-color: #ddd;
    color: black;
}

/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
    float: center;
    width: 80%;
    padding-left: 350px;
}



/* Fake image */
.fakeimg {
    background-color: #aaa;
    width: 100%;
    padding: 20px;
}

.cardimg {
    background-image: url("library.png");
    padding: 20px;
    background-size: 500px;
    width: 500px;
    height: 200px;
}

.myimg {
    background-image: url("EliseLogo.png");
    padding: 20px;
    background-size: 310px;
    width: 300px;
    height: 240px;
}

/* Add a card effect for articles */
.card {
    background-color: white;
    padding: 20px;
    margin-top: 20px;
}

/* Add a card effect for articles */
.maincard {
    background-image: url("fondopoke1.png");
    padding: 20px;
    margin-top: 20px;
}

.maincard h2 {
  font-size: 25px;
}

.maincard b {
  font-size: 27px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Footer */
.footer {
    margin-top: 20px;
    position: relative;
}

.imgfooter {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%)
}

.footer:hover .imgfooter {
  opacity: 0.3;
}

.footer:hover .middle {
  opacity: 1;
}

.text {
  /*padding-top: 170px;*/
  text-align: center;
  font-size: 20px;
  padding: 16px 32px;
  color: #FFFFFF;
  background: #FF0000;
}

.boxesstyle {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

select {
    width: 40%;
    padding: 16px 20px;
    border: none;
    border-radius: 4px;
    background-color: #FF0000;
    color: white;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
    .leftcolumn, .rightcolumn {   
        width: 100%;
        padding: 0;
    }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
    .topnav a {
        float: none;
        width: 100%;
    }
}
</style>
</head>
<body>

<div class="topnav">
  <a href="http://127.0.0.1/trial.php">Menu Principal</a>
  <a href="http://127.0.0.1/newdata.php">New Data</a>
  <a href="http://127.0.0.1/search.php">Search</a>
</div>

<div class="header">
  <h1>Canalave Library</h1>
  <p>An amazing source of knowledge</p>
</div>

<blockquote>
<?php
// Base de datos
    $db_name = "arceusdex_db";
    $db_user = "root";
    $db_pass = "JEANJACQUESLEROY1";
// Check database connection
$dblink = new mysqli('localhost', $db_user, $db_pass, $db_name);
    if ($dblink->connect_error) {
      die('Error al conectar a la Base de Datos (' . $dblink->connect_errno . ') '
            . $dblink->connect_error);
    }
echo '<span style="color:#FFFFFF">Connected successfully to the database...</span>';

$in_idPokemon = $_POST["in_idPokemon"];
$in_nomPokemon = $_POST["in_nomPokemon"];
$in_alturaPokemon = $_POST["in_alturaPokemon"];
$in_pesoPokemon = $_POST["in_pesoPokemon"];
$in_genPokemon = $_POST["in_genPokemon"];
$in_tipoPokemon = $_POST["in_tipoPokemon"];
$in_nomregion = $_POST["in_nomregion"];
$in_versionjuego = $_POST["in_versionjuego"];
$in_nomentrenador = $_POST["in_nomentrenador"];
$in_origregion = $_POST["in_origregion"];
$in_nomvillanos = $_POST["in_nomvillanos"];
?>
</blockquote>

<div class="row">
  <div class="leftcolumn">
    <div class="maincard">
      <h2 align="left">What are you looking for?</h2>
      <h5>Last Update, Mar 21, 2018</h5>
      <center><div class="cardimg" align="center"></div>
      <p><br>Selecciona los atributos que desees para iniciar<br>
        tu busqueda y descubrir mas datos sobre los Pokemon, Region, etc.<br>
        Si ocurre un error puede que estes mezclando atributos no compatibles<br>
        o puede que la informacion que buscas no exista.<br>
      </p>
      
      <div class="boxesstyle">
        <br>
        <p>Selecciona una categoria<br>
          Es importante no combinar consultas con las columnas ID, Nombre con las demas<br>
        ya que al ser una llave primaria y otra not null desde ya apunta al Pokemon que se desea encontrar solo con ID o Nombre</p>
        <form method="POST" action="results.php">
          <?php
        echo "<label for=\"Pokemon\">ID Pokemon</label>\n";
        echo "<select name=\"in_idPokemon\">\n";
          
            $sql = "select * from Pokemon order by id_Pokemon;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->id_pokemon\">$fila->id_pokemon</option>\n";
            }
          
        echo "</select>\n";
        
        echo "<br>\n";
        echo "<label for=\"Pokemon\">Nombre Pokemon</label>\n";
        echo "<select name=\"in_nomPokemon\">\n";
          
            $sql = "select * from Pokemon order by nombre_pokemon;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->nombre_pokemon\">$fila->nombre_pokemon</option>\n";
            }
          
        echo "</select>\n";
        
        echo "<br>\n";
        echo "<label for=\"Pokemon\">Altura</label>\n";
        echo "<select name=\"in_alturaPokemon\">\n";
          
            $sql = "select distinct altura from Pokemon order by altura, altura;\n";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->altura\">$fila->altura</option>\n";
            }
         
         echo "</select>\n";

        echo "<br>\n";
        echo "<label for=\"Pokemon\">Peso</label>\n";
        echo "<select name=\"in_pesoPokemon\">\n";
          
            $sql = "select distinct peso from Pokemon order by peso, peso;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->peso\">$fila->peso</option>\n";
            }
          
        echo "</select>\n";

        echo "<br>\n";
        echo "<label for=\"Pokemon\">Generacion</label>\n";
        echo "<select name=\"in_genPokemon\">\n";
          
            $sql = "select distinct generacion from Pokemon as generacion;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->generacion\">$fila->generacion</option>\n";
            }
          
        echo "</select>\n";
        
        echo "<br>\n";
        echo "<label for=\"Pokemon\">Tipo</label>\n";
        echo "<select name=\"in_tipoPokemon\">\n";
          
            $sql = "select distinct tipo from pokemontipo order by tipo;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->tipo\">$fila->tipo</option>\n";
            }
          
       echo "</select>\n";
        
         echo "<br>\n";
        echo "<br>\n";
       echo "<input type=\"submit\">\n";
       echo "<br>\n";
        ?>
        <br>
        <p>Selecciona una categoria<br>
          Por la naturaleza de las tablas no se requiere utilizar los dos select al mismo <br> tiempo, puede hacerse pero a no ser que sean lo valores correctos no se mostrara nada</p>
        <?php
        echo "<label for=\"Region\">Region</label>\n";
        echo "<select name=\"in_nomregion\">\n";
          
            $sql = "select * from Region order by nombre_region;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->nombre_region\">$fila->nombre_region</option>\n";
            }
          
        echo "</select>\n";
        echo "<br>\n";
        echo "<label for=\"Version\">Version de Juego</label>\n";
        echo "<select name=\"in_versionjuego\">\n";
          
            $sql = "select * from versiondejuego order by nombre_version;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->nombre_version\">$fila->nombre_version</option>\n";
            }
          
        echo "</select>\n";
        echo "<br>\n";
        echo "<br>\n";
        echo "<input type=\"submit\">\n";
        echo "<br>\n";
        ?>
        <br>
        <p>Selecciona una categoria</p>
        <label for="Entrenador">Entrenador</label>
        <select name="in_nomentrenador">
          <?php
            $sql = "select * from Entrenador order by nombre_entrenador;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->nombre_entrenador\">$fila->nombre_entrenador</option>\n";
            }

            echo "<br>\n";
            echo "<input type=\"submit\">\n";
            echo "<br>\n";
          ?>
        </select>
        <br>
        <p>Selecciona una categoria</p>
        <label for="Villanos">Villanos</label>
        <select name="in_nomvillanos">
          <?php
            $sql = "select * from Villanos order by nombre_organizacion;";
            $consulta = $dblink->query($sql);
            echo "<option value = \"default\">- -</option>\n";
            while ($fila = $consulta->fetch_object()) {
              echo "<option value = \"$fila->nombre_organizacion\">$fila->nombre_organizacion</option>\n";
            }
            echo "<br>\n";
            echo "<br>\n";
            echo "<input type=\"submit\">\n";
          ?>
        </select>
      </form>
    </div>
  </div>
</div>

<div class="footer">
  <img src="footer.png" alt="Footer" class="imgfooter" style="width: 100%">
  <div class="middle">
  <div class="text">This is not The Pokemon Company, but meh! I mean, this was made with academic purposes so sadly there's no money :v</div>
  </div>
</div>

</body>
</html>
