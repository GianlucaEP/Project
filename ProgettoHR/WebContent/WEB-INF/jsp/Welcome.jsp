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
	background-color: #ba181b;
}

#colonna2 {
	background-color: #90e0ef;
}

#colonna3 {
	background-color: #ffc600;
}
/*
#ingegneria:hover {
	background-color: transparent;
	opacity: 1;
	transition: 0.3s;
}

#ict:hover {
	background-color: transparent;
	opacity: 1;
	transition: 0.3s;
}

#telco:hover {
	background-color: transparent;
	opacity: 1;
	transition: 0.3s;*/
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
						<a href="/ProgettoHR/Home/Telco"><img alt="logo"
							src="/ProgettoHR/img/errelab.png" class="col-4"></a>Telco
					</div>
				</div>
			</div>

			<!-- ICT -->
			<div id="colonna2" class="col center-content h-100 ">
				<div id="ict" class="row h-100 ">
					<div class="col center-content align-self-center"
						style="text-align: center;">
						<a href="/ProgettoHR/Home/ICT"><img alt="logo"
							src="/ProgettoHR/img/errepro.png" class="col-4"></a>ICT
					</div>
				</div>
			</div>

			<!-- Ingegneria -->
			<div id="colonna3" class="col center-content h-100 ">
				<div id="ingegneria" class="row h-100 ">
					<div class="col center-content align-self-center "
						style="text-align: center;">
						<a href="/ProgettoHR/Home/Ingegneria"><img alt="logo"
							src="/ProgettoHR/img/erretechnologygroup.png" class="col-4"></a>Ingegneria
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>