<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>

<body>
	<div>
		<nav class="navbar navbar-dark bg-primary "
			style="opacity: 0.8; box-shadow: 10px 10px 5px grey;">
			<h1>
				<span class="navbar-text bg-primary text-white"> <a
					href="/ProgettoHR/Home"><img alt="logo"
						src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4"></a>
				</span>
			</h1>
		</nav>
	</div>

	<div>
		<div class="row justify-content-md-center">
			<div
				class="col-auto container-fluid mt-5 mb-5 ml-auto mr-auto pt-3 pb-3 pl-5 pr-5 border-primary rounded border">
				<form:form id="utenteForm" method="POST"
					action="/ProgettoHR/LogginIn/" modelAttribute="utente"
					onsubmit="return validate();">
					<div class="form-group" id="formUtente">
						<label for="Utente">Utente:</label>
						<form:input path="username" type="text" class="form-control"
							id="utente" aria-describedby="utente"
							placeholder="Inserisci Utente" />

					</div>
					<div class="form-group" id="formPassword">
						<label for="Password">Password</label>
						<form:input path="password" type="password" class="form-control"
							id="password" placeholder="Inserisci Password" />
					</div>
					<button type="submit" class="btn btn-lg btn-block btn-primary">Login</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function validate(info) {
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
</html>