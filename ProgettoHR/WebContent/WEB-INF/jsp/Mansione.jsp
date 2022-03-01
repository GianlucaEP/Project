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
		background-image: url("/ProgettoHR/img/msa.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center center;
		background-attachment: fixed;
	}
	
	header {
		height: 100%;
	}
	
	span {
		letter-spacing: 5px;
	}
	
	#zeroRecord {
		text-align: center;
		letter-spacing: 5px;
		margin: 10px;
		color: white;
	}
	
	#btn-nav {
		border: 1px solid white;
		border-radius: 5px;
		height: 45px;
		background-color: white;
	}
	
	#btn-logout, #btn-home, #btn-add {
		border-radius: 5px;
		color: black;
		outline: 0;
		transition: 0.5s;
		color: black;
	}
	
	#btn-logout:hover, #btn-home:hover {
		box-shadow: 1px 1px 2px black;
		transition: 0.5s;
		color: black;
	}
	
	#btn-add:hover {
		box-shadow: 1px 1px 2px #00b894;
		transition: 0.5s;
		color: black;
	}
	
	/* TABELLA MANSIONE */
	.tabellaMansione {
		width: 50%;
		border-radius: 5px;
		overflow: hidden;
		border-collapse: collapse;
		margin-left: auto;
		margin-right: auto;
		font-size: 0.9em;
	}
	
	.tabellaMansione .head {
		background-color: whitesmoke;
		color: black;
		letter-spacing: 5px;
		border-bottom: 2px solid black;
	}
	
	.tabellaMansione .body {
		background-color: white;
	}
	
	.tabellaMansione .body tr {
		border-bottom: 2px solid whitesmoke;
		color: black;
		letter-spacing: 3px;
		transition: 0.5s;
	}
	
	.tabellaMansione th {
		padding: 8px;
	}
	
	.tabellaMansione td {
		font-size: 14px;
		padding: 4px;
	}
	
	.tabellaMansione .footer {
		background-color: whitesmoke;
	}
	
	.m-content, .m-content-elimina, .m-content-modifica {
		background-color: transparent;
		border: none;
	}
	
	.m-header, .m-header-elimina, .m-header-modifica {
		background-color: white;
		border-radius: 20px 20px 0px 0px;
	}
	
	.m-body {
		padding: 20px;
		margin-top: 2px;
		border: 1px solid #d3d3d3;
		border-radius: 0px 0px 20px 20px;
		border: 1px solid #d3d3d3;
		border-radius: 0px 0px 20px 20px;
		background-color: white;
	}
	
	.m-body-elimina, .m-body-modifica {
		padding: 20px;
		margin-top: 2px;
		margin-bottom: 2px;
		border: 1px solid white;
		background-color: white;
		color: black;
		letter-spacing: 3px;
		border: 1px solid white
	}
	
	.m-input, .m-input-modifica, .m-input-aggiungi {
		border: 1px solid black;
		border-radius: 20px;
		box-shadow: none !important;
		outline: 0;
		transition: 0.5s;
	}
	
	.m-input-aggiungi:focus {
		border: 1px solid #00b894;
	}
	
	.m-input-modifica:focus {
		border: 1px solid #74b9ff;
	}
	
	.m-footer-elimina, .m-footer-modifica {
		border-radius: 0px 0px 20px 20px;
		background-color: white;
	}
	
	.btn-aggiungi {
		border-radius: 20px;
		color: black;
		transition: 0.5s;
		box-shadow: 1px 1px 2px #00b894;
		outline: 0;
	}
	
	.btn-aggiungi:hover {
		background: #00b894;
		color: white;
		box-shadow: none !important;
		outline: 0;
	}
	
	//
	.btn-salva {
		border: 1px solid white;
		border-radius: 20px;
		background: white;
		color: black;
		transition: 0.5s;
		box-shadow: none !important;
		outline: 0;
	}	
	//
	
	.btn-si, .btn-modifica {
		border: 1px solid #00b894;
		background: #00b894;
		border-radius: 15px;
		box-shadow: none !important;
		outline: 0;
		color: white;
	}
	
	.btn-si:hover, .btn-modifica:hover {
		color: white;
	}
	
	.btn-no, .btn-annulla {
		color: #d63031;
		transition: 0.5s;
		border-radius: 15px;
	}
	
	.btn-no:hover, .btn-annulla:hover {
		box-shadow: 1px 1px 2px #ff7675;
		transition: 0.5s;
		color: #d63031;
	}
	
	.btn-elimina-mansione {
		transition: 0.5s;
	}
	
	.btn-elimina-mansione:hover {
		box-shadow: 1px 1px 2px #d63031;
		color: #d63031;
		border-radius: 5px;
		transition: 0.5s;
	}
	
	.btn-modifica-mansione {
		background: #74b9ff;
		color: white;
		border-radius: 5px;
		transition: 0.5s;
	}
	
	.btn-modifica-mansione:hover {
		color: white;
		background: #0984e3;
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
							<button onclick="location.href = '/ProgettoHR/Logout';"
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
											<c:set var="mansioneXSS" value="${fn:escapeXml(mansione.mansione)}"></c:set>
											<td>${mansioneXSS}</td>

											<td>
												<button class="btn btn-modifica-mansione"
													data-toggle="modal"
													onclick="impostaParametriMansione('${mansioneRaplaced}')"
													data-target="#modificaMansione">
													<i class="fas fa-pencil-alt"></i>
												</button>
												<button class="btn btn-elimina-mansione" 
													data-toggle="modal"
													onclick="impostaParametriMansioneEliminazione('${mansione.mansione}')"
													data-target="#eliminaMansione">
													<i class="fas fa-trash"></i>
												</button>
											</td>
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
		role="dialog" aria-labelledby="modalAggiungiMansione" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content m-content">

				<div class="modal-header m-header">
					<span class="modal-title">Inserisci una nuova 
						<span style="color: #004fff;">mansione</span>:
					</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>
				
				<form:form modelAttribute="mansione" id="formMansione" method="POST"
					action="/ProgettoHR/MansioniSaveDaMansione/${businessUnit}"
					onsubmit="return validateMansione('Mansione', '${mansioneList}' );">
					<div class="modal-body m-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col-10">
									<form:input path="mansione" type="text"
										class="form-control m-input-aggiungi" maxlength="45"
										id="mansione" autocomplete="off"></form:input>
								</div>
								<div class="col-2">
									<button class="btn btn-aggiungi" type="submit">
										<i class="fas fa-plus"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</form:form>

			</div>
		</div>
	</div>

	<!-- MODAL MODIFICA MANSIONE -->
	<div class="modal fade" id="modificaMansione" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaMansione" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content m-content-modifica">
				<form action="/ProgettoHR/AggiornaMansione/${businessUnit}"
					method="POST">

					<div class="modal-header m-header-modifica">
						<span class="modal-title">Modifica la <span
							style="color: #004fff;">mansione</span>:
						</span>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="btn-close-modal">&times;</span>
						</button>
					</div>

					<div class="modal-body m-body-modifica">
						<input type="text" class="form-control m-input-modifica"
							name="newMansione" id="newMansione"> <input
							style="visibility: hidden;" name="oldMansione" id="oldMansione" />
					</div>

					<div class="modal-footer m-footer-modifica">
						<button type="button" class="btn btn-annulla" data-dismiss="modal">Annulla</button>
						<button type="submit" class="btn btn-modifica">Modifica</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- MODAL CANCELLA MANSIONE -->
	<div class="modal fade" id="eliminaMansione" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaMansione" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered" role="document">
			<div class="modal-content m-content-elimina">

				<div class="modal-header m-header-elimina">
					<span class="modal-title">Cancella la <span
						style="color: #004fff;">mansione</span>:
					</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>

				<form action="/ProgettoHR/EliminaMansione/${businessUnit}"
					method="POST">

					<div class="modal-body m-body-elimina">
						<p id="p-elimina-mansione"></p>
						<input style="visibility: hidden;" name="eliminaMansione"
							id="elimina-mansione" />
					</div>

					<div class="modal-footer m-footer-elimina">
						<button type="button" class="btn btn-no" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-si">Sì</button>
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
		
		function validateMansione(tipo, lista) {
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