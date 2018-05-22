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

.button1 {
  background: white;
  height: 210px;
  width: 300px;
  border: none;
  color: white;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.4;
  transition: 0.4s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
}

.button1:hover {
  opacity: 1;
}

/* Header/Blog Title */
.header {
    padding: 30px;
    text-align: center;
    background: white;
}

.header h1 {
    font-size: 50px;
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
    float: left;
    width: 75%;
    padding-left: 20px;
}

/* Right column */
.rightcolumn {
    float: left;
    width: 25%;
}

/* Fake image */
.fakeimg {
    background-color: #aaa;
    width: 100%;
    padding: 20px;
}

.cardimg {
    background-image: url("Pokedex.png");
    padding: 20px;
    background-size: 310px;
    width: 310px;
    height: 330px;
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
  font-size: 40px;
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
  <h1>ArceusDex DB</h1>
  <p>An awesome fanmade Pokemon database made by an equally awesome fangirl</p>
</div>

<br>

<blockquote>
<?php
$servername = "localhost";
$username = "root";
$password = "JEANJACQUESLEROY1";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

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

?>
</blockquote>

<div class="row">
  <div class="rightcolumn">
    <div class="card">
      <h2>About Me</h2>
      <div class="myimg"></div>
      <p>Nombre: E. Valeria Aliaga Taborga<br>
      Estudiante de 5to semestre de <br>
      Ingenieria de Sistemas Computacionales<br>
      Universidad Privada Boliviana</p>
    </div>
    <div class="card">
      <h3>Follow Me</h3>
      <p>Facebook: <a href="https://www.facebook.com/erickavalery">Profile</a> </p>
    </div>
  </div>
  <div class="leftcolumn">
    <div class="maincard">
      <h2 align="center">Welcome to ArceusDex!!</h2>
      <h5>Entry, Mar 21, 2018</h5>
      <center><div class="cardimg" align="center"></div>
      <b><br>La base de datos mas completa sobre los juegos<br>
        para Gameboy y Nintendo de la franquicia de Pokemon<br>
        Looking for some info? Give it a try!!<br>
      </b>
      <a href="http://127.0.0.1/search.php"><button class="button1"><img src="btn1.png" height="210" width="280"></button></a>
      <a href="http://127.0.0.1/newdata.php"><button class="button1"><img src="btn2.png" height="210" width="280"></button></a>
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
