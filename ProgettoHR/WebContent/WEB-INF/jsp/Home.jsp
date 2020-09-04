<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Home</title>

<link rel="stylesheet" href="/ProgettoHR/css/home.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
/* Body e html generale*/
html, body {
	height: 100%;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

p {
	font-family: 'Poppins', sans-serif;
	font-size: 1.1em;
	font-weight: 300;
	line-height: 1.7em;
	color: #999;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

/* Pallini dello stato del candidato*/
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
}

/* Tabella Home */
.tabellaHome {
	width: 100%;
	border-collapse: collapse;
	margin: 5px 0;
	font-size: 0.9em;
	min-width: 400px;
	border-radius: 5px 5px 0px 0px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaHome .head {
	background-color: #5aa9e6;
	color: #ffffff;
	text-align: center;
	font-weight: bold;
}

.tabellaHome th, .tabellaHome td {
	padding: 12px 15px;
}

.tabellaHome .body tr {
	border-bottom: 1px solid #dddddd;
}

.tabellaHome .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaHome .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

/* Navbar */
.navbar {
	width: 100%;
	position: fixed;
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
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

/* Barra Laterale */
.container-fluid2 {
	margin-top: 110px;
}

#sidebar {
	border-collapse: collapse;
	font-size: 0.9em;
	min-width: 250px;
	max-width: 250px;
	border-radius: 0px 5px 5px 0px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
	background: #5aa9e6;
	color: #fff;
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

.imput-group .custom-select {
	border-radius: 0px 0px 0px 0px;
}
</style>

</head>

<body onload="validateOption()">

	<!-- NAVBAR -->
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar">

				<!-- LOGO -->
				<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
					<img class="logo"
					src="/ProgettoHR/img/Erre_technology_group_NEW.png">
				</a>

				<!-- BOTTONE PROFILO -->
				<div class="col-1">

					<button class="btn" id="logout" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-cog"></i>
					</button>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="/ProgettoHR/Logout">Logout</a>
					</div>

				</div>

			</nav>
		</div>
	</div>


	<div class="container-fluid2">
		<div class="row">
			<div class="col-auto">

				<!-- BARRA LATERALE -->
				<nav id="sidebar">
					<div class="sidebar-header">
						<h3>Home</h3>
					</div>

					<ul class="list-unstyled components">

						<li class="active"><a href="#homeSubmenu"
							data-toggle="collapse" aria-expanded="false"
							class="dropdown-toggle">Business unit</a>
							<ul class="collapse list-unstyled" id="homeSubmenu">
								<li><c:forEach var="business" items="${businessList}">
										<a class="dropdown-item"
											href="/ProgettoHR/Home/${business.business}">${business.business}</a>
									</c:forEach></li>

							</ul></li>
						<li><a href="/ProgettoHR/Candidati/${businessUnit}"
							type="button">Candidato</a></li>

						<li><c:choose>
								<c:when
									test="${ utente!=null and utente.ruolo.ruolo == 'admin'}">
									<a href="" data-toggle="modal" data-target="#mansioneModal"
										type="button">Mansione</a>
								</c:when>
							</c:choose></li>

						<li><a href="/ProgettoHR/Filter/${businessUnit}"
							type="button">Filtri</a></li>
					</ul>
				</nav>
			</div>

			<!-- COLONNA PRINCIPALE -->
			<div class="col-10">
				<!-- ROW PRINCIPALE-->
				<div class="row">

					<!-- COLLONNA CON FILTRO STATO CANDIDATO -->
					<div class="col-auto mb-2">
						<form action="/ProgettoHR/Home/filter/${businessUnit}"
							method="post">
							<div class="form-row">
								<div class="col-auto">
									<div class="dropdown">

										<select onchange="validateOption()" class="custom-select"
											id="stati" name="stato">

											<option selected disabled>Stato candidato</option>
											<option value="noFiltro">Tutti gli stati</option>
											<c:forEach var="stato" items="${statoCandidatoList}">
												<option value="${stato.descrizione}">${stato.descrizione}</option>
											</c:forEach>

										</select>
									</div>
								</div>

								<div class="col">
									<button id="filterButton" class="btn btn-dark"
										style="background-color: #5aa9e6; border-color: transparent;"
										type="submit">
										<i class="fas fa-filter"></i>
									</button>
								</div>

							</div>
						</form>
					</div>

					<!-- COLONNA 2 CON TABELLA CANDIDATO -->
					<div class="col-12">
						<table class="tabellaHome">

							<thead class="head">
								<tr>
									<th scope="col">Stato</th>
									<th scope="col">Business unit</th>
									<th scope="col">Nome</th>
									<th scope="col">Cognome</th>
									<th scope="col">Area Competenza</th>
									<th scope="col">Mansione</th>
									<th scope="col">Seniority</th>
								</tr>
							</thead>

							<tbody class="body">
								<c:forEach var="cand" items="${list}">
									<tr>
										<td><c:choose>
												<c:when test="${ cand.stato.descrizione == 'Attivo'}">
													<span id="dot" data-toggle="tooltip" data-placement="top"
														title="Attivo" class="dot bg-success"></span>
												</c:when>
												<c:when test="${ cand.stato.descrizione == 'Selezionato'}">
													<span id="dot" data-toggle="tooltip" data-placement="top"
														title="Selezionato" class="dot bg-primary"></span>
												</c:when>
												<c:when test="${ cand.stato.descrizione == 'Da contattare'}">
													<span id="dot" data-toggle="tooltip" data-placement="top"
														title="Da contattare" class="dot bg-warning"></span>
												</c:when>
												<c:when test="${ cand.stato.descrizione == 'Scartato'}">
													<span id="dot" data-toggle="tooltip" data-placement="top"
														title="Scartato" class="dot bg-danger"></span>
												</c:when>
												<c:otherwise>
													<span id="dot" data-toggle="tooltip" data-placement="top"
														title="Nuovo inserito" class="dot bg-secondary"></span>
												</c:otherwise>
											</c:choose></td>
										<td
											onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
											${cand.business.business}</td>
										<td
											onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
											${cand.nome}</td>
										<td
											onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
											${cand.cognome}</td>

										<td><c:forEach var="area" items="${cand.area}">
												<span
													onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
													${area.area}</span>
											</c:forEach></td>

										<td><c:forEach var="mansione" items="${cand.mansione}">
												<span
													onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
													${mansione.mansione}</span>
											</c:forEach></td>

										<td
											onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
											${cand.seniority.seniority}</td>

									</tr>

								</c:forEach>
							</tbody>

							<tfoot class="footer">
								<tr>
									<td></td>

								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL AGGIUNTA MANSIONE -->
	<div class="modal fade" id="mansioneModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Aggiunta
						Mansione</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form modelAttribute="mansione" id="formMansione"
						method="POST" action="/ProgettoHR/MansioniSave/${businessUnit}"
						onsubmit="return validate();">
						<div class="form-group">
							<form:input path="mansione" type="text" class="form-control"
								placeholder="Mansione" id="mansione" name="mansione"></form:input>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Salva</button>
							<button type="reset" class="btn btn-danger btn-block">Cancella</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script>
		function changeDotColor(stato) {
			if (stato === "attivo") {
				document.getElementById("dot").className = "dot bg-success";
			}
		}

		//
		//$(function() {
		//$('[data-toggle="tooltip"]').tooltip()
		//})

		function validate() {
			var mansione = document.getElementById("mansione").value;
			var list = document.getElementById("formMansione");
			var control = true;

			if (mansione === "") {

				var tagDiv = document.createElement("div");
				tagDiv.style = "color:red; font-size: small;"
				var textnode = document.createTextNode("Inserisci Mansione")
				tagDiv.appendChild(textnode)
				document.getElementById("mansione").appendChild(tagDiv);
				control = false;

			}

			return control;
		}
		function validateOption() {
			var e = document.getElementById("stati");
			var value = e.options[e.selectedIndex].value;

			if (value === "Stati") {
				document.getElementById("filterButton").disabled = true;
			} else {
				document.getElementById("filterButton").disabled = false;
			}
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