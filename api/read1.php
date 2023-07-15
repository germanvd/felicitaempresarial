<?php 


include 'database.php';

	$query = $link->query('SELECT *,CONCAT(idpro,"  ",descripcion) as descripcion,
	fechaentrega FROM menuCargado ORDER BY fechaentrega ASC');
	//date_format(fechaentrega, "%d/%m/%Y") as fechaentrega FROM menuCargado ORDER BY fechaentrega ASC');
	$result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}


	echo json_encode($result);










































// include 'database.php';

// 	$query = $link->query('SELECT * FROM person');
// 	$result = array();

// 	while ($rowdata = $query->fetch_assoc()) {
// 		$result[] = $rowdata;
// 	}
// 	echo json_encode($result);