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
	background-image: url("/ProgettoHR/img/Home1.jpg");
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
	font-size: 20px;
}

.form-filtro {
	background: white;
	padding: 20px;
	border-radius: 5px;
	margin-bottom: 20px;
	margin-top: 20px;
}

.f-input {
	border-radius: 20px;
	box-shadow: none !important;
	outline: 0;
}

.f-input:focus {
	border: 1px solid #004fff;
}

.custom-select {
	border-radius: 5px 5px 0px 0px;
	box-shadow: none !important;
	outline: 0;
}

.btn-salva {
	border-radius: 20px;
	color: white;
	transition: 0.5s;
	box-shadow: 1px 1px 2px #00b894;
	background: #00b894;
	outline: 0;
	letter-spacing: 3px;
}

.btn-salva:hover {
	color: white;
}

#btn-nav {
	border: 1px solid white;
	border-radius: 5px;
	height: 45px;
	background-color: white;
}

#btn-logout, #btn-home {
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
/* Pallini dello stato del candidato*/
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
	margin-top: 5px;
}

#zeroRecord {
	text-align: center;
}
/* Tabella risultati */
.tabellaFiltri {
	width: 100%;
	font-size: 0.9em;
	border-radius: 5px;
	overflow: hidden;
	border-collapse: collapse;
}

.tabellaFiltri .head {
	background-color: whitesmoke;
	color: black;
	text-align: center;
	letter-spacing: 5px;
	border-bottom: 2px solid black;
}

