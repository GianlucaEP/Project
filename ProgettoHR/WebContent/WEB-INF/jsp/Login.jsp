<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Login</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body {
	background-image: url("/ProgettoHR/img/Login_background.jpg");
}
/* Navbar */
.navbar {
	position: absolute;
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
	width: 100%;
}

.navbar .navbar-brand .logo {
	width: auto;
	height: 70px;
}

.navbar .btn {
	background: #7fc8f8;
	width: 50%;
	margin-left: 60px;
}

.line {
	width: 100%;
	height: 1px;
	border-bottom: 1px dashed #ddd;
	margin: 40px 0;
}
</style>
</head>

<body onload="badCredentials()">

	<!-- NAVBAR -->
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar">

				<!-- LOGO -->
				<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
					<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
				</a>

			</nav>
		</div>
	</div>

	<div class="container-fluid" style="margin-top: 110px;">
		<div class="row justify-content-md-center">
			<div class="col-2"
				style="background-color: white; border-radius: 10px 10px 10px 10px;">

				<h4 class="text-center mt-4">Login</h4>
				<form:form id="utenteForm" method="POST"
					action="/ProgettoHR/LogginIn/" modelAttribute="utente"
					onsubmit="return validate();">
					<div class="form-group" id="formUtente">
						<label for="Utente">Utente:</label>
						<form:input path="username" type="text" class="form-control"
							id="utente" aria-describedby="utente"
							placeholder="Inserisci Utente" required="required" />

					</div>
					<div class="form-group" id="formPassword">
						<label for="Password">Password</label>
						<form:input path="password" type="password" class="form-control"
							id="password" placeholder="Inserisci Password"
							required="required" />
					</div>
					<button type="submit" class="btn btn-lg btn-block btn-primary">Login</button>
					<hr class="my-4">
				</form:form>

				<div class="row justify-content-center">
					<div
						class="alert alert-danger btn-block mb-4 ml-2 mr-2 text-center"
						role="alert">Credenziali errate</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function badCredentials() {
			$('.alert').hide();
			const queryString = window.location.search;
			const urlParams = new URLSearchParams(queryString);
			const error = urlParams.get('info')
			if (error === "error") {
				$('.alert').show();
			}
		}
		function validate() {
			$('.alert').hide();
			var control = true;
			var utente = document.getElementById("utente").value;
			var pass = document.getElementById("password").value;
			var list = document.getElementById("formUtente");
			var listpass = document.getElementById("formPassword");
			if (utente === "") {

				var tagDiv = document.createElement("div");
				tagDiv.style = "color:red; font-size: small;"
				if (list.childNodes[4]) {
					list.removeChild(list.childNodes[4]);
				}
				var textnode = document.createTextNode("Inserisci Nome Utente")
				tagDiv.appendChild(textnode)
				document.getElementById("formUtente").appendChild(tagDiv);
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
				document.getElementById("formPassword").appendChild(tagDiv)

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