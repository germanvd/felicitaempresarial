<?php 

	include 'database.php';

	$idEsc = $_POST['idEsc'];
    $nombreescuela = strtoupper($_POST['nombreescuela']);
	$totalraciones = $_POST['totalraciones'];
	$direccionescuela = strtoupper($_POST['direccionescuela']);
	$directorescuela = strtoupper($_POST['directorescuela']);
	$telefonoescuela = strtoupper($_POST['telefonoescuela']);
	$provinciamunicipio = strtoupper($_POST['provinciamunicipio']);
	$regionaldistrito = $_POST['regionaldistrito'];

	$link->query("INSERT INTO escuelas (idEsc,nombreescuela,totalraciones,direccionescuela,
	directorescuela,telefonoescuela,provinciamunicipio,regionaldistrito)VALUES
	('".$idEsc."','".$nombreescuela."','".$totalraciones."','".$direccionescuela."',
	'".$directorescuela."','".$telefonoescuela."','".$provinciamunicipio."','".$regionaldistrito."')");

	

	$link->query("UPDATE escuelas
	JOIN (SELECT max(id) FROM escuelas) as escuelas
	SET racionesprimarias = totalraciones
	");


	$link->query("UPDATE escuelas SET nombreescuela = REPLACE(nombreescuela,'á','A')");
	$link->query("UPDATE escuelas SET nombreescuela = REPLACE(nombreescuela,'é','E')");
	$link->query("UPDATE escuelas SET nombreescuela = REPLACE(nombreescuela,'í','I')");
	$link->query("UPDATE escuelas SET nombreescuela = REPLACE(nombreescuela,'ó','O')");
	$link->query("UPDATE escuelas SET nombreescuela = REPLACE(nombreescuela,'ú','U')");

	$link->query("UPDATE escuelas SET direccionescuela = REPLACE(direccionescuela,'á','A')");
	$link->query("UPDATE escuelas SET direccionescuela = REPLACE(direccionescuela,'é','E')");
	$link->query("UPDATE escuelas SET direccionescuela = REPLACE(direccionescuela,'í','I')");
	$link->query("UPDATE escuelas SET direccionescuela = REPLACE(direccionescuela,'ó','O')");
	$link->query("UPDATE escuelas SET direccionescuela = REPLACE(direccionescuela,'ú','U')");

	$link->query("UPDATE escuelas SET directorescuela = REPLACE(directorescuela,'á','A')");
	$link->query("UPDATE escuelas SET directorescuela = REPLACE(directorescuela,'é','E')");
	$link->query("UPDATE escuelas SET directorescuela = REPLACE(directorescuela,'í','I')");
	$link->query("UPDATE escuelas SET directorescuela = REPLACE(directorescuela,'ó','O')");
	$link->query("UPDATE escuelas SET directorescuela = REPLACE(directorescuela,'ú','U')");

















































	// include 'database.php';

	// $fistname = $_POST['fistname'];
	// $lastname = $_POST['lastname'];
	// $phone = $_POST['phone'];
	// $address = $_POST['address'];

	// $link->query("INSERT INTO person(fistname,lastname,phone,address)VALUES('".$fistname."','".$lastname."','".$phone."','".$address."')");

