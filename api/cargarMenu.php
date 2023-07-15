<?php

  require_once 'conexion.php';
  $objDB = new DataBase;

   
 $result = $objDB->Execute("TRUNCATE TABLE menuCargado");
 
 $result = $objDB->Execute("INSERT INTO menuCargado SELECT * FROM productos");
 
exit;
?>

