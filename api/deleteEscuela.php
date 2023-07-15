<?php 

	include 'database.php';

	$idEsc = $_POST['idEsc'];

	$link->query("DELETE FROM escuelas WHERE idEsc = '".$idEsc."'");