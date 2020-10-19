<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Home</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

/* MEDIA PER SCHERMO DESKTOP GRANDE */
body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
	transition: 0.5s;
}

#aSidebar, #aSidebar:hover, #aSidebar:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

.dark-mode {
	background-color: black;
	color: white;
	transition: 0.5s;
}

/* PALLINI STATO CANDIDATO */
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
	margin-top: 5px;
}

/* NAVBAR */
.navbar {
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-nav .nav-link {
	height: 50px;
	width: 50px;
	background-color: #7fc8f8;
	border-radius: 50%;
}

.navbar .navbar-brand .logo {
	width: auto;
	height: 70px;
}

#iconaLogout {
	width: 25px;
	height: 48px;
}

/* SIDEBAR */
#sidebar {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 0px 5px 5px 0px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
	background: #5aa9e6;
	color: #fff;
	border-collapse: collapse;
}

#sidebar .sidebar-header {
	text-align: center;
	padding-top: 20px;
	padding-bottom: 10px;
	background: #7fc8f8;
}

#sidebar ul.components {
	padding: 10px 0px 0px 0px;
}

#sidebar ul p {
	color: #fff;
	padding: 10px;
}

#sidebar ul li a {
	margin: 5px 0px;
	padding: 10px 10px 10px 10px;
	font-size: 1.1em;
	display: block;
}

#sidebar ul li a:hover {
	color: #000000;
	background: #fff;
}

#sidebar ul li.active>a, a[aria-expanded="true"] {
	color: #fff;
	background: #7fc8f8;
}

a[data-toggle="collapse"] {
	position: relative;
}

.dropdown-toggle::after {
	display: block;
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
}

ul ul a {
	font-size: 0.9em !important;
	padding-left: 30px !important;
	background: #cae9ff;
}

@media screen and (max-width: 855px) {
	body {
		
	}
	#colonnaTable {
		
	}
	[class*="col-"] {
		width: 100%;
	}
}
</style>

</head>

<body>
	<div class="container-fluid p-0">
		<!-- NAVBAR -->
		<nav class="navbar">

			<!-- LOGO -->
			<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
				<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
			</a>

			<div id="navbarResponsive">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item">
						<form action="/ProgettoHR/Logout">
							<button type="submit" class="btn nav-link p-0">
								<i id="iconaLogout" class="fas fa-sign-out-alt"></i>
							</button>
						</form>
					</li>
				</ul>
			</div>
		</nav>

		<!-- COLONNA BARRA LATERALE -->
		<div class="row w-100 mr-0 mt-4">
			<div id="colonnaTable" class="col-auto align-self-stretch">
				<!-- BARRA LATERALE -->
				<nav id="sidebar">
					<div class="sidebar-header">
						<h3>Gantt</h3>
					</div>

					<ul class="list-unstyled components">
						<li><a id="aSidebar" href="/ProgettoHR/Home/${businessUnit}"
							type="button"><i class="fas fa-home"></i> Torna alla Home</a></li>
					</ul>

				</nav>
			</div>
		</div>
	</div>


	<!-- MODAL ERRORE -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="errorModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="errorModalBody"></div>
				<div class="modal-footer">
					<button type="reset" id="bottone-cancella-specializzazione"
						class="btn btn-danger" data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		
	</script>



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