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

<title>Mansione</title>

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
	background-image: url("/ProgettoHR/img/area.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
}

header {
	height: 100%;
}

#zeroRecord {
	text-align: center;
	letter-spacing: 5px;
	margin: 10px;
	color: white;
}

#btn-nav {
	border: 1px solid white;
	border-radius: 30px;
	height: 45px;
	background-color: white;
}

#btn-logout, #btn-home, #btn-add {
	border-radius: 100%;
	background-color: white;
	color: black;
	box-shadow: none !important;
	outline: 0;
	border: 1px solid white;
	transition: 0.5s;
}

#btn-logout:hover, #btn-home:hover, #btn-add:hover {
	border: 1px solid #d3d3d3;
	background-color: #d3d3d3;
	transition: 0.5s;
	color: black;
	box-shadow: none !important;
	outline: 0;
}

/* TABELLA MANSIONE */
.tabellaMansione {
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

.tabellaMansione .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaMansione .body {
	background-color: #e9ecef;
}

.tabellaMansione .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaMansione .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaMansione .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaMansione .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaMansione th {
	padding: 8px;
}

.tabellaMansione td {
	font-size: 14px;
	padding: 4px;
}

.tabellaMansione .footer {
	background-color: white;
}

#btn-modifica, #btn-elimina {
	background-color: white;
	color: black;
	box-shadow: none !important;
	outline: 0;
}

#btn-elimina:hover, #btn-modifica:hover {
	background-color: black;
	color: white;
	transition: 0.5s;
}

#mansione, #newMansione {
	border-bottom: 1px solid black;
	border-left: none;
	border-right: none;
	border-top: none;
	border-radius: 0px;
	box-shadow: none !important;
	outline: 0;
	color: #004fff;
}

#btn-salva-mansione {
	background-color: #52b788;
	border: 1px solid #52b788;
	border-radius: 20px;
	color: white;
	letter-spacing: 3px;
	transition: 0.5s;
}

#btn-salva-mansione:hover {
	background-color: #40916c;
	border: 1px solid #40916c;
	border-radius: 20px;
	color: white;
	transition: 0.5s;
}

#btn-cancella-mansione {
	background-color: #f25c54;
	border: 1px solid #f25c54;
	border-radius: 20px;
	color: white;
	letter-spacing: 3px;
	transition: 0.5s;
}

#btn-cancella-mansione:hover {
	background-color: #ef233c;
	border: 1px solid #ef233c;
	border-radius: 20px;
	color: white;
	transition: 0.5s;
}
</style>

</head>
<body>
	<header>
		<c:set var="singlequote" value="'" />
		<c:set var="backslash" value="&apos" />

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
							<button data-toggle="modal" data-target="#aggiungiMansione"
								class="btn float-right" id="btn-add">
								<i class="fas fa-plus"></i>
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

		<div class="container">
			<div class="row align-items-center">
				<div class="col mb-5 align-self-center">
					<c:if test="${empty mansioneList}">
						<h2 id="zeroRecord">Nessuna mansione ancora inserita</h2>
					</c:if>
					<c:if test="${not empty mansioneList}">

						<div class="table-responsive">
							<table class="tabellaMansione">

								<thead class="head">
									<tr>
										<th><h3>MANSIONE</h3></th>
										<th scope="col"></th>
									</tr>
								</thead>

								<tbody class="body">
									<c:forEach var="mansione" items="${mansioneList}">
										<tr>
											<c:set var="mansioneRaplaced"
												value="${fn:replace(mansione.mansione, singlequote, backslash)}"></c:set>
											<c:set var="mansioneXSS"
												value="${fn:escapeXml(mansione.mansione)}"></c:set>
											<td>${mansioneXSS}</td>

											<td><button class="btn" id="btn-modifica"
													data-toggle="modal"
													onclick="impostaParametriMansione('${mansioneRaplaced}')"
													data-target="#modificaMansione">
													<i class="fas fa-cogs"></i>
												</button>
												<button class="btn" id="btn-elimina" data-toggle="modal"
													onclick="impostaParametriMansioneEliminazione('${mansione.mansione}')"
													data-target="#eliminaMansione">
													<i class="fas fa-trash"></i>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>

								<tfoot class="footer">
									<tr>
										<td colspan="2"></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</header>

	<!-- MODAL AGGIUNTA MANSIONE -->
	<div class="modal fade" id="aggiungiMansione" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiMansione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi mansione:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="mansione" id="formMansione" method="POST"
					action="/ProgettoHR/MansioniSaveDaMansione/${businessUnit}"
					onsubmit="return validate('Mansione', '${mansioneList}' );">
					<div class="modal-body">

						<form:input path="mansione" type="text" class="form-control"
							maxlength="45" id="mansione"></form:input>
					</div>

					<div class="modal-footer">
						<button type="reset" id="btn-cancella-mansione" class="btn">Cancella</button>
						<button type="submit" id="btn-salva-mansione" class="btn">Salva</button>
					</div>
				</form:form>

			</div>
		</div>
	</div>

	<!-- MODAL MODIFICA MANSIONE -->
	<div class="modal fade" id="modificaMansione" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaMansione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/AggiornaMansione/${businessUnit}"
					method="POST">

					<div class="modal-header">
						<h5 class="modal-title">Aggiorna mansione:</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="btn-close-modal">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<input type="text" class="form-control" name="newMansione"
							id="newMansione"> <input style="visibility: hidden;"
							name="oldMansione" id="oldMansione" />
					</div>

					<div class="modal-footer">
						<button type="button" class="btn" data-dismiss="modal"
							id="btn-cancella-mansione">Annulla</button>
						<button type="submit" class="btn" id="btn-salva-mansione">Aggiorna</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- MODAL CANCELLA MANSIONE -->
	<div class="modal fade" id="eliminaMansione" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaMansione"
		aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/EliminaMansione/${businessUnit}"
					method="POST">
					<div class="modal-header">
						<h5 class="modal-title">Elimina mansione:</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="btn-close-modal">&times;</span>
						</button>
					</div>

					<div class="modal-body" id="eliminaMansioneModalBodyText">
						<p id="p-elimina-mansione"></p>
						<input style="visibility: hidden;" name="eliminaMansione"
							id="elimina-mansione" />
					</div>

					<div class="modal-footer">
						<button type="button" class="btn" data-dismiss="modal"
							id="btn-cancella-mansione">No</button>
						<button type="submit" class="btn" id="btn-salva-mansione">Sì</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		function impostaParametriMansione(id) {
			id = id.replace("&apos", "'");
			document.getElementById("oldMansione").value = id;
			document.getElementById("newMansione").value = id;
		}
		function impostaParametriMansioneEliminazione(mansione) {
			document.getElementById("elimina-mansione").value = mansione;
			document.getElementById("p-elimina-mansione").innerHTML = "Sei sicuro di voler cancellare la mansione "
					+ mansione + "?";

		}
		function validate(tipo, lista) {
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

				return control;
			}

			control = insertionMessage(tipo, 'mansione', lista);

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