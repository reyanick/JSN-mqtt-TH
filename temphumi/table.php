<!DOCTYPE HTML>

<html>
<head>
	<title>Table of Temperature and Humidity</title>
	<link rel="stylesheet" href="styleTable.css">
</head>
<body>
	<div class="hero">
		<div class="navbar"> 
			<h4>Ta<span>ble</span></h4>
			<ul>
				<li><a href="index.html">Home<a/></li>
				<li><a href="table.php">Table<a/></li>
				<li><a href="graph.php">Graph<a/></li>
			</ul>
		</div>
		<div class="banner">
			<div class="left">
				<h2>Tabel <span>Suhu</span> dan <span>Kelembapan</span><h2>
				<h4>Berikut adalah tampilan suhu dan kelembapan berbentuk tabel<h4>
			</div>
			<div class="right">
				<table>
				<tr>
				<th> Suhu </th>
				<th> Kelembapan </th>
				<th> Created at </th>
				</tr>	
					<?php
					
					include 'connect2.php';
					$datatabel = mysqli_query($conn, "SELECT temp.created_at,temp.temperature,humi.humidity FROM temp JOIN humi on temp.created_at=humi.created_at");
					foreach ($datatabel as $row) {
						echo "<tr>
					<td>" . $row['temperature'] . "</td>
					<td>" . $row['humidity'] . "</td>
					<td>" . $row['created_at'] . "</td>
					  </tr>";
					}
					?>
				<table>
			</div>
		</div>
	</div>
	
</body>
</html>