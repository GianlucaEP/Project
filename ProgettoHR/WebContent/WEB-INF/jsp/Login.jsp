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

html, body {
	height: 100%;
}

header {
	height: 100%;
	background-image: url("/ProgettoHR/img/Login.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

form {
	border-radius: 20px;
	background-color: white;
	padding: 50px;
	box-shadow: 10px 15px #d3d3d3;
}

img {
	height: 55px;
}

span {
	font-size: 25px;
	letter-spacing: 5px;
}

#span-erre {
	color: #004fff;
}

label {
	letter-spacing: 3px;
}

input {
	padding: 10px 15px;
	color: #004fff;
	border: none;
	border-radius: 10px;
	letter-spacing: 2px;
	background-color: whitesmoke;
	width: 100%;
}

input:focus {
	box-shadow: none !important;
	outline: 0;
	color: #004fff;
}

#btn-login {
	border: 1px solid #004fff;
	color: #004fff;
	border-radius: 20px;
	width: 130px;
	background-color: transparent;
	transition: 0.5s;
	letter-spacing: 3px;
}

#btn-login:hover {
	background-color: #004fff;
	border-color: #004fff;
	color: white;
	transition: 0.5s;
}
/* Hr */
.hr {
	margin-left: 0; /* fa partire l'hr da sinistra verso destra*/
	padding: 1px 0;
	background-color: black;
	border: none;
}

.trans--grow {
	transition: width 1s ease-out;
	width: 0%;
}

.grow {
	width: 100%;
}
</style>
</head>

<body onload="badCredentials()">
	<header>
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col d-flex justify-content-center align-self-center">
					<form:form method="POST" action="/ProgettoHR/LogginIn/"
						modelAttribute="utente" onsubmit="return validate();">

						<div class="row">
							<div class="col mb-3">
								<img src="/ProgettoHR/img/Logo Erre.png" class="pr-3"> <span
									id="span-signin">Sign in</span>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<span>Benvenuti in <span id="span-erre">Erre
										Technology HR</span>.
								</span>
							</div>
						</div>
						<hr class="trans--grow hr mb-4">
						<div class="form-group" id="utenteForm">
							<div class="row">
								<div class="col">
									<label for="Utente">Utente:</label>
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<form:input path="username" type="text" autocomplete="off" />
								</div>
							</div>
						</div>
						<div class="form-group" id="formPassword">
							<div class="row">
								<div class="col">
									<label for="Password">Password:</label>
								</div>
							</div>
							<div class="row">
								<div class="col mb-3">
									<form:input path="password" type="password" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<button class="btn text-center" id="btn-login" type="submit">Sign
									in</button>
							</div>
						</div>
						<div class="row">
							<div class="col mt-4 text-center">
								<div class="alert alert-danger" role="alert">Credenziali
									errate!</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</header>

	<script>
		jQuery(document).ready(function($) {
			setTimeout(function() {
				$('.trans--grow').addClass('grow');
			}, 275);
		});
	</script>

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
			var utente = document.getElementById("username").value;
			var pass = document.getElementById("password").value;
			var list = document.getElementById("utenteForm");
			var listpass = document.getElementById("formPassword");
			if (utente === "") {

				var tagDiv = document.createElement("div");
				tagDiv.style = "color:red; font-size: small;"
				if (list.childNodes[4]) {
					list.removeChild(list.childNodes[4]);
				}
				var textnode = document.createTextNode("Inserisci Nome Utente")
				tagDiv.appendChild(textnode)
				document.getElementById("utenteForm").appendChild(tagDiv);
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

			if (control) {
				document.getElementById("loginButton").disabled = true;
			}

			return control;
		}
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</body>

</html>