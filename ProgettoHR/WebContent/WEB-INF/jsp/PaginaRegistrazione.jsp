<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Registrazione</title>

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

<style>
* {
	font-family: 'Poppins', sans-serif;
}

body, html {
	height: 100%;
}

header {
	height: 100%;
	background-image: url("/ProgettoHR/img/Home1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
}

img {
	height: 55px;
}

span {
	font-size: 25px;
	letter-spacing: 5px;
}

label {
	letter-spacing: 3px;
}

form {
	border-radius: 20px;
	padding: 50px;
	background-color: white;
	box-shadow: 10px 15px #d3d3d3;
}

#nuovoUtente, #nuovaPassword {
	padding: 10px 15px;
	color: #004fff;
	border: none;
	border-radius: 20px;
	letter-spacing: 2px;
	background-color: whitesmoke;
	width: 100%;
	box-shadow: none !important;
	outline: 0;
	transition: 0.5s;
}

#nuovoUtente:focus, #nuovaPassword:focus {
	border: 1px solid #004fff;
	transition: 0.5s;
}

#btn-nav {
	border: 1px solid white;
	border-radius: 5px;
	height: 45px;
	background-color: white;
}

#btn-logout, #btn-home {
	border-radius: 5px;
	color: black;
	outline: 0;
	transition: 0.5s;
	color: black;
}

#btn-logout:hover, #btn-home:hover{
	box-shadow: 1px 1px 2px black;
	transition: 0.5s;
	color: black;
}

#btn-registrazione {
	border: 1px solid #004fff;
	color: #004fff;
	border-radius: 20px;
	width: 170px;
	background-color: transparent;
	transition: 0.5s;
	letter-spacing: 3px;
}

#btn-registrazione:hover {
	background-color: #004fff;
	border-color: #004fff;
	color: white;
	transition: 0.5s;
}

#btn-cancella-registrazione {
	background-color: #f25c54;
	border: 1px solid #f25c54;
	border-radius: 20px;
	color: white;
	letter-spacing: 3px;
	transition: 0.5s;
}

#btn-cancella-registrazione:hover {
	background-color: #ef233c;
	border: 1px solid #ef233c;
	border-radius: 20px;
	color: white;
	transition: 0.5s;
}
</style>

</head>

<body onload="control()">
	<header>
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<div class="row w-100">
					<div id="btn-nav" class="d-flex flex-row">
						<div class="col-auto align-self-center">
							<button class="btn"
								onclick="location.href = '/ProgettoHR/Home/${businessUnit}';"
								id="btn-home">
								<i class="fas fa-home"></i>
							</button>
						</div>
						<div class="col-auto align-self-center">
							<button onclick="location.href = '/ProgettoHR/Login';"
								class="btn float-right" id="btn-logout">
								<i class="fas fa-sign-out-alt"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</nav>

		<div class="container h-75">
			<div class="row  h-100 align-items-center">
				<div class="col d-flex justify-content-center align-self-center">

					<form:form id="utenteForm" method="POST"
						action="/ProgettoHR/RegistratiIn/${businessUnit}"
						modelAttribute="nuovoUtente" onsubmit="return validate();">

						<div class="row">
							<div class="col mb-3">
								<img src="/ProgettoHR/img/Logo Erre.png" class="pr-3"> <span>Registrazione</span>
							</div>
						</div>
						<div class="row">
							<div class="col mb-5">
								<span>Aggiungi un nuovo <span style="color: #004fff;">utilizzatore</span>.
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col mb-3">
								<div id="formNuovoUtente">
									<label for="Utente">Utente :</label>
									<form:input path="username" type="text" class="form-control"
										id="nuovoUtente" required="required" autocomplete="off" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col mb-3">
								<div id="formNuovaPassword">
									<label for="Password">Password :</label>
									<form:input path="password" type="password"
										class="form-control" id="nuovaPassword" required="required"
										autocomplete="off" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col mb-5">
								<div id="formRuolo">
									<label for="Ruolo">Ruolo :</label> <select class="form-control"
										name="ruoloSelezionato" id="ruoloSelezionato">
										<option id="noFiltro" value="noFiltro" selected disabled>Seleziona
											ruolo</option>
										<c:forEach var="ruolo" items="${ruoli}">
											<option value="${ruolo.id}">${ruolo.ruolo}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button type="submit" class="btn" id="btn-registrazione">Registrazione</button>
							</div>
						</div>
					</form:form>

					<div class="row justify-content-center">
						<div
							class="alert alert-success btn-block mb-4 ml-2 mr-2 text-center"
							id="successAlert" role="alert">Nuovo utente inserito con
							successo</div>
					</div>

					<div class="row justify-content-center">
						<div
							class="alert alert-danger btn-block mb-4 ml-2 mr-2 text-center"
							id="errorAlert" role="alert">Nome utente già inserito</div>
					</div>

				</div>
			</div>
		</div>
	</header>

	<!-- MODAL ERRORE -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
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
					<button type="reset" id="btn-cancella-registrazione" class="btn"
						data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function control() {
			$('#successAlert').hide();
			$('#errorAlert').hide();
			const queryString = window.location.search;
			const urlParams = new URLSearchParams(queryString);
			const info = urlParams.get('info')
			if (info === "error") {
				$('#errorAlert').show();
			} else if (info === "success") {
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
			if (document.getElementById("ruoloSelezionato").selectedIndex <= 0) {
				$('#errorModal').modal('toggle');
				document.getElementById("errorModalLabel").innerHTML = "Errore";
				document.getElementById("errorModalBody").innerHTML = "Inserisci un ruolo utente.";
				control = false;
			}
			return control;
		}
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