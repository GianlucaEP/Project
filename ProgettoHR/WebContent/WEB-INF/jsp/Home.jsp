<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

/* MEDIA PER SCHERMO DESKTOP GRANDE */
body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
	transition: 0.5s;
}

#aSidebar, #aSidebar:hover, #aSidebar:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

.dark-mode {
	background-color: black;
	color: white;
	transition: 0.5s;
}

/* PALLINI STATO CANDIDATO */
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
	margin-top: 5px;
}

/* NAVBAR */
.navbar {
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-nav .nav-link {
	height: 50px;
	width: 50px;
	background-color: #7fc8f8;
	border-radius: 50%;
}

.navbar .navbar-brand .logo {
	width: auto;
	height: 70px;
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

/* SIDEBAR */
#sidebar {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 0px 5px 5px 0px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
	background: #5aa9e6;
	color: #fff;
	border-collapse: collapse;
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

#zeroRecord {
	text-align: center;
}

/* TABELLA HOME */
.tabellaHome {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
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

.tabellaHome .body tr {
	text-align: center;
	border-bottom: 1px solid #dddddd;
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

/* filtro stato candidato */
.select {
	position: relative;
	padding: 0.5em 4em 0.5em 1.5em;
	color: #333333;
	background-color: #ffffff;
	border: 1px solid #dddddd;
	cursor: pointer;
	border-radius: .25rem 0px 0px .25rem;
	/*appearance: none;*/
}

.select option {
	background-color: white;
}

.custom-arrow {
	/*position: absolute;*/
	top: 0;
	/*right: 0.3em;*/
	display: block;
	background-color: #5aa9e6;
	height: 42px;
	width: 2.5em;
	pointer-events: none;
	/*border-radius: 0px 3px 0px 0px;*/
}

.custom-arrow::before, .custom-arrow::after {
	content: '';
	position: absolute;
	width: 0;
	height: 0;
	left: 50%;
	transform: translate(-50%, -50%);
}

.custom-arrow::before {
	border-right: 0.50em solid transparent;
	border-left: 0.50em solid transparent;
	border-bottom: 0.50em solid rgba(255, 255, 255, 0.5);
	top: 35%;
}

.custom-arrow::after {
	border-right: 0.50em solid transparent;
	border-left: 0.50em solid transparent;
	border-top: 0.50em solid rgba(255, 255, 255, 0.5);
	top: 65%;
}

.btn {
	margin-top: 0.06em;
	padding: 0;
	height: 40px;
	width: 40px;
	background-color: #5aa9e6;
	padding: 0;
}

svg {
	width: 25px;
	height: 25px;
	overflow: hidden;
	vertical-align: middle;
}

.bottoneFiltro {
	height: 43px;
	width: 43px;
	background-color: #5aa9e6;
}

#bottone-salva-mansione {
	margin: 3px;
	padding: 3px;
	width: auto;
}

#bottone-cancella-mansione {
	padding: 3px;
	width: auto;
	margin: 0;
}

#bottone-salva-specializzazione {
	margin: 3px;
	padding: 3px;
	width: auto;
}

#bottone-cancella-specializzazione {
	padding: 3px;
	width: auto;
	margin: 0;
}

#bottone-salva-area {
	margin: 3px;
	padding: 3px;
	width: auto;
}

#bottone-cancella-area {
	padding: 3px;
	width: auto;
	margin: 0;
}

#iconaLogout {
	margin-top: 0;
}

.fa-sort {
	color: white;
}

@media screen and (max-width: 855px) {
	body {
		
	}
	#colonnaTable {
		
	}
	[class*="col-"] {
		width: 100%;
	}
}
</style>

</head>

