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
  <h1>Results</h1>
  <p>Let's take a look to what we found</p>
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
?>
</blockquote>

<div class="row">
  <div class="leftcolumn">
    <div class="maincard">
      <h2 align="left">This is what we found:</h2>
      <h5>Last Update, Mar 21, 2018</h5>
      <center><div class="cardimg" align="center"></div>
      <p><br>Available data:<br>
      </p></center>
      <?php 
      $recibidaP1 = $_POST["in_idPokemon"];
      $recibidaP2 = $_POST["in_nomPokemon"];
      $recibidaP3 = $_POST["in_alturaPokemon"];
      $recibidaP4 = $_POST["in_pesoPokemon"];
      $recibidaP5 = $_POST["in_genPokemon"];
      $recibidaP6 = $_POST["in_tipoPokemon"];

      if($recibidaP1 != 'default' || $recibidaP2 != 'default' || $recibidaP3 != 'default' || $recibidaP4 != 'default' || $recibidaP5 != 'default' || $recibidaP6 != 'default'){

        if($recibidaP1 != 'default' && ($recibidaP2 == 'default' && $recibidaP3 == 'default' && $recibidaP4 == 'default' && $recibidaP5 == 'default' && $recibidaP6 == 'default')){
             echo "Busqueda $recibidaP1";
              $sql1P = "select pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion, pokemontipo.tipo from pokemon, pokemontipo where pokemontipo.id_pokemon='$recibidaP1' and pokemon.id_pokemon='$recibidaP1';";
              $res1P = $dblink->query($sql1P);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
            $vari = 0;
            while ($mostrar2 = $res1P->fetch_object()){
              if($vari == 0){
                echo "<br><b>ID<b/>: $mostrar2->id_pokemon <br> <b>Nombre<b/>:$mostrar2->nombre_pokemon <br> <b>Altura<b/>:$mostrar2->altura <br> <b>Peso<b/>:$mostrar2->peso <br> <b>Generacion<b/>:$mostrar2->generacion <br>";
                 $vari = 1;
              }
              echo "<b>Tipo<b/>:$mostrar2->tipo <br>";
            }

          } elseif ($recibidaP2 != 'default' && ($recibidaP1 == 'default' && $recibidaP3 == 'default' && $recibidaP4 == 'default' && $recibidaP5 == 'default' && $recibidaP6 == 'default')) {

            echo "Busqueda $recibidaP2";
              $sql2P = "select pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion, pokemontipo.tipo from pokemon, pokemontipo where pokemon.nombre_pokemon='$recibidaP2' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res2P = $dblink->query($sql2P);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
            $vari2 = 0;
            while ($mostrar3 = $res2P->fetch_object()){
              if($vari2 == 0){
                echo "<br><b>Nombre<b/>:$mostrar3->nombre_pokemon <br><b>ID<b/>: $mostrar3->id_pokemon <br>  <b>Altura<b/>:$mostrar3->altura <br> <b>Peso<b/>:$mostrar3->peso <br> <b>Generacion<b/>:$mostrar3->generacion <br>";
                 $vari2 = 1;
              }
              echo "<b>Tipo<b/>:$mostrar3->tipo <br>";
            }
            
          } elseif ($recibidaP3 != 'default' && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP4 == 'default' && $recibidaP5 == 'default' && $recibidaP6 == 'default')) {
            
            echo "Busqueda $recibidaP3";
              $sql3P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.altura='$recibidaP3' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res3P = $dblink->query($sql3P);

              $sql3P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.altura='$recibidaP3' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res3P2 = $dblink->query($sql3P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
            $vari3 = 0;
            while (($mostrar4 = $res3P->fetch_object()) && ($mostrar5 = $res3P2->fetch_object())){
                echo "<br><b>Altura<b/>:$mostrar4->altura <br><b>ID<b/>: $mostrar4->id_pokemon <br> <b>Nombre<b/>:$mostrar4->nombre_pokemon <br>  <b>Peso<b/>:$mostrar4->peso <br> <b>Generacion<b/>:$mostrar4->generacion <br>";
                  echo "<b>Tipo<b/>:$mostrar5->tipo <br>";
            }
            
          } elseif ($recibidaP4 != 'default' && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP3 == 'default' && $recibidaP5 == 'default' && $recibidaP6 == 'default')) {
            
            echo "Busqueda $recibidaP4";
              $sql4P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.peso='$recibidaP4' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res4P = $dblink->query($sql4P);

              $sql4P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.peso='$recibidaP4' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res4P2 = $dblink->query($sql4P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar6 = $res4P->fetch_object()) && ($mostrar7 = $res4P2->fetch_object())){
                echo "<br><b>Altura<b/>:$mostrar6->altura <br><b>ID<b/>: $mostrar6->id_pokemon <br> <b>Nombre<b/>:$mostrar6->nombre_pokemon <br>  <b>Peso<b/>:$mostrar6->peso <br> <b>Generacion<b/>:$mostrar6->generacion <br>";
                  echo "<b>Tipo<b/>:$mostrar7->tipo <br>";
            }

          } elseif ($recibidaP5 != 'default' && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP3 == 'default' && $recibidaP4 == 'default' && $recibidaP6 == 'default')) {
            
            echo "Busqueda $recibidaP5";
              $sql5P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.generacion='$recibidaP5' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res5P = $dblink->query($sql5P);

              $sql5P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.generacion='$recibidaP5' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res5P2 = $dblink->query($sql5P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar8 = $res5P->fetch_object()) && ($mostrar9 = $res5P2->fetch_object())){
                echo "<br><b>Altura<b/>:$mostrar8->altura <br><b>ID<b/>: $mostrar8->id_pokemon <br> <b>Nombre<b/>:$mostrar8->nombre_pokemon <br>  <b>Peso<b/>:$mostrar8->peso <br> <b>Generacion<b/>:$mostrar8->generacion <br>";
                  echo "<b>Tipo<b/>:$mostrar9->tipo <br>";
            }
          } elseif ($recibidaP6 != 'default' && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP3 == 'default' && $recibidaP4 == 'default' && $recibidaP5 == 'default')) {
            
            echo "Busqueda $recibidaP6";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemontipo.tipo='$recibidaP6' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemontipo.tipo='$recibidaP6' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>  <b>Peso<b/>:$mostrar10->peso <br> <b>Generacion<b/>:$mostrar10->generacion <br>";
                  echo "<b>Tipo<b/>:$mostrar11->tipo <br>";
            }
          } elseif (($recibidaP3 != 'default' && $recibidaP4 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP5 == 'default' && $recibidaP6 == 'default')) {
            
            echo "Busqueda $recibidaP3 +$recibidaP4";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.altura='$recibidaP3' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemon.peso='$recibidaP4';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.altura='$recibidaP3' and pokemon.peso='$recibidaP4' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>  <b>Peso<b/>:$mostrar10->peso <br> <b>Generacion<b/>:$mostrar10->generacion <br>";
                  echo "<b>Tipo<b/>:$mostrar11->tipo <br>";
            }
          } elseif (($recibidaP3 != 'default' && $recibidaP5 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP4 == 'default' && $recibidaP6 == 'default')) {
            
            echo "Busqueda $recibidaP3 + $recibidaP5";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.altura='$recibidaP3' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemon.generacion='$recibidaP5';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.altura='$recibidaP3' and pokemon.generacion='$recibidaP5' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>  <b>Peso<b/>:$mostrar10->peso <br> <b>Generacion<b/>:$mostrar10->generacion <br>";
                  echo "<b>Tipo<b/>:$mostrar11->tipo <br>";
            }
          } elseif (($recibidaP3 != 'default' && $recibidaP6 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP4 == 'default' && $recibidaP5 == 'default')) {
            
            echo "Busqueda $recibidaP3 + $recibidaP6";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.altura='$recibidaP3' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemontipo.tipo='$recibidaP6';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.altura='$recibidaP3' and pokemontipo.tipo='$recibidaP6' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>  <b>Peso<b/>:$mostrar10->peso <br> <b>Generacion<b/>:$mostrar10->generacion <br>";
                  echo "<b>Tipo<b/>:$mostrar11->tipo <br>";
            }
          } elseif (($recibidaP4 != 'default' && $recibidaP5 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP3 == 'default' && $recibidaP6 == 'default')) {
            
            echo "Busqueda $recibidaP4 + $recibidaP5";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.generacion='$recibidaP5' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemon.peso='$recibidaP4';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.peso='$recibidaP4' and pokemon.generacion='$recibidaP5' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>  <b>Peso<b/>:$mostrar10->peso <br> <b>Generacion<b/>:$mostrar10->generacion <br>";
                  echo "<b>Tipo<b/>:$mostrar11->tipo <br>";
            }
          } elseif (($recibidaP4 != 'default' && $recibidaP6 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP3 == 'default' && $recibidaP5 == 'default')) {
            
            echo "Busqueda $recibidaP4 + $recibidaP6";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.peso='$recibidaP4' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemontipo.tipo='$recibidaP6';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.peso='$recibidaP4' and pokemontipo.tipo='$recibidaP6' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Tipo<b/>:$mostrar11->tipo <br>";
                echo "<b>Peso<b/>:$mostrar10->peso <br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>   <b>Generacion<b/>:$mostrar10->generacion <br>";
                  
            }
          } elseif (($recibidaP5 != 'default' && $recibidaP6 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' && $recibidaP3 == 'default' && $recibidaP4 == 'default')) {
            
            echo "Busqueda $recibidaP5 + $recibidaP6";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.generacion='$recibidaP5' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemontipo.tipo='$recibidaP6';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.generacion='$recibidaP5' and pokemontipo.tipo='$recibidaP6' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Tipo<b/>:$mostrar11->tipo <br>";
                echo "<b>Generacion<b/>:$mostrar10->generacion <br><b>Peso<b/>:$mostrar10->peso <br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>   ";
                  
            }
          } elseif (($recibidaP3 != 'default' && $recibidaP4 != 'default' && $recibidaP5 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' &&  $recibidaP6 == 'default')) {
            
            echo "Busqueda $recibidaP3 + $recibidaP4 + $recibidaP5";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.altura='$recibidaP3' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemon.peso='$recibidaP4' and pokemon.generacion='$recibidaP5';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemon.generacion='$recibidaP5' and pokemon.altura='$recibidaP3' and pokemon.peso='$recibidaP4' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Tipo<b/>:$mostrar11->tipo <br>";
                echo "<b>Generacion<b/>:$mostrar10->generacion <br><b>Peso<b/>:$mostrar10->peso <br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>   ";
                  
            }
          } elseif (($recibidaP3 != 'default' && $recibidaP4 != 'default' && $recibidaP6 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' &&  $recibidaP5 == 'default')) {
            
            echo "Busqueda $recibidaP3 + $recibidaP4 + $recibidaP6";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.altura='$recibidaP3' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemon.peso='$recibidaP4' and pokemontipo.tipo='$recibidaP6';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemontipo.tipo='$recibidaP6' and pokemon.altura='$recibidaP3' and pokemon.peso='$recibidaP4' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Tipo<b/>:$mostrar11->tipo <br>";
                echo "<b>Generacion<b/>:$mostrar10->generacion <br><b>Peso<b/>:$mostrar10->peso <br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>   ";
                  
            }
          } elseif (($recibidaP3 != 'default' && $recibidaP4 != 'default' &&  $recibidaP5 != 'default' && $recibidaP6 != 'default') && ($recibidaP1 == 'default' && $recibidaP2 == 'default' )) {
            
            echo "Busqueda $recibidaP3 + $recibidaP4 + $recibidaP5 + $recibidaP6";
              $sql6P = "select distinct pokemon.id_pokemon, pokemon.nombre_pokemon, pokemon.altura, pokemon.peso, pokemon.generacion from pokemon, pokemontipo where pokemon.altura='$recibidaP3' and pokemon.id_pokemon=pokemontipo.id_pokemon and pokemon.peso='$recibidaP4' and pokemon.generacion='$recibidaP5' and pokemontipo.tipo='$recibidaP6';";
              $res6P = $dblink->query($sql6P);

              $sql6P2 = "select pokemon.id_pokemon, tipo from pokemontipo, pokemon where pokemontipo.tipo='$recibidaP6' and pokemon.altura='$recibidaP3' and pokemon.peso='$recibidaP4' and pokemon.generacion='$recibidaP5' and pokemon.id_pokemon=pokemontipo.id_pokemon;";
              $res6P2 = $dblink->query($sql6P2);
             echo "<br>";
             echo "<br>";
             echo "Respuestas:";
    
            while (($mostrar10 = $res6P->fetch_object()) && ($mostrar11 = $res6P2->fetch_object())){
                echo "<br><b>Tipo<b/>:$mostrar11->tipo <br>";
                echo "<b>Generacion<b/>:$mostrar10->generacion <br><b>Peso<b/>:$mostrar10->peso <br><b>Altura<b/>:$mostrar10->altura <br><b>ID<b/>: $mostrar10->id_pokemon <br> <b>Nombre<b/>:$mostrar10->nombre_pokemon <br>   ";
                  
            }
          } else {
            echo "Error en los parametros";
          }

      }


      $recibidaR = $_POST["in_nomregion"];
      $recibidaVer = $_POST["in_versionjuego"];

      
        if ($recibidaR != 'default' && $recibidaVer =='default'){
          echo "Busqueda $recibidaR";
          $sqlR = "select region.nombre_region, region.profesor_regional, regionversion.nombre_version, listadeciudades.nombre_ciudad from region, listadeciudades, regionversion where region.nombre_region='$recibidaR' and regionversion.nombre_region='$recibidaR' and listadeciudades.nombre_region='$recibidaR';";
          $res1 = $dblink->query($sqlR);
          $sqlR2 = "select nombre_ciudad from listadeciudades where nombre_region='$recibidaR';";
          $res2 = $dblink->query($sqlR2);
          $sqlR3 = "select nombre_version from regionversion where nombre_region='$recibidaR';";
          $res3 = $dblink->query($sqlR3);
          echo "<br>";
          echo "<br>";
          echo "Respuestas:";
          $vari1 = 0;
          while ($mostrar1 = $res1->fetch_object()){
            if($vari1 == 0){
            echo "<li><br><b>Region<b/>: $mostrar1->nombre_region <br><b>Profesor Regional<b/>: $mostrar1->profesor_regional<br></li>";
              $vari1 = 1;
            }
          }
          echo "<b>Lista de Ciudades<b/>:";
          while ($mostrar2 = $res2->fetch_object()){
            echo "<li>$mostrar2->nombre_ciudad</li>";
          }
          echo "<b>Version de Juego<b/>:";
          while ($mostrar3 = $res3->fetch_object()) {
            echo "<li> $mostrar3->nombre_version</li>";
          }
          
        } 

        if ($recibidaVer != 'default' && $recibidaR == 'default') {
          echo "Busqueda $recibidaVer";
          $sqlR = "select versiondejuego.nombre_version, versiondejuego.generacion, campeondelaliga.nombre_campeon, villanosversionjuego.nombre_organizacion from versiondejuego, campeondelaliga, villanosversionjuego where versiondejuego.nombre_version='$recibidaVer' and versiondejuego.nombre_version=campeondelaliga.nombre_version and versiondejuego.nombre_version=villanosversionjuego.nombre_version;";
          $res1 = $dblink->query($sqlR);
          $sqlR3 = "select nombre_campeon from campeondelaliga where nombre_version='$recibidaVer';";
          $res3 = $dblink->query($sqlR3);
          echo "<br>";
          echo "<br>";
          echo "Respuestas:";
          
          echo "<br><b>Version de juego<b/>: $recibidaVer";
          while ($mostrar1 = $res1->fetch_object()){
            echo "<li><br><b>Villanos<b/>: $mostrar1->nombre_organizacion <br></li>";
          }
          echo "<br><b>Campeon regional<b/>:";
          while ($mostrar3 = $res3->fetch_object()) {
            echo "<li> $mostrar3->nombre_campeon</li>";
          }
        } 
      


      $recibidaE = $_POST["in_nomentrenador"];

      if ($recibidaE != 'default') {
        echo "Busqueda $recibidaE";
        $sqlV2 = "select distinct entrenador.id_entrenador, entrenador.nombre_entrenador, entrenador.tipo_entrenador, entrenador.genero, equipopokemon.id_pokemon from entrenador, equipopokemon where entrenador.nombre_entrenador='$recibidaE' and entrenador.id_entrenador=equipopokemon.id_entrenador;";
        $res2 = $dblink->query($sqlV2);
        echo "<br>";
        echo "<br>";
        echo "Respuestas:";
        while ($mostrar1 = $res2->fetch_object()){
          echo "<li><br><b>ID-Entrenador<b/>: $mostrar1->id_entrenador<br>
          <b>Nombre<b/>: $mostrar1->nombre_entrenador<br>
          <b>Tipo<b/>: $mostrar1->tipo_entrenador<br>
          <b>Genero<b/>: $mostrar1->genero<br>
          <b>ID-Pokemon<b/>: $mostrar1->id_pokemon</li>";
        }
      }


      $recibidaV = $_POST["in_nomvillanos"];

      if($recibidaV != 'default'){
        echo "Busqueda $recibidaV";
        $sqlV = "select * from villanos where nombre_organizacion='$recibidaV'";
      $res1 = $dblink->query($sqlV);
      $sqlV2 = "select * from villanosversionjuego where nombre_organizacion='$recibidaV';";
      $res2 = $dblink->query($sqlV2);
      echo "<br>";
      echo "<br>";
      echo "Respuestas:";
      while ($mostrar1 = $res1->fetch_object()){
      echo "<li><b>Lider de la organizacion<b/>: $mostrar1->lider</li>";
      }
      while ($mostrar2 = $res2->fetch_object()){
      echo "<li><b>Version de juego<b/>: $mostrar2->nombre_version</li>";
      }
      }

      
      
      $idpoke = $_POST["idpoke"];
      $nompoke = $_POST["nompoke"];
      $alt = $_POST["alt"];
      $pes = $_POST["pes"];
      $genpoke = $_POST["genpoke"];
      $tip1 = $_POST["tip1"];
      $tip2 = $_POST["tip2"];
      $verjuegopoke = $_POST["verjuegopoke"];

      if ($idpoke != null && $nompoke != null && $alt!= null && $pes!= null && $genpoke!= null  && $tip1!= null && $verjuegopoke!= null) {
        echo "Resultados:";

         $sqlVerifidPoke = "select id_pokemon from Pokemon where id_pokemon='$idpoke';";
            $sqlVerifnomPoke = "select nombre_pokemon from Pokemon where nombre_pokemon='$nompoke';";

            $sqlPoke = "insert into Pokemon (id_pokemon, nombre_pokemon, altura, peso, generacion) values ($idpoke,'$nompoke',$alt,$pes,'$genpoke');";
            $sqlPokeTip1 = "insert into pokemontipo (id_pokemon, tipo) values ($idpoke,'$tip1');";
            $sqlPokeTip2 = "insert into pokemontipo (id_pokemon,tipo) values ($idpoke,'$tip2');";
            $sqlPokeVer = "insert into origenpokemon (id_pokemon,nombre_version) values ($idpoke,'$verjuegopoke');";

            $resVerifidPoke = $dblink->query($sqlVerifidPoke);
            $resVerifnomPoke = $dblink->query($sqlVerifnomPoke);

        if ($tip2 == null) {
                          
            $nr = $resVerifidPoke->num_rows;
            echo "$nr resultados.<br>";
            if ($nr>0) {
              echo "El Pokemon con id $idpoke ya existe en la base de datos.<br>\n";
              echo "No se adicionara el Pokemon.<br>\n";
            } else {
              // Ahora, a insertar a la base de datos
              if($dblink->query($sqlPoke) === TRUE){
                echo "Pokemon creado";
              }
              if($dblink->query($sqlPokeTip1) === TRUE){
                echo "Tipo 1 creado";
              }
              if($dblink->query($sqlPokeVer) === TRUE){
                echo "Version creada";
              }

              echo "Pokemon adicionado a la base de datos.<br>";
        
            }
          } else {
            echo "$nr resultados.<br>";
            if ($nr>0) {
              echo "El Pokemon con id $idpoke ya existe en la base de datos.<br>\n";
              echo "No se adicionara el Pokemon.<br>\n";
            } else {
              // Ahora, a insertar a la base de datos
              if($dblink->query($sqlPoke) === TRUE){
                echo "Pokemon creado";
              }
              if($dblink->query($sqlPokeTip1) === TRUE){
                echo "Tipo 1 creado";
              }
              if($dblink->query($sqlPokeTip2) === TRUE){
                echo "Tipo 1 creado";
              }
              if($dblink->query($sqlPokeVer) === TRUE){
                echo "Version creada";
              }

              echo "Pokemon adicionado a la base de datos.<br>";
        
            }
          }
      } 
      
      
      $nomreg = $_POST["nomreg"];
      $profreg = $_POST["profreg"];
      $genreg = $_POST["genreg"];
      $verjuegoreg = $_POST["verjuegoreg"];
      $ciureg = $_POST["ciureg"];
      
      if ($nomreg !=null && $profreg != null && $genreg != null && $verjuegoreg != null) {
        $sqlnomreg = "insert into Region (nombre_region, profesor_regional) values ('$nomreg','$profreg');";
        $sqlciudades = "insert into listadeciudades (nombre_ciudad, nombre_region) values ('$ciureg', '$nomreg');";
        $sqlregver = "insert into regionversion (nombre_region, nombre_version) values ('$nomreg','$verjuegoreg');";
        $sqlnewver = "insert into versiondejuego (nombre_version, generacion) values ('$verjuegoreg','$genreg');";

        $sqlVerifnomReg = "select nombre_region from region where nombre_region='$nomreg';";
        $sqlVerifver = "select nombre_version from versiondejuego where nombre_version='$verjuegoreg';";
        $sqlVerifgen = "select generacion from versiondejuego where generacion='$genreg';";

        $resVerifnomReg = $dblink->query($sqlVerifnomReg);
        $resVerifver = $dblink->query($sqlVerifver);
        $resVerifgen = $dblink->query($sqlVerifgen);

         $nr = $resVerifnomReg->num_rows;
         $nr2 = $resVerifver->num_rows;
         
            echo "$nr y $nr2 resultados.<br>";
            if ($nr>0 && $nr2>0 && $nr3>0) {
              echo "La Region con nombre $nomreg ya existe en la base de datos.<br>\n";
              echo "La version del juego ya fue definida anteriormente, ya existe en la base de datos.<br>\n";
              echo "La generacion ya fue definida anteriormente, ya existe en la base de datos.<br>\n";
              echo "No se adicionara la nueva region.<br>\n";
            } else {
              // Ahora, a insertar a la base de datos
              if($dblink->query($sqlnomreg) === TRUE){
                echo "Region creado";
              }
              if($dblink->query($sqlciudades) === TRUE){
                echo "Ciudad creada";
              }
              if($dblink->query($sqlregver) === TRUE){
                echo "Version creada";
              }
              if($dblink->query($sqlnewver) === TRUE){
                echo "Version creada";
              }

              echo "Region adicionado a la base de datos.<br>";
            }
        
        
      }
      
      $dblink->close();
      ?>
      <br>
    
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