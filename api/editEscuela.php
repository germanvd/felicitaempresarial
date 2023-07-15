<?php 

require_once 'conexion.php';
$objDB = new DataBase;

//$fechaentrega = trim($_REQUEST['fechaentrega']);//Unico Dato Digitado, los demas son copiados de tablas


$idEsc = strtoupper($_POST['idEsc']);
$nombreescuela = strtoupper($_POST['nombreescuela']);
$direccionescuela = strtoupper($_POST['direccionescuela']);
$telefonoescuela = $_POST['telefonoescuela'];
$directorescuela = strtoupper($_POST['directorescuela']);
$totalraciones = $_POST['totalraciones'];
$regionaldistrito = strtoupper($_POST['regionaldistrito']);
$provinciamunicipio = strtoupper($_POST['provinciamunicipio']);


$result = $objDB->Execute("UPDATE escuelas SET nombreescuela = '".$nombreescuela."',
 direccionescuela = '".$direccionescuela."', telefonoescuela = '".$telefonoescuela."',
  directorescuela = '".$directorescuela."' , racionesprimarias = '".$racionesprimarias."',
   totalraciones = '".$totalraciones."' , regionaldistrito = '".$regionaldistrito."',
    provinciamunicipio = '".$provinciamunicipio."' WHERE idEsc = '".$idEsc."' ");


$result = $objDB->Execute("UPDATE escuelas SET
 racionesprimarias = totalraciones WHERE idEsc = '".$idEsc."' ");
   

//header('Location: index.php');
exit;
?>