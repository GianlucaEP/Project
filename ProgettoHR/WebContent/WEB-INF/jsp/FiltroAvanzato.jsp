<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Filtro avanzato</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"> 
</script>
<script
	src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"> 
</script>

<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
/* MEDIA PER SCHERMO DESKTOP GRANDE */
html, body {
	height: 100%;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

/* Pallini dello stato del candidato*/
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
	margin-top: 5px;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

/* NAVBAR */
.navbar {
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
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

.navbar-nav .nav-link {
	height: 50px;
	width: 50px;
	border-radius: 50%;
	background-color: #7fc8f8;
	border-radius: 50%;
}

.navbar .navbar-brand .logo {
	width: auto;
	height: 70px;
}

/* Barra Laterale */
.container1 {
	width: 100%;
	margin-top: 20px;
	padding: 0;
	display: flex;
	flex-direction: rows;
	justify-content: flex-start;
	display: flex;
}

#sidebar {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
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
/* Tabella risultati */
.tabellaFiltri {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaFiltri .head {
	background-color: #5aa9e6;
	color: #ffffff;
	text-align: center;
	font-weight: bold;
}

.tabellaFiltri .body tr {
	text-align: center;
	border-bottom: 1px solid #dddddd;
}

.tabellaFiltri .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaFiltri .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaFiltri th {
	padding: 8px;
}

.tabellaFiltri td {
	font-size: 14px;
	padding: 4px;
}
</style>

</head>
<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-xl ">
		<div class="container-fluid">

			<!-- LOGO -->
			<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
				<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
			</a>

			<!-- LOGOUT -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="/ProgettoHR/Logout"><i class="fas fa-sign-out-alt"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid container1">
		<!-- COLONNA BARRA LATERALE -->
		<div class="col-2 m-0 p-0">
			<!-- BARRA LATERALE -->
			<nav id="sidebar">

				<div class="sidebar-header">
					<h3>Filtro</h3>
				</div>

				<form autocomplete="off" method="POST"
					action="/ProgettoHR/Filter/advanced/${businessUnit}"
					onsubmit="controlloMappa()">

					<div class="col">

						<div class="form-group">
							<label for="nome">Nome:</label> <input id="nome" name="nome"
								type="text" class="form-control">
						</div>
						<div class="form-group">
							<label>Cognome:</label> <input id="cognome" name="cognome"
								type="text" class="form-control">
						</div>
						<div class="form-group">
							<label>Anno di nascita:</label> <input id="anno" maxlength="4"
								name="anno" class="form-control" type="text" placeholder="yyyy">
						</div>
						<div class="form-group">
							<label>Telefono:</label> <input id="telefono" name="telefono"
								class="form-control" type="text" placeholder="123-456-7890">
						</div>

						<div class="form-group">
							<label>E-mail:</label> <input id="email" name="email"
								class="form-control" type="text">
						</div>

						<div class="form-group">
							<label>Business unit:</label> <select id="selectBusiness"
								name="business" class="form-control custom-select">
								<option selected></option>
								<c:forEach var="bus" items="${businessList}">
									<option value="${bus.business}">${bus.business}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Seniority:</label> <select id=selectSeniority
								name="seniority" class="custom-select form-control">
								<option selected></option>
								<c:forEach var="sen" items="${seniorityList}">
									<option value="${sen.seniority}">${sen.seniority}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Provenienza:</label> <input id="provenienza"
								name="provenienza" class="form-control" type="text">
						</div>

						<div class="form-group">
							<div id="areeCompetenzaDiv">
								<label>Area di competenza:</label>
								<div class="form-row">
									<div class="col-10">
										<input autocomplete="off" placeholder="aggiungi"
											list="areeCompetenzeDisponibili" id="areaCompetenzaInput"
											class="form-control">
										<datalist id="areeCompetenzeDisponibili">
											<c:forEach var="area" items="${areaCompetenzaList}">
												<option value="${area}"></option>
											</c:forEach>
										</datalist>
									</div>
									<div class="col-1">
										<div
											onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
											class="btn">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div id="mansioneDiv">
								<label>Mansione</label>
								<div class="form-row">
									<div class="col-10">
										<input autocomplete="off" placeholder="aggiungi"
											list="mansioniDisponibili" id="mansioneInput"
											class="form-control">
										<datalist id="mansioniDisponibili">
											<c:forEach var="mans" items="${mansioneList}">
												<option value="${mans}"></option>
											</c:forEach>
										</datalist>
									</div>
									<div class="col-1">
										<div onclick="stampaMansioneSelezionata('${mansioneList}')"
											class="btn">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div id="specializzazioneDiv">
								<label>Specializzazione</label>
								<div class="form-row">
									<div class="col-10">
										<input autocomplete="off" placeholder="aggiungi"
											list="specializzazioniDisponibili" id="specializzazioneInput"
											class="form-control">
										<datalist id="specializzazioniDisponibili">
											<c:forEach var="specializzazione"
												items="${specializzazioneList}">
												<option value="${specializzazione}"></option>
											</c:forEach>
										</datalist>
									</div>
									<div class="col-1">
										<div
											onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
											class="btn">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="form-group">
							<label>Costo unitario all'ora</label> da <input
								id="costoMinInput" name="costoMin" class="form-control"
								style="border-color: transparent;" type="text"
								placeholder="costo minimo"> A<input id="costoMaxInput"
								name="costoMax" class="form-control"
								style="border-color: transparent;" type="text"
								placeholder="costo massimo">
						</div>

						<div class="form-group">
							<div id="specializzazioneDiv">

								Dal <input type="date" id="dataInserimentoInputFrom"
									name="dataInserimentoFrom" class="form-control"
									style="border-color: transparent;"> Al <input
									type="date" id="dataInserimentoInputTo"
									name="dataInserimentoTo" class="form-control"
									style="border-color: transparent;">

							</div>
						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Salva</button>
						</div>
					</div>
				</form>
			</nav>
		</div>

		<div class="col-10">

			<button type="button" id="exportButton" class="btn mb-2"
				style="border-color: transparent; background: #5aa9e6;">Esporta
				Risultati</button>

			<table id="risultatiTable" class="tabellaFiltri">
				<!-- Testa della tabella -->
				<thead class="head">
					<tr>
						<th class="noExport" scope="col">Stato</th>
						<th scope="col">Business unit</th>
						<th scope="col">Nome</th>
						<th scope="col">Cognome</th>
						<c:forEach items="${filterList}" var="filter">
							<c:if test="${ filter.key == 'anno' }">
								<th scope="col">Anno</th>
							</c:if>
							<c:if test="${ filter.key == 'telefono' }">
								<th scope="col">Telefono</th>
							</c:if>
							<c:if test="${ filter.key == 'email' }">
								<th scope="col">E-mail</th>
							</c:if>
							<c:if test="${ filter.key == 'seniority' }">
								<th scope="col">Seniority</th>
							</c:if>
							<c:if test="${ filter.key == 'provenienza' }">
								<th scope="col">Provenienza</th>
							</c:if>
							<c:if test="${ filter.key == 'area' }">
								<th scope="col">Area Competenza</th>
							</c:if>
							<c:if test="${ filter.key == 'mansione' }">
								<th scope="col">Mansione</th>
							</c:if>
							<c:if test="${ filter.key == 'specializzazione' }">
								<th scope="col">Specializzazione</th>
							</c:if>
							<c:if test="${fn:contains( filter.key, 'data') }">
								<th scope="col">Inserimento Azienda</th>
							</c:if>
							<c:if test="${fn:contains( filter.key, 'costo') }">
								<th scope="col">costo orario</th>
							</c:if>
						</c:forEach>
					</tr>
				</thead>
				<!-- Corpo della tabella -->
				<tbody class="body">
					<c:forEach var="cand" items="${list}">
						<tr>
							<td class="noExport"><c:choose>
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
							<c:forEach items="${filterList}" var="filter">
								<c:if test="${ filter.key == 'anno' }">
									<td
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${cand.anno}</td>
								</c:if>
								<c:if test="${ filter.key == 'telefono' }">
									<td
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${cand.telefono}</td>
								</c:if>
								<c:if test="${ filter.key == 'email' }">
									<td
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${cand.email}</td>
								</c:if>
								<c:if test="${ filter.key == 'seniority' }">
									<td
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${cand.seniority.seniority}</td>
								</c:if>
								<c:if test="${ filter.key == 'provenienza' }">
									<td
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${cand.provenienza}</td>
								</c:if>
								<c:if test="${ filter.key == 'area' }">
									<td><c:forEach var="area" items="${cand.area}">
											<div
												onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
												${area.area}</div>
										</c:forEach></td>
								</c:if>
								<c:if test="${ filter.key == 'mansione' }">
									<td><c:forEach var="mansione" items="${cand.mansione}">
											<div
												onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
												${mansione.mansione}</div>
										</c:forEach></td>

								</c:if>
								<c:if test="${ filter.key == 'specializzazione' }">
									<td
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										<c:forEach var="specializzazione"
											items="${cand.candidatoSpecializzazione}">
											<div>${specializzazione.specializzazione.specializzazione}
												&nbsp ${specializzazione.anni} anni esperienza</div>
										</c:forEach>
									</td>
								</c:if>
								<c:if test="${fn:contains( filter.key, 'data') }">
									<td
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${cand.inserimentoAzienda}</td>
								</c:if>
								<c:if test="${fn:contains( filter.key, 'costo') }">
									<td
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${cand.costo.orario} &#8364; /H</td>
								</c:if>
							</c:forEach>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script type="text/javascript">

	areaCnt = 0;
	mansioneCnt = 0;
	specializzazioneCnt = 0;

function controlloMappa() {
	  var inputFormArray = document.getElementsByTagName("input");
	  
	  for (var i = 0; i < inputFormArray.length; i++) {
		  if (inputFormArray[i].value===""){
			  	inputFormArray[i].name="";
		  }
	}
	  if (document.getElementById("selectSeniority").value === ""){
		  document.getElementById("selectSeniority").name="" 
	  }
	  if (document.getElementById("selectBusiness").value === ""){
		  document.getElementById("selectBusiness").name="" 
	  }
	  if (document.getElementById("categoriaProtettaSelect").value === ""){
		  document.getElementById("categoriaProtettaSelect").name="" 
	  }
	
}
	// STAMPA AREA
	function stampaAreaCompetenzaSelezionata(areaCompetenzaList) {
	
				for(area of buildString(areaCompetenzaList)){
			if(document.getElementById("areaCompetenzaInput").value === area){
				var tagInput = document.createElement("input");
				tagInput.value = document.getElementById("areaCompetenzaInput").value;
				
				areaName = "area" + areaCnt;
				areaCnt++;
				
				tagInput.name = areaName;
				tagInput.readOnly = true;
				
				document.getElementById("areaCompetenzaDiv").appendChild(tagInput);
				document.getElementById("areaCompetenzaInput").value = "";
				document.getElementById("areaCompetenzaInput").focus();
				return;
			}	
		}
		alert("Area competenza scelta non esistente");
		
		
		

	}
	
 	// STAMPA MANSIONE
	function stampaMansioneSelezionata(mansioneList) {
		
		for(mansione of buildString(mansioneList)){
			if(document.getElementById("mansioneInput").value === mansione){
		
		var tagInput = document.createElement("input");
		tagInput.value = document.getElementById("mansioneInput").value;
		
		mansioneName = "mansione" + mansioneCnt;
		mansioneCnt++;
		
		tagInput.name = mansioneName;
		tagInput.readOnly = true;
		
		document.getElementById("mansioneDiv").appendChild(tagInput);
		document.getElementById("mansioneInput").value = "";
		document.getElementById("mansioneInput").focus();
		return;
			}
		}
		alert("Mansione scelta non esistente");
	}
	
	// STAMPA SPECIALIZZAZIONE
	function stampaSpecializzazioneSelezionata(specializzazioneList) {
		
		for(specializzazione of buildString(specializzazioneList)){
			if(document.getElementById("specializzazioneInput").value === specializzazione){
				
			
				var tagInput = document.createElement("input");
				tagInput.value = document.getElementById("specializzazioneInput").value;// + " " + document.getElementById("anniEsperienzaInput").value;

				specializzazioneName = "specializzazione" + specializzazioneCnt;
				specializzazioneCnt++;
				
				tagInput.name = specializzazioneName;
				tagInput.readOnly = true;
				
				document.getElementById("specializzazioneDiv").appendChild(tagInput);
				document.getElementById("specializzazioneInput").value = "";
				document.getElementById("specializzazioneInput").focus();
				return;
			}
		}
		alert("Specializzazione scelta non esistente");
		
	}


	function buildString(string) {
		return string.replace("[", "").replace("]", "").split(", ");
	}




		function aggiungiNome() {

			nome = document.getElementById("inputNome").value;
			document.getElementById("aggiuntaNome").innerHTML = nome;
		}
	
	$(document).ready(function () { $("#exportButton").click(function(){
	$("#risultatiTable").table2excel({ exclude: ".noExport", filename:
	"Risultati.xls" }); }); });

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