.tabellaFiltri .body tr {
	text-align: center;
	border-bottom: 1px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaFiltri .body {
	background-color: white;
}

.tabellaFiltri th {
	padding: 10px;
}

.tabellaFiltri td {
	font-size: 14px;
	padding: 4px;
}

.tabellaFiltri .footer {
	background-color: whitesmoke;
}

.btn-elimina {
	transition: 0.5s;
}

.btn-elimina:hover {
	box-shadow: 1px 1px 2px #d63031;
	color: #d63031;
	border-radius: 5px;
	transition: 0.5s;
}

.btn-visualizza {
	background: #74b9ff;
	color: white;
	border-radius: 5px;
	transition: 0.5s;
}

.btn-visualizza:hover {
	color: white;
	background: #0984e3;
	transition: 0.5s;
}

.m-content {
	background-color: transparent;
	border: none;
}

.m-header {
	background-color: white;
	border-radius: 20px 20px 0px 0px;
}

.m-body {
	padding: 20px;
	margin-top: 2px;
	border: 1px solid #d3d3d3;
	background-color: white;
	color: black;
}

.m-footer {
	margin-top: 2px;
	border-radius: 0px 0px 20px 20px;
	background-color: white;
}
.btn-si {
	border: 1px solid #00b894;
	background: #00b894;
	border-radius: 15px;
	box-shadow: none !important;
	outline: 0;
	color: white;
}

.btn-si:hover {
	color: white;
}

.btn-no {
	color: #d63031;
	transition: 0.5s;
	border-radius: 15px;
}

.btn-no:hover{
	box-shadow: 1px 1px 2px #ff7675;
	transition: 0.5s;
	color: #d63031;
}
</style>

</head>
<body>
	<header>
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
							<button onclick="location.href = '/ProgettoHR/Logout';"
								class="btn float-right" id="btn-logout">
								<i class="fas fa-sign-out-alt"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3 col-sm-12">
					<form autocomplete="off" method="POST"
						action="/ProgettoHR/Filter/advanced/${businessUnit}"
						onsubmit="return controlloMappa()" class="form-filtro">

						<div class="form-group">
							<span style="color: #004fff;">Filtra </span><span> per i
								seguenti campi</span>:
						</div>

						<div class="form-group">
							<label for="nome">Nome:</label> <input id="nome" name="nome"
								type="text" class="form-control f-input">
						</div>

						<div class="form-group">
							<label>Cognome:</label> <input id="cognome" name="cognome"
								type="text" class="form-control f-input">
						</div>

						<div class="form-group">
							<label>Data di nascita:</label> <input type="date" id="anno" maxlength="4"
								name="anno" class="form-control f-input">
						</div>

						<div class="form-group">
							<label>Telefono:</label> <input id="telefono" name="telefono"
								class="form-control f-input" type="text"
								placeholder="123-456-7890">
						</div>

						<div class="form-group">
							<label>E-mail:</label> <input id="email" name="email"
								class="form-control f-input" type="text">
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
								name="provenienza" class="form-control  f-input" type="text">
						</div>

						<div class="form-group">
							<div id="areaCompetenzaDiv">
								<label>Area di competenza:</label>
								<div class="form-row">
									<div class="col-11">
										<input autocomplete="off" placeholder="aggiungi"
											list="areeCompetenzeDisponibili" id="areaCompetenzaInput"
											class="form-control  f-input">
										<datalist id="areeCompetenzeDisponibili">
											<c:forEach var="area" items="${areaCompetenzaList}">
												<option value="${area}"></option>
											</c:forEach>
										</datalist>
									</div>
									<div class="col-1">
										<div
											onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
											class="btn p-0 mt-1">
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
									<div class="col-11">
										<input autocomplete="off" placeholder="aggiungi"
											list="mansioniDisponibili" id="mansioneInput"
											class="form-control f-input">
										<datalist id="mansioniDisponibili">
											<c:forEach var="mans" items="${mansioneList}">
												<option value="${mans}"></option>
											</c:forEach>
										</datalist>
									</div>
									<div class="col-1">
										<div onclick="stampaMansioneSelezionata('${mansioneList}')"
											class="btn p-0 mt-1">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div id="lingueDiv">
								<label>Competenze Linguistiche</label>
								<div class="form-row">
									<div class="col-11">
										<input autocomplete="off" placeholder="aggiungi"
											list="lingueDisponibili" id="linguaInput"
											class="form-control f-input">
										<datalist id="lingueDisponibili">
											<c:forEach var="lingua" items="${lingueList}">
												<option value="${lingua}"></option>
											</c:forEach>
										</datalist>
									</div>
									<div class="col-1">
										<div onclick="stampaLinguaSelezionata('${lingueList}')"
											class="btn p-0 mt-1">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div id="titoloStudioDiv">
								<label>Titolo di Studio</label>
								<div class="form-row">
									<div class="col-11">
										<input autocomplete="off" placeholder="aggiungi"
											list="titoliStudioDisponibili" id="titoloStudioInput"
											class="form-control f-input">
										<datalist id="titoliStudioDisponibili">
											<c:forEach var="titoloStudio" items="${titoloStudioList}">
												<option value="${titoloStudio}"></option>
											</c:forEach>
										</datalist>
									</div>
									<div class="col-1">
										<div
											onclick="stampaTitoloStudioSelezionata('${titoloStudioList}')"
											class="btn p-0 mt-1">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div id="specializzazioneDiv">
								<label>Specializzazione & anni di esperienza</label>
								<div class="form-row">
									<div class="col-7">
										<input autocomplete="off" placeholder="aggiungi"
											list="specializzazioniDisponibili" id="specializzazioneInput"
											class="form-control f-input">
										<datalist id="specializzazioniDisponibili">
											<c:forEach var="specializzazione"
												items="${specializzazioneList}">
												<option value="${specializzazione}"></option>
											</c:forEach>
										</datalist>
									</div>

									<div class="col-4">
										<!-- <label>Anni di esperienza</label> -->
										<input id="anniEsperienzaInput"
											class="text-left form-control f-input" type="number"
											placeholder="nn" maxlength="2" min="0" max="99">
									</div>
									<div class="col-1 ">
										<div
											onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
											class="btn p-0 mt-1">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>Costo unitario all'ora</label> da <input
								id="costoMinInput" name="costoMin" class="form-control f-input"
								type="text" placeholder="costo minimo"> A<input
								id="costoMaxInput" name="costoMax" class="form-control  f-input"
								type="text" placeholder="costo massimo">
						</div>

						<div class="form-group">
							<div id="specializzazioneDiv">

								Dal <input type="date" id="dataInserimentoInputFrom"
									name="dataInserimentoFrom" class="form-control f-input">
								Al <input type="date" id="dataInserimentoInputTo"
									name="dataInserimentoTo" class="form-control f-input">

							</div>
						</div>

						<div class="form-group">
							<div class="custom-control custom-switch">
								<input type="checkbox" class="custom-control-input"
									id="categoriaProtettaSelect" name="categoriaProtetta"></input>
								<label class="custom-control-label"
									for="categoriaProtettaSelect">Categoria protetta</label>
							</div>
						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-salva btn-block">Salva</button>
						</div>
					</form>
				</div>

				<div class="col-md-9 col-sm-12">
					<c:choose>
						<c:when test="${empty list}">
							<h2 id="zeroRecord">La ricerca non ha prodotto alcun
								risultato</h2>
						</c:when>
						<c:otherwise>
							<button type="button" id="exportButton"
								class="btn mb-2 mt-4 btn-salva">Esporta Risultati</button>

							<div class="table-responsive">
								<table id="risultatiTable" class="tabellaFiltri">
									<!-- Testa della tabella -->
									<thead class="head">
										<tr>
											<th class="noExport" scope="col">Stato</th>
											<th scope="col">Business unit</th>
											<th scope="col">Nome</th>
											<th scope="col">Cognome</th>
											<c:forEach items="${filterList}" var="filter">
												<c:if test="${ filter.key == 'dataNascita' }">
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
												<c:if test="${fn:contains( filter.key, 'area0') }">
													<th scope="col">Area Competenza</th>
												</c:if>
												<c:if test="${fn:contains( filter.key, 'mansione0') }">
													<th scope="col">Mansione</th>
												</c:if>
												<c:if
													test="${fn:contains( filter.key, 'specializzazione0') }">
													<th scope="col">Specializzazione</th>
												</c:if>
												<c:if test="${fn:contains( filter.key, 'data') }">
													<th scope="col">Inserimento Azienda</th>
												</c:if>
												<c:if test="${fn:contains( filter.key, 'costo') }">
													<th scope="col">Costo Orario</th>
												</c:if>
											</c:forEach>
											<th scope="col"></th>
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
												<c:forEach items="${filterList}" var="filter">
													<c:if test="${ filter.key == 'dataNascita' }">
														<td>${cand.anno}</td>
													</c:if>
													<c:if test="${ filter.key == 'telefono' }">
														<td>${cand.telefono}</td>
													</c:if>
													<c:if test="${ filter.key == 'email' }">
														<td>${cand.email}</td>
													</c:if>
													<c:if test="${ filter.key == 'seniority' }">
														<td>${cand.seniority.seniority}</td>
													</c:if>
													<c:if test="${ filter.key == 'provenienza' }">
														<td>${cand.provenienza}</td>
													</c:if>
													<c:if test="${fn:contains( filter.key, 'area0') }">
														<td><c:forEach var="area" items="${cand.area}">
																<div>${area.area}</div>
															</c:forEach></td>
													</c:if>
													<c:if test="${fn:contains( filter.key, 'mansione0') }">
														<td><c:forEach var="mansione"
																items="${cand.mansione}">
																<div>${mansione.mansione}</div>
															</c:forEach></td>

													</c:if>
													<c:if
														test="${fn:contains( filter.key, 'specializzazione0') }">
														<td><c:forEach var="specializzazione"
																items="${cand.candidatoSpecializzazione}">
																<div>${specializzazione.specializzazione.specializzazione}
																	 ${specializzazione.anni} anni esperienza</div>
															</c:forEach></td>
													</c:if>
													<c:if test="${fn:contains( filter.key, 'data') }">
														<td>${cand.inserimentoAzienda}</td>
													</c:if>
													<c:if test="${fn:contains( filter.key, 'costo') }">
														<td>${cand.costo.orario}</td>
													</c:if>
												</c:forEach>
												<td>
													<button class="btn btn-visualizza"
														id="bottoneModificaCandidato"
														onclick="window.location = '/ProgettoHR/Candidato/${cand.business.business}/${cand.id}'">
														<i class="fas fa-user"></i>
													</button>
													<button class="btn btn-elimina"
														id="bottoneEliminaCandidato" data-toggle="modal"
														onclick="impostaParametriCandidatoId(${cand.id})"
														data-target="#eliminaCandidato">
														<i class="fas fa-trash"></i>

													</button>
												</td>
											</tr>

										</c:forEach>
									</tbody>
									<tfoot class="footer">
										<tr>
											<td colspan="9"></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</header>

	<!-- MODAL CANCELLA CANDIDATO -->
	<div class="modal fade" id="eliminaCandidato" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaCandidato"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content m-content">
				<form action="/ProgettoHR/Elimina/${businessUnit}" method="POST">

					<div class="modal-header m-header">
						<span class="modal-title">Cancella il <span
							style="color: #004fff;">candidato</span>:
						</span>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="btn-close-modal">&times;</span>
						</button>
					</div>

					<div class="modal-body m-body">
						Sei sicuro di voler cancellare il candidato selezionato? <input
							style="visibility: hidden;" name="idCandidato" id="candidatoId" />
					</div>

					<div class="modal-footer m-footer">
						<button type="button" class="btn btn-no" data-dismiss="modal">no</button>
						<button type="submit" class="btn btn-si">si</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal errore -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Errore</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="errorModalBody"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">

	areaCnt = 0;
	mansioneCnt = 0;
	linguaCnt = 0;
	titoloStudioCnt = 0;
	specializzazioneCnt = 0;
	
	function impostaParametriCandidatoId(id) {
		document.getElementById("candidatoId").value = id;

	}

function controlloMappa() {
	  var inputFormArray = document.getElementsByTagName("input");
	  
	  for (var i = 0; i < inputFormArray.length; i++) {
		  if (inputFormArray[i].value===""){
			  	inputFormArray[i].name="";
		  }
	}
	  if(isNaN(document.getElementById("costoMinInput").value) || isNaN(document.getElementById("costoMaxInput").value)){
		  $('#errorModal').modal('toggle');   
			document.getElementById("errorModalBody").innerHTML = "Valore non numerico inserito nel filtro per costi.";  
			return false;  
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
		var areeCompetenzaEsistenti = document.getElementById("areaCompetenzaDiv").children;
		if(areeCompetenzaEsistenti.length > 2){   
			for(var i=2; i<areeCompetenzaEsistenti.length; i++){    
				var input = areeCompetenzaEsistenti[i].children[0].children[0];
				if(input.value === document.getElementById("areaCompetenzaInput").value){  
					$('#errorModal').modal('toggle');   
					document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
					return;              
          		}           
			} 			
		}
		
		for(area of buildString(areaCompetenzaList)){
			if(document.getElementById("areaCompetenzaInput").value === area){
				var tagDiv = document.createElement("div");		
				var tagInput = document.createElement("input");
				var tagDivButton = document.createElement("span");
				tagInput.value = document.getElementById("areaCompetenzaInput").value;
				
				tagInput.classList.add("form-control");
				
				tagDiv.classList.add("form-row");
				var ColDiv1 = document.createElement("div");
					ColDiv1.classList.add("col-10", "mt-2");
				var ColDiv2 = document.createElement("div");
					ColDiv2.classList.add("col-1");
				
				areaName = "area" + areaCnt;
				areaCnt++;
				
				
				
				//tagInput.id = areaName;
				tagInput.name = areaName;
				tagInput.readOnly = true;
				
				tagDivButton.classList.add("btn", "mt-2");
				tagDivButton.style.margin = "0px 0px 12px 0px";
				tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
				
				tagDivButton.onclick = function(){				              	              	          				
					tagDiv.remove();
				};
				
				ColDiv1.appendChild(tagInput)
				tagDiv.appendChild(ColDiv1);
				ColDiv2.appendChild(tagDivButton)
				tagDiv.appendChild(ColDiv2);
				
				document.getElementById("areaCompetenzaDiv").appendChild(tagDiv);
				document.getElementById("areaCompetenzaInput").value = "";
				document.getElementById("areaCompetenzaInput").focus();
				return;
			}	
		}
		$('#errorModal').modal('toggle');
		document.getElementById("errorModalBody").innerHTML = "Area inserita non esistente"
		
	}
	
	
 	// STAMPA MANSIONE
	function stampaMansioneSelezionata(mansioneList) {
		var mansioniEsistenti = document.getElementById("mansioneDiv").children;
		if(mansioniEsistenti.length > 2){   
			for(var i=2; i<mansioniEsistenti.length; i++){    
				var input = mansioniEsistenti[i].children[0].children[0];
				if(input.value === document.getElementById("mansioneInput").value){  
					$('#errorModal').modal('toggle');   
					document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
					return;              
          		}           
			} 			
		}
		
		for(mansione of buildString(mansioneList)){
			if(document.getElementById("mansioneInput").value === mansione){
		
				var tagDiv = document.createElement("div");		
				var tagInput = document.createElement("input");
				var tagDivButton = document.createElement("span");
				tagInput.value = document.getElementById("mansioneInput").value;
				
				tagInput.classList.add("form-control");
				
				tagDiv.classList.add("form-row");
				var ColDiv1 = document.createElement("div");
					ColDiv1.classList.add("col-10", "mt-2");
				var ColDiv2 = document.createElement("div");
					ColDiv2.classList.add("col-1");
		
		mansioneName = "mansione" + mansioneCnt;
		mansioneCnt++;
		
		//tagInput.id = mansioneName;
		tagInput.name = mansioneName;
		tagInput.readOnly = true;
		
		tagDivButton.classList.add("btn", "mt-2");
		tagDivButton.style.margin = "0px 0px 12px 0px";
		tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
		
		tagDivButton.onclick = function(){				              	              	          				
			tagDiv.remove();
		};
		
		ColDiv1.appendChild(tagInput)
		tagDiv.appendChild(ColDiv1);
		ColDiv2.appendChild(tagDivButton)
		tagDiv.appendChild(ColDiv2);
		
		document.getElementById("mansioneDiv").appendChild(tagDiv);
		document.getElementById("mansioneInput").value = "";
		document.getElementById("mansioneInput").focus();
		return;
			}
		}
		$('#errorModal').modal('toggle');
		document.getElementById("errorModalBody").innerHTML = "Mansione inserita non esistente"
	}
	
	// STAMPA Lingua
	function stampaLinguaSelezionata(linguaList) {
		var lingueEsistenti = document.getElementById("lingueDiv").children;
		if(lingueEsistenti.length > 2){   
			for(var i=2; i<lingueEsistenti.length; i++){    
				var input = lingueEsistenti[i].children[0].children[0];
				if(input.value === document.getElementById("linguaInput").value){  
					$('#errorModal').modal('toggle');   
					document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
					return;              
          		}           
			} 			
		}
		
		for(lingua of buildString(linguaList)){
			if(document.getElementById("linguaInput").value === lingua){
		
				var tagDiv = document.createElement("div");		
				var tagInput = document.createElement("input");
				var tagDivButton = document.createElement("span");
				tagInput.value = document.getElementById("linguaInput").value;
				
				tagInput.classList.add("form-control");
				
				tagDiv.classList.add("form-row");
				var ColDiv1 = document.createElement("div");
					ColDiv1.classList.add("col-10", "mt-2");
				var ColDiv2 = document.createElement("div");
					ColDiv2.classList.add("col-1");
		
		linguaName = "lingua" + linguaCnt;
		linguaCnt++;
		
		//tagInput.id = mansioneName;
		tagInput.name = linguaName;
		tagInput.readOnly = true;
		
		tagDivButton.classList.add("btn", "mt-2");
		tagDivButton.style.margin = "0px 0px 12px 0px";
		tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
		
		tagDivButton.onclick = function(){				              	              	          				
			tagDiv.remove();
		};
		
		ColDiv1.appendChild(tagInput)
		tagDiv.appendChild(ColDiv1);
		ColDiv2.appendChild(tagDivButton)
		tagDiv.appendChild(ColDiv2);
		
		document.getElementById("lingueDiv").appendChild(tagDiv);
		document.getElementById("linguaInput").value = "";
		document.getElementById("linguaInput").focus();
		return;
			}
		}
		$('#errorModal').modal('toggle');
		document.getElementById("errorModalBody").innerHTML = "Lingua inserita non esistente"
	}
	
	// STAMPA Titoli di studio
	function stampaTitoloStudioSelezionata(titoliStudioList) {
		var titoliDiStudioEsistenti = document.getElementById("titoloStudioDiv").children;
		if(titoliDiStudioEsistenti.length > 2){   
			for(var i=2; i<titoliDiStudioEsistenti.length; i++){    
				var input = titoliDiStudioEsistenti[i].children[0].children[0];
				if(input.value === document.getElementById("titoloStudioInput").value){  
					$('#errorModal').modal('toggle');   
					document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
					return;              
          		}           
			} 			
		}
		
		for(titoloStudio of buildString(titoliStudioList)){
			if(document.getElementById("titoloStudioInput").value === titoloStudio){
		
				var tagDiv = document.createElement("div");		
				var tagInput = document.createElement("input");
				var tagDivButton = document.createElement("span");
				tagInput.value = document.getElementById("titoloStudioInput").value;
				
				tagInput.classList.add("form-control");
				
				tagDiv.classList.add("form-row");
				var ColDiv1 = document.createElement("div");
					ColDiv1.classList.add("col-10", "mt-2");
				var ColDiv2 = document.createElement("div");
					ColDiv2.classList.add("col-1");
		
		titoloStudioName = "titoloStudio" + titoloStudioCnt;
		titoloStudioCnt++;
		
		//tagInput.id = mansioneName;
		tagInput.name = titoloStudioName;
		tagInput.readOnly = true;
		
		tagDivButton.classList.add("btn", "mt-2");
		tagDivButton.style.margin = "0px 0px 12px 0px";
		tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
		
		tagDivButton.onclick = function(){				              	              	          				
			tagDiv.remove();
		};
		
		ColDiv1.appendChild(tagInput)
		tagDiv.appendChild(ColDiv1);
		ColDiv2.appendChild(tagDivButton)
		tagDiv.appendChild(ColDiv2);
		
		document.getElementById("titoloStudioDiv").appendChild(tagDiv);
		document.getElementById("titoloStudioInput").value = "";
		document.getElementById("titoloStudioInput").focus();
		return;
			}
		}
		$('#errorModal').modal('toggle');
		document.getElementById("errorModalBody").innerHTML = "Titolo di studio inserito non esistente"
	}
 	
	// STAMPA SPECIALIZZAZIONE
	function stampaSpecializzazioneSelezionata(specializzazioneList) {
		var specializzazioniEsistenti = document.getElementById("specializzazioneDiv").children;
		if(specializzazioniEsistenti.length > 2){   
			for(var i=2; i<specializzazioniEsistenti.length; i++){    
				var input = specializzazioniEsistenti[i].children[0].children[0];
				input = input.value;
				input = input.split(" ");
				if(input[0] === document.getElementById("specializzazioneInput").value){  
					$('#errorModal').modal('toggle');   
					document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
					return;              
          		}           
			} 			
		}
		
		if(document.getElementById("anniEsperienzaInput").value < 0){
			$('#errorModal').modal('toggle');   
			document.getElementById("errorModalBody").innerHTML = "Gli anni di esperienza non possono essere meno di zero";  
			return; 
		}
		
		for(specializzazione of buildString(specializzazioneList)){
			if(document.getElementById("specializzazioneInput").value === specializzazione){
				
			
				var tagDiv = document.createElement("div");		
				var tagInput = document.createElement("input");
				var tagDivButton = document.createElement("span");
				tagInput.value = document.getElementById("specializzazioneInput").value + " " + document.getElementById("anniEsperienzaInput").value;
				
				tagInput.classList.add("form-control");
				
				tagDiv.classList.add("form-row");
				var ColDiv1 = document.createElement("div");
					ColDiv1.classList.add("col-10", "mt-2");
				var ColDiv2 = document.createElement("div");
					ColDiv2.classList.add("col-1");

				specializzazioneName = "specializzazione" + specializzazioneCnt;
				specializzazioneCnt++;
				
				//tagInput.id = specializzazioneName;
				tagInput.name = specializzazioneName;
				tagInput.readOnly = true;
				
				tagDivButton.classList.add("btn", "mt-2");
				
				tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
				
				tagDivButton.onclick = function(){				              	              	          				
					tagDiv.remove();
				};
				
				ColDiv1.appendChild(tagInput)
				tagDiv.appendChild(ColDiv1);
				ColDiv2.appendChild(tagDivButton)
				tagDiv.appendChild(ColDiv2);
				
				document.getElementById("specializzazioneDiv").appendChild(tagDiv);
				document.getElementById("specializzazioneInput").value = "";
				document.getElementById("anniEsperienzaInput").value = "";
				document.getElementById("specializzazioneInput").focus();
				return;
			}
		}
		$('#errorModal').modal('toggle');
		document.getElementById("errorModalBody").innerHTML = "Specializzazione inserita non esistente"
		
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