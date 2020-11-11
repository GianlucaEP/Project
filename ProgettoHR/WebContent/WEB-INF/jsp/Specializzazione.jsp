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

<title>Specializzazione</title>

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

/* TABELLA SPECIALIZZAZIONE */
.tabellaSpecializzazione {
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

.tabellaSpecializzazione .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaSpecializzazione .body {
	background-color: #e9ecef;
}

.tabellaSpecializzazione .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaSpecializzazione .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaSpecializzazione .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaSpecializzazione .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaSpecializzazione th {
	padding: 8px;
}

.tabellaSpecializzazione td {
	font-size: 14px;
	padding: 4px;
}

.tabellaSpecializzazione .footer {
	background-color: white;
}

#btn-elimina, #btn-modifica {
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

#specializzazione, #newSpecializzazione {
	border-bottom: 1px solid black;
	border-left: none;
	border-right: none;
	border-top: none;
	border-radius: 0px;
	box-shadow: none !important;
	outline: 0;
	color: #004fff;
}

#btn-salva-specializzazione {
	background-color: #52b788;
	border: 1px solid #52b788;
	border-radius: 20px;
	color: white;
	letter-spacing: 3px;
	transition: 0.5s;
}

#btn-salva-specializzazione:hover {
	background-color: #40916c;
	border: 1px solid #40916c;
	border-radius: 20px;
	color: white;
	transition: 0.5s;
}

#btn-cancella-specializzazione {
	background-color: #f25c54;
	border: 1px solid #f25c54;
	border-radius: 20px;
	color: white;
	letter-spacing: 3px;
	transition: 0.5s;
}

#btn-cancella-specializzazione:hover {
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
							<button data-toggle="modal"
								data-target="#aggiungiSpecializzazione" class="btn float-right"
								id="btn-add">
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
					<c:if test="${empty specializzazioneList}">
						<h2 id="zeroRecord">La ricerca non ha prodotto alcun
							risultato</h2>
					</c:if>
					<c:if test="${not empty specializzazioneList}">

						<div class="table-responsive">
							<table class="tabellaSpecializzazione">

								<thead class="head">
									<tr>
										<th><h3>SPECIALIZZAZIONE</h3></th>
										<th scope="col"></th>
									</tr>
								</thead>

								<tbody class="body">
									<c:forEach var="specializzazione"
										items="${specializzazioneList}">
										<tr>
											<c:set var="specializzazioneRaplaced"
												value="${fn:replace(specializzazione.specializzazione, singlequote, backslash)}"></c:set>
											<c:set var="specializzazioneXSS"
												value="${fn:escapeXml(specializzazione.specializzazione)}"></c:set>
											<td><span
												onclick="window.location = '/ProgettoHR/Specializzazione/${businessUnit}'">
													${specializzazioneXSS}</span></td>

											<td><button class="btn" id="btn-modifica"
													data-toggle="modal"
													onclick="impostaParametriSpecializzazione('${specializzazioneRaplaced}')"
													data-target="#modificaSpecializzazione">
													<i class="fas fa-cogs"></i>
												</button>
												<button class="btn" id="btn-elimina" data-toggle="modal"
													onclick="impostaParametriSpecializzazioneEliminazione('${specializzazione.specializzazione}')"
													data-target="#eliminaSpecializzazione">
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
	<div class="modal fade" id="aggiungiSpecializzazione" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiSpecializzazione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi specializzazione:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="specializzazione"
					id="formSpecializzazione" method="POST"
					action="/ProgettoHR/SpecializzazioneSaveDaSpecializzazione/${businessUnit}"
					onsubmit="return validateSpecializzazione('Specializzazione', '${specializzazioneList}');">
					<div class="modal-body">

						<form:input path="specializzazione" type="text"
							class="form-control" maxlength="45" id="specializzazione"></form:input>
					</div>

					<div class="modal-footer">
						<button type="reset" id="btn-cancella-specializzazione"
							class="btn">Cancella</button>
						<button type="submit" id="btn-salva-specializzazione" class="btn">Salva</button>
					</div>
				</form:form>

			</div>
		</div>
	</div>

	<!-- MODAL MODIFICA SPECIALIZZAZIONE -->
	<div class="modal fade" id="modificaSpecializzazione" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaSpecializzazione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/AggiornaSpecializzazione/${businessUnit}"
					method="POST">

					<div class="modal-header">
						<h5 class="modal-title">Aggiorna specializzazione:</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="btn-close-modal">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<input type="text" class="form-control" name="newSpecializzazione"
							id="newSpecializzazione"> <input
							style="visibility: hidden;" name="oldSpecializzazione"
							id="oldSpecializzazione" />
					</div>

					<div class="modal-footer">
						<button type="button" class="btn" data-dismiss="modal"
							id="btn-cancella-specializzazione">Annulla</button>
						<button type="submit" class="btn" id="btn-salva-specializzazione">Aggiorna</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- MODAL CANCELLA SPECIALIZZAZIONE -->
	<div class="modal fade" id="eliminaSpecializzazione" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaSpecializzazione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/EliminaSpecializzazione/${businessUnit}"
					method="POST">

					<div class="modal-header">
						<h5 class="modal-title">Elimina specializzazione:</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="btn-close-modal">&times;</span>
						</button>

					</div>

					<div class="modal-body" id="eliminaSpecializzazioneModalBodyText">
						<p id="p-elimina-specializzazione"></p>
						<input style="visibility: hidden;" name="eliminaSpecializzazione"
							id="elimina-specializzazione" />
					</div>

					<div class="modal-footer">
						<button type="button" class="btn" data-dismiss="modal"
							id="btn-cancella-specializzazione">No</button>
						<button type="submit" class="btn"
							id="btn-salva-specializzazione">Sì</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		function impostaParametriSpecializzazione(id) {
			id = id.replace("&apos", "'");
			document.getElementById("oldSpecializzazione").value = id;
			document.getElementById("newSpecializzazione").value = id;
		}

		function impostaParametriSpecializzazioneEliminazione(specializzazione) {
			document.getElementById("elimina-specializzazione").value = specializzazione;
			document.getElementById("p-elimina-specializzazione").innerHTML = "Sei sicuro di voler cancellare la specializzazione "
					+ specializzazione + "?";

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