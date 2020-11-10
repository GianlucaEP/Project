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

<title>Home</title>

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
	transition: background-color .5s;
}

header {
	height: 100%;
	background-image: url("/ProgettoHR/img/home.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
	transition: margin-left .5s;
}

h5 {
	letter-spacing: 3px;
	color: #004fff;
}

/* PALLINI STATO CANDIDATO */
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
	margin-top: 5px;
}

#zeroRecord {
	text-align: center;
	letter-spacing: 5px;
	margin: 10px;
}

#img-logo {
	position: relative;
	height: 80px;
	left: 230px;
	transition: left .5s;
}

#btn-nav {
	border: 1px solid white;
	border-radius: 30px;
	height: 45px;
	background-color: white;
}

#btn-logout, #btn-menu, #btn-filtro {
	box-shadow: none !important;
	outline: 0;
	transition: 0.5s;
}

#btn-logout:hover, #btn-menu:hover, #btn-filtro:hover {
	border-radius: 20px;
	background-color: #d3d3d3;
	transition: 0.5s;
	color: black;
	box-shadow: none !important;
	outline: 0;
}

#sidebar {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: white;
	transition: 0.5s;
	padding-top: 60px;
	overflow-x: hidden;
}

#sidebar a {
	text-decoration: none;
	font-size: 20px;
	letter-spacing: 5px;
	display: block;
	transition: 0.3s;
	color: black;
	text-align: left;
}

#sidebar a:hover {
	color: #004fff;
}

#sidebar #btn-menu-close {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

.custom-select {
	width: 35%;
	border: 1px solid white;
	border-radius: 20px 20px 0px 0px;
	box-shadow: none !important;
	outline: 0;
}

option:hover {
	color: #004fff;
	background-color: white;
	transition: 0.5s;
}

/* TABELLA HOME */
.tabellaHome {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 0px 10px 10px 10px;
	overflow: hidden;
	border-collapse: collapse;
}

.tabellaHome .head {
	background-color: white;
	color: black;
	text-align: center;
	letter-spacing: 5px;
}

.tabellaHome .body tr {
	text-align: center;
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaHome .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaHome .body {
	background-color: #e9ecef;
}

.tabellaHome .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaHome .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaHome th {
	padding: 8px;
}

.tabellaHome td {
	font-size: 14px;
	padding: 4px;
}

.tabellaHome .footer {
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

#mansione, #area, #specializzazione {
	border-bottom: 1px solid black;
	border-left: none;
	border-right: none;
	border-top: none;
	border-radius: 0px;
	box-shadow: none !important;
	outline: 0;
	color: #004fff;
	box-shadow: none !important;
}

#btn-salva-mansione, #btn-salva-area, #btn-salva-specializzazione,
	#btn-si {
	background-color: #52b788;
	border: 1px solid #52b788;
	border-radius: 20px;
	color: white;
	letter-spacing: 3px;
	transition: 0.5s;
}

#btn-salva-mansione:hover, #btn-salva-area:hover,
	#btn-salva-specializzazione:hover, #btn-si:hover {
	background-color: #40916c;
	border: 1px solid #40916c;
	border-radius: 20px;
	color: white;
	transition: 0.5s;
}

#btn-cancella-mansione, #btn-cancella-area,
	#btn-cancella-specializzazione, #btn-no {
	background-color: #f25c54;
	border: 1px solid #f25c54;
	border-radius: 20px;
	color: white;
	letter-spacing: 3px;
	transition: 0.5s;
}

#btn-cancella-mansione:hover, #btn-cancella-area:hover,
	#btn-cancella-specializzazione:hover, #btn-no:hover {
	background-color: #ef233c;
	border: 1px solid #ef233c;
	border-radius: 20px;
	color: white;
	transition: 0.5s;
}

.btn-close-modal:hover {
	color: #004fff;
	transition: 0.5s;
}
/* DARK MODE */
#bottoneDarkMode {
	height: 43px;
	float: right;
	background-color: #5aa9e6;
}

.dark-mode {
	background-color: black;
	color: white;
	transition: 0.5s;
}
</style>

</head>

