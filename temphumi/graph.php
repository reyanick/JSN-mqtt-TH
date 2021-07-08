<?php 
//index.php
require('connect2.php');
$query = "SELECT temp.created_at,temp.temperature,humi.humidity FROM temp JOIN humi on temp.created_at=humi.created_at";
$result = mysqli_query($conn, $query);
$chart_data = '';
while($row = mysqli_fetch_array($result))
{
 $chart_data .= "{ time:'".$row["created_at"]."', humidity:".$row["humidity"].", temperature:".$row["temperature"]."}, ";
}
$chart_data = substr($chart_data, 0, -2);
?>
<!DOCTYPE HTML>

<html>
<head>
	<title>Graph of Temperature and Humidity</title>
	<link rel="stylesheet" href="styleTable.css">
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</head>
<body>
	<div class="hero">
		<div class="navbar"> 
			<ul>
				<li><a href="index.html">Home<a/></li>
				<li><a href="table.php">Table<a/></li>
				<li><a href="graph.php">Graph<a/></li>
			</ul>
		</div>
		<div class="banner">
			<div class="left">
				<h2>Grafik <span>Suhu</span> dan <span>Kelembapan</span><h2>
				<h4>Berikut adalah tampilan suhu dan kelembapan berbentuk grafik<h4>
			</div>
			<div class="right">
				<div id="chart"></div>
			</div>
		</div>
	</div>
	
</body>
</html>

<script>
Morris.Line({
 element : 'chart',
 data:[<?php echo $chart_data; ?>],
 xkey:'time',
 ykeys:['temperature','humidity'],
 labels:['temperature', 'humidity'],
 hideHover:'auto',
 stacked:true
});
</script>