<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">

<title>Registrai</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
/* MEDIA PER SCHERMO DESKTOP GRANDE */
html, body {
	height: 100%;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

/* NAVBAR */
.navbar {
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

/* ICONA LOGOUT */
.svg-inline--fa.fa-w-16 {
	margin-left: 5px;
	margin-top: 5px;
	overflow: hidden;
	vertical-align: middle;
	width: 25px;
	height: 25px;
}

.navbar-nav .nav-link {
	height: 50px;
	width: 50px;
	border-radius: 50%;
	background-color: #7fc8f8;
	border-radius: 50%;
}

.navbar .navbar-brand .logo {
	width: auto;
	height: 70px;
}

#colonnaLogin {
	background-color: white;
	border-radius: 10px;
}

#utenteForm {
	margin: 20px;
}
</style>

</head>

<body onload="control()">
	<div class="container-fluid p-0">
		<!-- NAVBAR -->
		<nav class="navbar navbar-expand-xl ">

			<!-- LOGO -->
			<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
				<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
			</a>

			<!-- LOGOUT -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="/ProgettoHR/Logout"><i class="fas fa-sign-out-alt"></i></a></li>
				</ul>
			</div>

		</nav>


		<div class="row mr-0 justify-content-center mt-4">
			<div class="col-auto border" id="colonnaLogin">

				<h4 class="text-center mt-4">Registrati</h4>
				<form:form id="utenteForm" method="POST"
					action="/ProgettoHR/RegistratiIn/${businessUnit}"
					modelAttribute="nuovoUtente" onsubmit="return validate();">

					<div class="form-group" id="formNuovoUtente">
						<label for="Utente">Utente:</label>
						<form:input path="username" type="text" class="form-control"
							id="nuovoUtente" placeholder="Inserisci Utente"
							required="required" />

					</div>
					<div class="form-group" id="formNuovaPassword">
						<label for="Password">Password:</label>
						<form:input path="password" type="password" class="form-control"
							id="nuovaPassword" placeholder="Inserisci Password"
							required="required" />
					</div>
					<div class="form-group" id="formRuolo">
						<label for="Ruolo">Ruolo:</label> <select class="form-control"
							name="ruoloSelezionato">
							<option id="noFiltro" value="noFiltro" selected disabled>Seleziona
								ruolo</option>
							<c:forEach var="ruolo" items="${ruoli}">
								<option value="${ruolo.id}">${ruolo.ruolo}</option>
							</c:forEach>
						</select>
					</div>

					<button type="submit" class="btn btn-lg btn-block btn-primary">Registra
						utente</button>
					<hr class="my-4">
				</form:form>
				
				<div class="row justify-content-center">
					<div
						class="alert alert-success btn-block mb-4 ml-2 mr-2 text-center" id="successAlert"
						role="alert">Nuovo utente inserito con successo</div>
				</div>
				
				<div class="row justify-content-center">
					<div
						class="alert alert-danger btn-block mb-4 ml-2 mr-2 text-center" id="errorAlert"
						role="alert">Nome utente già inserito</div>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		function control(){
			$('#successAlert').hide();
			$('#errorAlert').hide();
			const queryString = window.location.search;
			const urlParams = new URLSearchParams(queryString);
			const info = urlParams.get('info')
			if (info === "error") {
				$('#errorAlert').show();
			} else if(info === "success"){
				$('#successAlert').show();
			}
		}
		function validate() {
			$('.alert').hide();
			var control = true;
			var utente = document.getElementById("nuovoUtente").value;
			var pass = document.getElementById("nuovaPassword").value;
			var list = document.getElementById("formNuovoUtente");
			var listpass = document.getElementById("formNuovaPassword");
			if (utente === "") {

				var tagDiv = document.createElement("div");
				tagDiv.style = "color:red; font-size: small;"
				if (list.childNodes[4]) {
					list.removeChild(list.childNodes[4]);
				}
				var textnode = document.createTextNode("Inserisci Nome Utente")
				tagDiv.appendChild(textnode)
				document.getElementById("formNuovoUtente").appendChild(tagDiv);
				control = false;

			} else {
				if (list.childNodes[4]) {
					list.removeChild(list.childNodes[4]);
				}
			}
			if (pass === "") {
				var tagDiv = document.createElement("div");
				tagDiv.style = "color:red; font-size: small;"
				if (listpass.childNodes[4]) {
					listpass.removeChild(listpass.childNodes[4]);
				}
				var textnode = document.createTextNode("Inserisci Password")
				tagDiv.appendChild(textnode);
				document.getElementById("formNuovaPassword")
						.appendChild(tagDiv)

				control = false;
			} else {
				if (listpass.childNodes[4]) {
					listpass.removeChild(listpass.childNodes[4]);
				}
			}
			return control;
		}
	</script>

	<!-- jQuery CDN - Slim version (=without AJAX) -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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