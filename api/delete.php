<?php 

	include 'database.php';

	$idpro = $_POST['idpro'];

	$link->query("DELETE FROM menuCargado WHERE idpro = '".$idpro."'");