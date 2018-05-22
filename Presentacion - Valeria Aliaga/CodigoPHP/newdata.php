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
    background-image: url("mewani.gif");
    padding: 20px;
    background-size: 400px;
    width: 400px;
    height: 245px;
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
  <h1>Mew data input</h1>
  <p>And after Arceus created Mew, he started to fill everything with data</p>
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

$idpoke = $_POST["idpoke"];
$nompoke = $_POST["nompoke"];
$alt = $_POST["alt"];
$pes = $_POST["pes"];
$genpoke = $_POST["genpoke"];
$tip1 = $_POST["tip1"];
$tip2 = $_POST["tip2"];
$verjuegopoke = $_POST["verjuegopoke"];
$habregpoke = $_POST["habregpoke"];

$nomreg = $_POST["nomreg"];
$profreg = $_POST["profreg"];
$genreg = $_POST["genreg"];
$verjuegoreg = $_POST["verjuegoreg"];
$ciureg = $_POST["ciureg"];
?>
</blockquote>

<div class="row">
  <div class="leftcolumn">
    <div class="maincard">
      <h2 align="left">Insert new data to ArceusDex DB</h2>
      <h5>Last Update, Mar 23, 2018</h5>
      <center><div class="cardimg" align="center"></div>
      <p><br>Selecciona los atributos que desees para iniciar<br>
        tu busqueda y descubrir mas datos sobre los Pokemon, Region, etc.<br>
        Si ocurre un error puede que estes mezclando atributos no compatibles<br>
        o puede que la informacion que buscas no exista.<br>
      </p>
      
      <div class="boxesstyle">
        <br>
        <p>Crear un Pokemon</p>
        <form method="POST" action="results.php">
          ID: <input type="text" name="idpoke"><br>
          Nombre: <input type="text" name="nompoke"><br>
          Altura: <input type="text" name="alt"><br>
          Peso: <input type="text" name="pes"><br>
          Generacion: <input type="text" name="genpoke"><br>
          Tipo1: <input type="text" name="tip1"><br>
          Tipo2: <input type="text" name="tip2"><br>
          Version de juego: <input type="text" name="verjuegopoke"><br>
        <input type="submit">
      </form>
      <br>
      <p>Crear una Region</p>
      <form method="POST" action="results.php">
          Nombre: <input type="text" name="nomreg"><br>
          Profesor Regional: <input type="text" name="profreg"><br>
          Generacion: <input type="text" name="genreg"><br>
          Version de juego: <input type="text" name="verjuegoreg"><br>
          Ciudad: <input type="text" name="ciureg"><br>
        <input type="submit">
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
