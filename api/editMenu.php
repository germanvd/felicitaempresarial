<?php 

	include 'database.php';

	$idpro = $_POST['idpro'];
	

	$link->query("INSERT INTO
	detalleconduce (idEsc, nombreescuela, idpro,tipoproducto,descripcion, precio,totalraciones, brutoRacionesPrimarias,totalbruto,itebis,totalmasitebis, fechaentrega, tirada, nombreempresa,
	direccionempresa, telefonoempresa, rncempresa, direccionescuela,directorescuela, telefonoescuela, emailescuela, regionaldistrito, provinciamunicipio, racionesprimarias ) SELECT escuelas.idEsc, escuelas.nombreescuela,productos.idpro,
	productos.tipoproducto,descripcion, productos.precio,totalraciones,
	precio*racionesprimarias as brutoRacionesPrimarias,
	precio*racionesprimarias as totalbruto,
	precio*racionesprimarias*itebis/100 as itebis,
	precio*racionesprimarias + precio*racionesprimarias*itebis/100  as totalmasitebis,
	productos.fechaentrega, tirada,nombreempresa, direccionempresa, telefonoempresa, rncempresa,
	direccionescuela, directorescuela, telefonoescuela, emailescuela, regionaldistrito, provinciamunicipio,
	escuelas.racionesprimarias FROM escuelas JOIN productos JOIN opciones
	JOIN parametros WHERE productos.idpro= '".$idpro."' AND escuelas.habilitada=1 ORDER BY idEsc");


$link->query("DELETE FROM menuCargado WHERE idpro='$idpro'");


?>

<?php

require_once 'conexion.php';
$objDB = new DataBase;

//$fechaentrega = trim($_REQUEST['fechaentrega']);//Unico Dato Digitado, los demas son copiados de tablas
$idpro = trim($_REQUEST['idpro']);

 
$result = $objDB->Execute("INSERT INTO
detalleconduce (idEsc, nombreescuela, idpro,tipoproducto,descripcion, precio,totalraciones, brutoRacionesPrimarias,totalbruto,itebis,totalmasitebis, fechaentrega, tirada, nombreempresa,
direccionempresa, telefonoempresa, rncempresa, direccionescuela,directorescuela, telefonoescuela, emailescuela, regionaldistrito, provinciamunicipio, racionesprimarias ) SELECT escuelas.idEsc, escuelas.nombreescuela,productos.idpro,
productos.tipoproducto,descripcion, productos.precio,totalraciones,
precio*racionesprimarias as brutoRacionesPrimarias,
precio*racionesprimarias as totalbruto,
precio*racionesprimarias*itebis/100 as itebis,
precio*racionesprimarias + precio*racionesprimarias*itebis/100  as totalmasitebis,
productos.fechaentrega, tirada,nombreempresa, direccionempresa, telefonoempresa, rncempresa,
direccionescuela, directorescuela, telefonoescuela, emailescuela, regionaldistrito, provinciamunicipio,
escuelas.racionesprimarias FROM escuelas JOIN productos JOIN opciones
JOIN parametros WHERE productos.idpro='$idpro' AND escuelas.habilitada=1 ORDER BY idEsc");

$result = $objDB->Execute("DELETE FROM menuCargado WHERE idpro='$idpro' ");

$result = $objDB->Execute("UPDATE opciones set tirada=tirada+1 ");

//$result = $objDB->Execute("DELETE FROM detalleconduce WHERE fechaentrega is NULL;");

$result = $objDB->Execute("UPDATE detalleconduce JOIN (SELECT @descripcion is null) x
SET descripcion=(@descripcion=NULL) WHERE  racionesprimarias is null AND idpro='$idpro' ");



$result = $objDB->Execute("UPDATE detalleconduce SET descripcion=NULL WHERE racionesprimarias=0");

$result = $objDB->Execute("UPDATE detalleconduce SET racionesprimarias=NULL WHERE racionesprimarias=0");


//$result = $objDB->Execute("UPDATE detalleconduce
//JOIN (SELECT @conduce:=0) x
//SET conduce=(@conduce:=@conduce+1);");

$result = $objDB->Execute("TRUNCATE TABLE ultimosConduces");

$result = $objDB->Execute("INSERT INTO ultimosConduces SELECT *
from detalleconduce where (nombreescuela,fechaentrega) in (
  select nombreescuela, max(fechaentrega) as fechaentrega
  from detalleconduce
  group by nombreescuela)");


//header('Location: index.php');
exit;
?>