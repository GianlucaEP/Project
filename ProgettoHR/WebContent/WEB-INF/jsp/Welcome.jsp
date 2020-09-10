<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Welcome</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style>
html, body {
	height: 100%;
}

#colonna1 {
	background-color: #490a09;
	transition: 0.5s;
}

#colonna2 {
	background-color: #145667;
	transition: 0.5s;
}

#colonna3 {
	background-color: #945805;
	transition: 0.5s;
}

/*#telco:hover {
	background-color: #7f1210;
	transition: 0.5s;
}

#ict:hover {
	background-color: #1e8199;
	transition: 0.5s;
}

#ingegneria:hover {
	background-color: #f69309;
	transition: 0.5s;
}
*/


#proImg{
	width: 40%;
	transition: 0.5s;
}

#labImg{
	width: 40%;
	transition: 0.5s;
}

#techImg {
	width: 40%;
	transition: 0.5s;
}

#proImg:hover {
	width: 80%;
	opacity: 1;
	transition: 0.5s;
}
#labImg:hover {
	width: 80%;
	opacity: 1;
	transition: 0.5s;
}


#techImg:hover {
	width: 80%;
	opacity: 1;
	transition: 0.5s;
}
</style>

</head>
<body>

	<div class="container-fluid h-100 ">
		<div class="row h-100 ">

			<!-- Telco -->
			<div id="colonna1" class="col center-content h-100 ">
				<div id="telco" class="row h-100 ">
					<div class="col center-content align-self-center"
						style="text-align: center;">
						<a href="/ProgettoHR/Home/Telco"><img  onmouseover="changeColorBg('#7f1210', 'colonna1')" onmouseleave="changeColorBg('#490a09', 'colonna1')" id="labImg" alt="logo"
							src="/ProgettoHR/img/errelab.png"></a>
					</div>
				</div>
			</div>

			<!-- ICT -->
			<div id="colonna2" class="col center-content h-100 ">
				<div id="ict" class="row h-100 ">
					<div class="col center-content align-self-center"
						style="text-align: center;">
						<a  href="/ProgettoHR/Home/ICT"><img onmouseover="changeColorBg('#1e8199', 'colonna2')" onmouseleave="changeColorBg('#145667', 'colonna2')" id="proImg" alt="logo"
							src="/ProgettoHR/img/errepro.png"></a>
					</div>
				</div>
			</div>

			<!-- Ingegneria -->
			<div id="colonna3" class="col center-content h-100 ">
				<div id="ingegneria" class="row h-100 ">
					<div class="col center-content align-self-center "
						style="text-align: center;">
						<a  href="/ProgettoHR/Home/Ingegneria"><img onmouseover="changeColorBg('#f69309', 'colonna3')" onmouseleave="changeColorBg('#945805', 'colonna3')" id="techImg"
							alt="logo" src="/ProgettoHR/img/erretechnologygroup.png"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
function changeColorBg(color, id) {
	document.getElementById(id).style.background=color
}</script>
</body>
</html>