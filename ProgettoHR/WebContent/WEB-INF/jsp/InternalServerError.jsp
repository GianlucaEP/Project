<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Errore Interno al server</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style type="text/css">
* {
	font-family: 'Poppins', sans-serif;
}

html, body, header {
	height: 100%;
}

#img-logo {
	height: 80px;
}

.container-server {
	background: #74b9ff;
	color: white;
}
</style>

</head>
<body>
	<header>
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<div class="row">
					<div class="col">
						<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
							<img id="img-logo" src="/ProgettoHR/img/erretechnologygroup.png">
						</a>
					</div>

				</div>
			</div>
		</nav>
		<div class="container-fluid container-server">
			<div class="row align-items-center">
				<div class="col align-self-center text-center">
					<h1>Errore del server</h1>
					<div>
						Oops! Qualcosa è andato storto.<br> Clicca <a
							style="color: blue;" href="/ProgettoHR/">qui</a> per tornare alla
						pagina iniziale.<br>Se il problema persiste contattare
						l'amministratore.
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Popper.JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<!-- Font Awesome JS -->
	<script defer
		src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>

	<script defer
		src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>
</body>
</html>