<body onload="validateOption(); x('${statoSelezionato}'); ">
	<div class="container-fluid p-0">
		<!-- NAVBAR -->
		<nav class="navbar">


			<!-- LOGO -->
			<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
				<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
			</a>

			<!-- BOTTONE PROFILO -->
			<!--  <button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-expanded="false"
				aria-controls="navbarCollapse" aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>-->

			<div id="navbarResponsive">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item"><form action="/ProgettoHR/Logout">
							<button type="submit" class="btn nav-link ">
								<i id="iconaLogout" class="fas fa-sign-out-alt"></i>
							</button>
						</form></li>






				</ul>
			</div>


		</nav>


		<!-- COLONNA BARRA LATERALE -->
		<div class="row w-100 mr-0 mt-4">
			<div id="colonnaTable" class="col-auto align-self-stretch">
				<!-- BARRA LATERALE -->
				<nav id="sidebar">
					<div class="sidebar-header">
						<h3>Home</h3>
					</div>

					<ul class="list-unstyled components">

						<li class="active"><a href="#homeSubmenu"
							data-toggle="collapse" aria-expanded="false"
							class="dropdown-toggle">Business Unit</a>
							<ul class="collapse list-unstyled" id="homeSubmenu">
								<li><c:forEach var="business" items="${businessList}">
										<a class="dropdown-item"
											href="/ProgettoHR/Home/${business.business}">${business.business}</a>
									</c:forEach></li>

							</ul></li>
						<li><a id="aSidebar"
							href="/ProgettoHR/Candidati/${businessUnit}" type="button"><i
								class="fas fa-plus"></i> Nuovo Candidato</a></li>

						<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
							<c:choose>
								<c:when test="${funz.funzionalita == 'aggiunta mansione'}">
									<li><a id="aSidebar" href="" data-toggle="modal"
										data-target="#mansioneModal" type="button"><i
											class="fas fa-plus"></i> Nuova Mansione</a></li>
									<li><a id="aSidebar"
										href="/ProgettoHR/Mansione/${businessUnit}" type="button"><i
											class="fas fa-long-arrow-alt-right"></i> Visualizza Mansione</a></li>

								</c:when>
								<c:when test="${funz.funzionalita == 'aggiunta area'}">
									<li><a id="aSidebar" href="" data-toggle="modal"
										data-target="#areaCompetenzaModal" type="button"><i
											class="fas fa-plus"></i> Nuova Area </a></li>
								</c:when>
								<c:when
									test="${funz.funzionalita == 'aggiunta specializzazione'}">
									<li><a id="aSidebar" href="" data-toggle="modal"
										data-target="#specializzazioneModal" type="button"><i
											class="fas fa-plus"></i> Nuova Specializzazione </a></li>
								</c:when>
							</c:choose>
						</c:forEach>


						<li><a id="aSidebar"
							href="/ProgettoHR/Filter/${businessUnit}" type="button"
							class="text-center">Filtri</a></li>
					</ul>
				</nav>
			</div>

			<!-- FILTRO STATO CANDIDATO -->
			<div class="col p-0 mr-4">
				<div class="row w-100 mb-1">
					<div class="col">
						<form action="/ProgettoHR/Home/filter/${businessUnit}"
							method="post">
							<div class="input-group" style="display: inline-flex;">


								<select class="select" onchange="validateOption()" id="stati"
									name="statoSelezionato">

									<option disabled selected>Stato candidato</option>
									<option id="noFiltro" value="noFiltro">Tutti gli stati</option>
									<c:forEach var="stato" items="${statoCandidatoList}">
										<option id="${stato.descrizione}" value="${stato.descrizione}">${stato.descrizione}</option>
									</c:forEach>

								</select>
								<div class="input-group-append">
									<button id="bottoneFiltro" class="btn bottoneFiltro mt-0"
										type="submit">
										<svg width="1em" height="1em" viewBox="0 0 16 16"
											class="bi bi-funnel" fill="currentColor"
											xmlns="http://www.w3.org/2000/svg"> <path
												fill-rule="evenodd"
												d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z" /></svg>
									</button>
								</div>

							</div>

						</form>
					</div>
					<div class="col">
						<button class="btn" onclick="darkMode()" style="float: right;">
							<span data-toggle="tooltip" data-placement="top"
								title="attiva la modalità dark"><i class="far fa-moon"></i></span>
						</button>
					</div>

				</div>

				<div class="row w-100">
					<div class="col w-100 table-responsive">
						<!-- TABELLA CANDIDATO -->
						<c:choose>
							<c:when test="${empty list}">
								<h2 id="zeroRecord">La ricerca non ha prodotto alcun
									risultato</h2>
							</c:when>
							<c:otherwise>
								<table class="tabellaHome">

									<thead class="head">
										<tr>
											<th colspan="1" scope="col">Stato</th>
											<th colspan="1" scope="col">Business unit</th>
											<th colspan="1" scope="col">Nome</th>
											<th colspan="1" scope="col">Cognome</th>
											<th colspan="1" scope="col">Area Competenza</th>
											<th colspan="1" scope="col">Mansione</th>
											<th colspan="1" scope="col">Seniority</th>
											<th colspan="1" scope="col"></th>
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
														<c:when
															test="${ cand.stato.descrizione == 'Da contattare'}">
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
												<td>${cand.business.business}</td>
												<td>${cand.nome}</td>
												<td>${cand.cognome}</td>

												<td><c:forEach var="area" items="${cand.area}">
														
															${area.area}
													</c:forEach></td>

												<td><c:forEach var="mansione" items="${cand.mansione}">
													
															${mansione.mansione}
													</c:forEach></td>

												<td>${cand.seniority.seniority}</td>

												<td><button class="btn mr-1"
														onclick="window.location = '/ProgettoHR/Candidato/${cand.business.business}/${cand.id}'">
														<span data-toggle="tooltip" data-placement="top"
															title="Modifica candidato"><i
															class="fas fa-user-edit"></i></span>

													</button>
													<button class="btn" data-toggle="modal" class="btn mr-1"
														onclick="impostaParametriCandidatoId(${cand.id})"
														data-target="#EliminaModal">
														<span data-toggle="tooltip" data-placement="top"
															title="Elimina candidato"> <i
															class="fas fa-trash-alt"></i>
														</span>

													</button></td>

											</tr>

										</c:forEach>
									</tbody>

									<tfoot class="footer" style="background-color: #5aa9e6">
										<tr>
											<td colspan="8"></td>

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

	<!-- MODAL AGGIUNTA MANSIONE -->
	<div class="modal fade" id="mansioneModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">


				<div class="modal-header">
					<h5 class="modal-title">Aggiungi Mansione</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="mansione" id="formMansione" method="POST"
					action="/ProgettoHR/MansioniSaveDaHome/${businessUnit}"
					onsubmit="return validate('Mansione', '${mansioneList}' );">
					<!-- tipo, valoreInserito, lista -->
					<div class="modal-body">
						<form:input path="mansione" type="text" class="form-control"
							placeholder="Mansione" id="mansione" name="mansione"></form:input>
					</div>

					<div class="modal-footer">
						<button type="submit" id="bottone-salva-mansione"
							class="btn btn-success" style="background-color: green;">Salva</button>
						<button type="reset" id="bottone-cancella-mansione"
							class="btn btn-danger" style="background-color: red;">Cancella</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>


	<!-- MODAL AGGIUNTA AREA COMPETENZA -->
	<div class="modal fade" id="areaCompetenzaModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Aggiungi Area
						Competenza</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="areaCompetenza" id="formAreaCompetenza"
					method="POST"
					action="/ProgettoHR/AreaCompetenzaSaveDaHome/${businessUnit}"
					onsubmit="return validateArea('Area Competenza', '${areaList}');">
					<div class="modal-body">

						<form:input path="area" type="text" class="form-control"
							placeholder="Area di Competenza" id="area"></form:input>
					</div>

					<div class="modal-footer">
						<button type="submit" id="bottone-salva-area"
							class="btn btn-success" style="background-color: green;">Salva</button>
						<button type="reset" id="bottone-cancella-area"
							class="btn btn-danger" style="background-color: red;">Cancella</button>
					</div>
				</form:form>

			</div>
		</div>
	</div>

	<!-- MODAL AGGIUNTA SPECIALIZZAZIONE -->
	<div class="modal fade" id="specializzazioneModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Aggiungi
						Specializzazione</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="specializzazione"
					id="formSpecializzazione" method="POST"
					action="/ProgettoHR/SpecializzazioneSaveDaHome/${businessUnit}"
					onsubmit="return validateSpecializzazione('Specializzazione', '${specializzazioneList}');">
					<div class="modal-body">

						<form:input path="specializzazione" type="text"
							class="form-control" placeholder="Specializzazione"
							id="specializzazione"></form:input>

					</div>

					<div class="modal-footer">
						<button type="submit" id="bottone-salva-specializzazione"
							class="btn btn-success" style="background-color: green;">Salva</button>
						<button type="reset" id="bottone-cancella-specializzazione"
							class="btn btn-danger" style="background-color: red;">Cancella</button>
					</div>

				</form:form>
			</div>
		</div>
	</div>


	<!-- MODAL CANCELLA CANDIDATO -->
	<div class="modal fade" id="EliminaModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/Elimina/${businessUnit}" method="POST">

					<div class="modal-header">
						Sei sicuro di voler cancellare il candidato selezionato? <input
							style="visibility: hidden;" name="idCandidato" id="candidatoId" />
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success"
							style="background-color: green;">sì</button>
						<button type="button" class="btn btn-danger"
							style="background-color: red;" data-dismiss="modal">no</button>
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
						class="btn btn-danger" data-dismiss="modal"
						style="background-color: red;">Chiudi</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		function impostaParametriCandidatoId(id) {
			document.getElementById("candidatoId").value = id;

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
				document.getElementById("errorModalBody").innerHTML = tipo + "già inserita.";  
				return false;
			}
			
			return true;
		}
		
		function validateOption(){
			var e = document.getElementById("stati");
			var value = e.options[e.selectedIndex].value;
	
			
			if (value === "Stato candidato") {
				document.getElementById("bottoneFiltro").disabled = true;
			} else {
				document.getElementById("bottoneFiltro").disabled = false;
			}
		}
		function darkMode() {
			   var element = document.body;
			   element.classList.toggle("dark-mode");
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