<body onload="validateOption(); x('${statoSelezionato}'); ">
	<header id="header">
		<!-- NAVBAR E SIDEBAR MENU -->
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<div class="row w-100">
					<div id="btn-nav" class="d-flex flex-row">
						<div class="col-auto align-self-center">
							<button onclick="openMenu()" class="btn" id="btn-menu">
								<i class="fas fa-bars"></i>
							</button>
						</div>
						<div class="col-auto align-self-center">
							<button onclick="location.href = '/ProgettoHR/Login';"
								class="btn" id="btn-logout">
								<i class="fas fa-sign-out-alt"></i>
							</button>
						</div>
					</div>
					<!-- SIDEBAR MENU -->
					<div id="sidebar">
						<ul>
							<li><c:forEach var="business" items="${businessList}">
									<a class="dropdown-item"
										href="/ProgettoHR/Home/${business.business}">${business.business}</a>
								</c:forEach></li>
						</ul>
						<hr>
						<a href="javascript:void(0)" id="btn-menu-close"
							onclick="closeMenu()">&times;</a>
						<hr>
						<a href="/ProgettoHR/Candidati/${businessUnit}" class="btn">+
							Nuovo candidato</a>

						<hr>
						<ul class="list-unstyled components">
							<c:if test='${fn:contains(funzionalita, "aggiunta utente")}'>
								<li><a href="/ProgettoHR/Registrati/${businessUnit}"
									class="btn">+ Nuovo utente </a></li>
								<hr>
							</c:if>
							<c:if test='${fn:contains(funzionalita, "aggiunta mansione")}'>
								<li><a href="" data-toggle="modal"
									data-target="#aggiungiMansione" class="btn">+ Nuova
										mansione</a></li>
							</c:if>
							<c:if test='${fn:contains(funzionalita, "visualizza mansione")}'>
								<li><a href="/ProgettoHR/Mansione/${businessUnit}"
									class="btn">- Visualizza mansione</a></li>
								<hr>
							</c:if>

							<c:if test='${fn:contains(funzionalita, "aggiunta area")}'>
								<li><a href="" data-toggle="modal"
									data-target="#aggiungiAreaCompetenza" class="btn">+ Nuova
										area di competenza </a></li>
							</c:if>
							<c:if test='${fn:contains(funzionalita, "visualizza area")}'>
								<li><a href="/ProgettoHR/AreaCompetenza/${businessUnit}"
									class="btn">- Visualizza area di competenza</a></li>
								<hr>
							</c:if>
							<c:if
								test='${fn:contains(funzionalita, "aggiunta specializzazione")}'>
								<li><a href="" data-toggle="modal"
									data-target="#aggiungiSpecializzazione" class="btn">+ Nuova
										specializzazione </a></li>
							</c:if>
							<c:if
								test='${fn:contains(funzionalita, "visualizza specializzazione")}'>
								<li><a href="/ProgettoHR/Specializzazione/${businessUnit}"
									class="btn">- Visualizza specializzazione</a></li>
							</c:if>

						</ul>
						<hr>
						<a href="/ProgettoHR/Filter/${businessUnit}" class="btn">-
							Ricerca candidati</a>
						<hr>
						<a href="/ProgettoHR/Gantt/${businessUnit}" type="button"
							class="btn">- Gantt</a>
						<hr>


					</div>
					<div class="col">
						<a class="navbar-brand w-100"
							href="/ProgettoHR/Home/${businessUnit}"> <img id="img-logo"
							src="/ProgettoHR/img/erretechnologygroup.png">
						</a>
					</div>

				</div>
			</div>
		</nav>

		<!-- CONTENUTO PRINCIPALE -->
		<div class="container">
			<div class="row">
				<div class="col mt-5">

					<div class="row w-100">
						<div class="col mb-2">
							<form action="/ProgettoHR/Home/filter/${businessUnit}"
								method="get">

								<select class="custom-select" onchange="validateOption()"
									id="stati" name="statoSelezionato">
									<option disabled selected>Stato candidato</option>
									<option id="noFiltro" value="noFiltro">Tutti gli stati</option>
									<c:forEach var="stato" items="${statoCandidatoList}">
										<option id="${stato.descrizione}" value="${stato.descrizione}">${stato.descrizione}</option>
									</c:forEach>
								</select>

								<button id="btn-filtro" class="btn" type="submit">
									<i class="fas fa-filter"></i>
								</button>

							</form>
						</div>
						<!--  <div class="col">
							<button class="btn" id="bottoneDarkMode" onclick="darkMode()">
								<span data-toggle="tooltip" data-placement="top"
									title="attiva la modalità dark"><i class="far fa-moon"></i></span>
							</button>
						</div>-->
					</div>

					<div class="row w-100">
						<div class="col">
							<div class="table-responsive">
								<c:choose>
									<c:when test="${empty list}">
										<h2 id="zeroRecord">La ricerca non ha prodotto alcun
											risultato</h2>
									</c:when>
									<c:otherwise>
										<table class="tabellaHome">

											<thead class="head">
												<tr>
													<th scope="col"><h6>Stato</h6></th>
													<th scope="col"><h6>Business unit</h6></th>
													<th scope="col"><h6>Nome</h6></th>
													<th scope="col"><h6>Cognome</h6></th>
													<th scope="col"><h6>Area Competenza</h6></th>
													<th scope="col"><h6>Mansione</h6></th>
													<th scope="col"><h6>Seniority</h6></th>
													<th scope="col"></th>
													<th scope="col"></th>
												</tr>
											</thead>

											<tbody class="body">
												<c:forEach var="cand" items="${list}">
													<tr>
														<td><c:choose>
																<c:when test="${ cand.stato.descrizione == 'Attivo'}">
																	<span id="dot" data-toggle="tooltip"
																		data-placement="top" title="Attivo"
																		class="dot bg-success"></span>
																</c:when>
																<c:when
																	test="${ cand.stato.descrizione == 'Selezionato'}">
																	<span id="dot" data-toggle="tooltip"
																		data-placement="top" title="Selezionato"
																		class="dot bg-primary"></span>
																</c:when>
																<c:when
																	test="${ cand.stato.descrizione == 'Da contattare'}">
																	<span id="dot" data-toggle="tooltip"
																		data-placement="top" title="Da contattare"
																		class="dot bg-warning"></span>
																</c:when>
																<c:when test="${ cand.stato.descrizione == 'Scartato'}">
																	<span id="dot" data-toggle="tooltip"
																		data-placement="top" title="Scartato"
																		class="dot bg-danger"></span>
																</c:when>
																<c:otherwise>
																	<span id="dot" data-toggle="tooltip"
																		data-placement="top" title="Nuovo inserito"
																		class="dot bg-secondary"></span>
																</c:otherwise>
															</c:choose></td>
														<td>${cand.business.business}</td>
														<td>${cand.nome}</td>
														<td>${cand.cognome}</td>

														<td><c:forEach var="area" items="${cand.area}">
														
															- ${area.area}  
													</c:forEach></td>

														<td><c:forEach var="mansione"
																items="${cand.mansione}">
													
														   - ${mansione.mansione}
													</c:forEach></td>

														<td>${cand.seniority.seniority}</td>

														<td>
															<button class="btn " id="btn-modifica"
																onclick="window.location = '/ProgettoHR/Candidato/${cand.business.business}/${cand.id}'">
																<span data-toggle="tooltip" data-placement="top"
																	title="Modifica candidato"><i
																	class="fas fa-user-edit"></i></span>

															</button>

														</td>
														<td><button class="btn" id="btn-elimina"
																data-toggle="modal"
																onclick="impostaParametriCandidatoId(${cand.id}, '${cand.nome}', '${cand.cognome}')"
																data-target="#eliminaCandidato">
																<span data-toggle="tooltip" data-placement="top"
																	title="Elimina candidato"> <i
																	class="fas fa-trash"></i>
																</span>

															</button></td>
													</tr>

												</c:forEach>
											</tbody>

											<tfoot class="footer">
												<tr>
													<td colspan="9"></td>

												</tr>
											</tfoot>
										</table>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
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
					<h5 class="modal-title">Aggiungi una mansione:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="mansione" id="formMansione" method="POST"
					action="/ProgettoHR/MansioniSaveDaHome/${businessUnit}"
					onsubmit="return validate('Mansione', '${mansioneList}' );">
					<!-- tipo, valoreInserito, lista -->
					<div class="modal-body">
						<form:input path="mansione" type="text" class="form-control"
							maxlength="45" id="mansione" name="mansione"></form:input>
					</div>

					<div class="modal-footer">
						<button type="reset" class="btn" id="btn-cancella-mansione">Cancella</button>
						<button type="submit" class="btn" id="btn-salva-mansione">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>


	<!-- MODAL AGGIUNTA AREA COMPETENZA -->
	<div class="modal fade" id="aggiungiAreaCompetenza" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiArea" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi un'area di competenza:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="areaCompetenza" id="formAreaCompetenza"
					method="POST"
					action="/ProgettoHR/AreaCompetenzaSaveDaHome/${businessUnit}"
					onsubmit="return validateArea('Area Competenza', '${areaList}');">
					<div class="modal-body">

						<form:input path="area" type="text" class="form-control"
							maxlength="45" id="area"></form:input>
					</div>

					<div class="modal-footer">
						<button type="reset" id="btn-cancella-area" class="btn">Cancella</button>
						<button type="submit" id="btn-salva-area" class="btn">Salva</button>
					</div>
				</form:form>

			</div>
		</div>
	</div>

	<!-- MODAL AGGIUNTA SPECIALIZZAZIONE -->
	<div class="modal fade" id="aggiungiSpecializzazione" tabindex="-1"
		role="dialog" aria-labelledby="modalSpecializzazione"
		aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Aggiungi una specializzazione:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="specializzazione"
					id="formSpecializzazione" method="POST"
					action="/ProgettoHR/SpecializzazioneSaveDaHome/${businessUnit}"
					onsubmit="return validateSpecializzazione('Specializzazione', '${specializzazioneList}');">
					<div class="modal-body">
						<form:input path="specializzazione" type="text" maxlength="45"
							class="form-control" id="specializzazione"></form:input>
					</div>
					<div class="modal-footer">
						<button type="submit" id="btn-salva-specializzazione" class="btn">Salva</button>
						<button type="reset" id="btn-cancella-specializzazione"
							class="btn">Cancella</button>
					</div>

				</form:form>
			</div>
		</div>
	</div>

	<!-- MODAL CANCELLA CANDIDATO -->
	<div class="modal fade" id="eliminaCandidato" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaCandidato"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/Elimina/${businessUnit}" method="POST">

					<div class="modal-header">
						<h5 class="modal-title">Cancella candidato selezionato:</h5>
					</div>
					<div class="modal-body" id="modalText"></div>
					<input style="visibility: hidden;" name="idCandidato"
						id="candidatoId" />

					<div class="modal-footer">
						<button type="button" class="btn text-center" id="btn-no"
							data-dismiss="modal">No</button>
						<button type="submit" class="btn text-center" id="btn-si">Sì</button>
					</div>

				</form>
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
		function impostaParametriCandidatoId(id, nome, cognome) {
			document.getElementById("candidatoId").value = id;
			document.getElementById("modalText").textContent = "Sei sicuro di voler cancellare il candidato "+nome+" "+cognome+"?"

		}
		function changeDotColor(stato) {
			if (stato === "attivo") {
				document.getElementById("dot").className = "dot bg-success";
			}
		}

		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
		})
		
		function buildString(string) {
			return string.replace("[", "").replace("]", "").split(", ");
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
		function validateArea(tipo, lista) {
			var areaCompetenza = document.getElementById("area").value;
			var list = document.getElementById("formAreaCompetenza");
			var control = true;

			if (areaCompetenza === "") {

				var tagDiv = document.createElement("div");
				tagDiv.style = "color:red; font-size: small;"
				var textnode = document
						.createTextNode("Inserisci Area di competenza")
				tagDiv.appendChild(textnode)
				document.getElementById("area").appendChild(tagDiv);
				control = false;
				
				return control;

			}
			
			control = insertionMessage(tipo,'area', lista);
			
			return control;
		}
		function validateSpecializzazione(tipo, lista) {
				var specializzazione = document.getElementById("specializzazione").value;
				var list = document.getElementById("formSpecializzazione");
				var control = true;

				if (specializzazione === "") {

					var tagDiv = document.createElement("div");
					tagDiv.style = "color:red; font-size: small;"
					var textnode = document
							.createTextNode("Inserisci Specializzazione")
					tagDiv.appendChild(textnode)
					document.getElementById("specializzazione").appendChild(tagDiv);
					control = false;
					
					return control;

				}
	
				control = insertionMessage(tipo,'specializzazione', lista);
				
				return control;
		}
		function x(statoSelezionato) {

			if (statoSelezionato!==""){
				document.getElementById(statoSelezionato).selected=true;
			}
		} 
		
		function insertionMessage(tipo, id, lista){
			lista = buildString(lista);
			if(lista.indexOf(document.getElementById(id).value) !== -1){
				$('#errorModal').modal('toggle');   
				document.getElementById("errorModalLabel").innerHTML = tipo;
				document.getElementById("errorModalBody").innerHTML = tipo + " già inserita.";  
				return false;
			}
			
			return true;
		}
		
		function validateOption(){
			var e = document.getElementById("stati");
			var value = e.options[e.selectedIndex].value;
	
			
			if (value === "Stato candidato") {
				document.getElementById("btn-filtro").disabled = true;
			} else {
				document.getElementById("btn-filtro").disabled = false;
			}
		}
		function darkMode() {
			   var element = document.body;
			   element.classList.toggle("dark-mode");
			}
		
		function openMenu() {
			  document.getElementById("sidebar").style.width = "500px";
			  document.getElementById("header").style.marginLeft = "250px";
			  document.getElementById("img-logo").style.left = "110px";
			  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
			}

		function closeMenu() {	
			  document.getElementById("sidebar").style.width = "0";			 
			  document.getElementById("header").style.marginLeft = "0";
			  document.getElementById("img-logo").style.left = "230px";
			  
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
