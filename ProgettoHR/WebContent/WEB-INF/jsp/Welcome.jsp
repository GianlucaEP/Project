<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
#colonna1 {
	background-color: rgb(8, 212, 239)
}

#colonna2 {
	background-color: rgb(248, 173, 67)
}

#colonna3 {
	background-color: rgb(238, 15, 15)
}

#telco {
	background-color: black;
	opacity: 0.3;
}

#ict {
	background-color: black;
	opacity: 0.3;
}

#ingegneria {
	background-color: black;
	opacity: 0.3;
}

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
	transition: 0.3s;
}

html, body {
	height: 100%;
}
</style>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-dark bg-primary "
		style="opacity: 0.8; box-shadow: 10px 10px 5px grey;">
		<h1>
			<span class="navbar-text bg-primary text-white"><a href="/ProgettoHR/Home/"> 
				<img
					alt="logo" src="/ProgettoHR/img/Erre_technology_group_NEW.png"
					class="col-4"></a>
			</span>
		</h1>
	</nav>
	<div class="container-fluid h-100 ">
		<div class="row h-100 ">

			<div id="colonna1" class="col center-content h-100 ">
				<div id="telco" class="row h-100 ">

					<div class="col center-content align-self-center"
						style="text-align: center;">
						<a href="/ProgettoHR/Home/Telco"><img alt="logo"
							src="/ProgettoHR/img/Erre_pro_blu.png" class="col-4"></a>Telco
					</div>
				</div>

			</div>

			<div id="colonna2" class="col center-content h-100 ">
				<div id="ict" class="row h-100 ">
					<div class="col center-content align-self-center"
						style="text-align: center;">
						<a href="/ProgettoHR/Home/ICT"><img alt="logo"
							src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4"></a>ICT
					</div>
				</div>
			</div>
			<div id="colonna3" class="col center-content h-100 ">
				<div id="ingegneria" class="row h-100 ">
					<div class="col center-content align-self-center "
						style="text-align: center;">
						<a href="/ProgettoHR/Home/Ingengeria"><img alt="logo"
							src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4"></a>Ingengeria
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>