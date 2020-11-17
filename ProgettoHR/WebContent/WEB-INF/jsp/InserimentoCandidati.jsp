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

<title>Inserimento candidato</title>

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
	background-image: url("/ProgettoHR/img/Home1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
	transition: background-color .5s;
}

header {
	height: 100%;
	transition: margin-left .5s;
}

.form-inserimento-candidato {
	border-radius: 20px;
	padding: 50px;
	background-color: white;
	box-shadow: 10px 15px #d3d3d3;
}

h4 {
	letter-spacing: 5px;
}

p {
	color: #004fff;
	letter-spacing: 3px;
}

label {
	letter-spacing: 3px;
}

img {
	height: 55px;
}

.custom-input {
	border: 1px solid #d3d3d3;
	border-radius: 15px;
	box-shadow: none !important;
	outline: 0;
}

.custom-select {
	border: 1px solid #d3d3d3;
	border-radius: 15px 15px 0px 0px;
	box-shadow: none !important;
	outline: 0;
}

.custom-input:focus, .custom-select:focus {
	border: 1px solid #004fff;
}

#btn-nav {
	border: 1px solid white;
	border-radius: 5px;
	height: 45px;
	background-color: white;
}

#btn-logout, #btn-home, #btn-menu {
	border-radius: 5px;
	color: black;
	outline: 0;
	transition: 0.5s;
	color: black;
}

#btn-logout:hover, #btn-home:hover, #btn-menu:hover {
	box-shadow: 1px 1px 2px black;
	transition: 0.5s;
	color: black;
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
	box-shadow: none !important;
	outline: 0;
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

.btn-salva-candidato {
	border: 1px solid #004fff;
	color: #004fff;
	padding: 5px 30px;
	letter-spacing: 5px;
	transition: 0.5s;
	border-radius: 20px;
}

.btn-salva-candidato:hover {
	border: 1px solid #004fff;
	background: #004fff;
	color: white;
	transition: 0.5s;
}

.m-content-aggiungi {
	background-color: transparent;
	border: none;
}

.m-content-aggiungi {
	background-color: transparent;
	border: none;
}

.m-header-aggiungi {
	background-color: white;
	border-radius: 20px 20px 0px 0px;
}

.m-body-aggiungi {
	padding: 20px;
	margin-top: 2px;
	border: 1px solid #d3d3d3;
	border-radius: 0px 0px 20px 20px;
	border: 1px solid #d3d3d3;
	border-radius: 0px 0px 20px 20px;
	background-color: white;
}

.m-input {
	border: 1px solid black;
	border-radius: 20px;
	box-shadow: none !important;
	outline: 0;
	transition: 0.5s;
}

.m-input:focus {
	border: 1px solid #00b894;
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

.btn-salva {
	border: 1px solid white;
	border-radius: 20px;
	background: white;
	color: black;
	transition: 0.5s;
	box-shadow: none !important;
	outline: 0;
}

.m-errore-body {
	letter-spacing: 5px;
	border: 1px solid white;
	border-radius: 20px;
	background: white;
	color: red;
}
</style>

</head>

<body onload="impostaAnno()">
	<header id="header">
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<div class="row w-100">
					<div id="btn-nav" class="d-flex flex-row">
						<div class="col-auto align-self-center">
							<button onclick="openMenu()" class="btn" id="btn-menu">
								<i class="fas fa-bars"></i>
							</button>
						</div>
						<!-- SIDEBAR MENU -->
						<div id="sidebar">

							<a href="javascript:void(0)" id="btn-menu-close"
								onclick="closeMenu()">&times;</a>

							<ul class="list-unstyled components">
								<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
									<c:if test="${funz.funzionalita == 'aggiunta mansione'}">
										<li><a href="" data-toggle="modal" class="btn"
											data-target="#aggiungiMansione" type="button">+ Nuova
												mansione</a></li>
										<hr>
									</c:if>

									<c:if test="${funz.funzionalita == 'aggiunta area'}">
										<li><a href="" data-toggle="modal" class="btn"
											data-target="#aggiungiAreaCompetenza" type="button">+
												Nuova area di competenza</a></li>
										<hr>
									</c:if>

									<c:if
										test="${funz.funzionalita == 'aggiunta specializzazione'}">
										<li><a href="" data-toggle="modal" class="btn"
											data-target="#aggiungiSpecializzazione" type="button">+
												Nuova specializzazione</a></li>
										<hr>
									</c:if>
								</c:forEach>
							</ul>

						</div>
						<div class="col-auto align-self-center">
							<button class="btn"
								onclick="location.href = '/ProgettoHR/Home/${businessUnit}';"
								id="btn-home">
								<i class="fas fa-home"></i>
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
			<div class="row">
				<div class="col mb-5 mt-5">
					<form:form class="form-inserimento-candidato" autocomplete="off"
						method="POST" onsubmit="return validateForm()"
						modelAttribute="candidato"
						action="/ProgettoHR/CandidatiSave/${businessUnit}">

						<div class="form-group">
							<img src="/ProgettoHR/img/Logo Erre.png" class="pr-3">
							<h4 class="text-center">Inserimento candidato</h4>
							<p class="text-center">Compila i campi presenti nel form per
								aggiungere un nuovo candidato.</p>
							<hr>
						</div>

						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label>Nome :</label>
									<form:input path="nome" type="text"
										class="form-control custom-input" id="nome"
										required="required"></form:input>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label>Cognome :</label>
									<form:input type="text" path="cognome"
										class="form-control custom-input" id="cognome"
										required="required"></form:input>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label>Data di nascita : </label> <input type="date"
										pattern="yyyy-MM-dd" name="dataDiNascita"
										class="form-control custom-input" id="data-nascita"></input>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label>Telefono :</label>
									<form:input type="text" path="telefono"
										class="form-control custom-input" id="telefono" maxlength="10"
										required="required" placeholder="123-456-7890"></form:input>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label>Residenza:</label>
									<form:input type="text" path="residenza" size="30"
										class="form-control custom-input" id="residenza"
										required="required"></form:input>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label>Domicilio:</label>
									<form:input type="text" path="domicilio" size="30"
										class="form-control custom-input" id="domicilio"
										required="required"></form:input>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label>E-mail:</label>
									<form:input type="email" path="email" size="30"
										class="form-control custom-input" id="email"
										required="required"></form:input>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label>Provenienza candidatura:</label>
									<form:input type="text" path="provenienza"
										class="form-control custom-input" id="provenienza"
										name="provenienza"></form:input>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>Codice fiscale:</label>
							<form:input type="text" path="codiceFiscale" maxlength="16"
								class="form-control custom-input" id="codiceFiscale"></form:input>
						</div>

						<div class="form-row">
							<div class="col">
								<div class="form-group">
									<label>Seniority:</label>
									<form:select path="seniority.seniority" class="custom-select">

										<c:forEach var="sen" items="${seniorityList}">
											<option value="${sen.seniority}">${sen.seniority}</option>
										</c:forEach>
									</form:select>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label>Business unit:</label>
									<form:select path="business.business" class="custom-select">
										<c:forEach var="bus" items="${businessList}">
											<option value="${bus.business}">${bus.business}</option>
										</c:forEach>
									</form:select>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>Area competenza:</label>
							<div id="areeCompetenzaDiv">
								<div class="form-row mb-2">
									<div class="col-11">
										<input autocomplete="off" placeholder="Inserisci"
											list="areeCompetenzeDisponibili" id="areaCompetenzaInput"
											class="form-control custom-input">
										<datalist id="areeCompetenzeDisponibili">
											<c:forEach var="area" items="${areaCompetenzaList}">
												<option value="${area}"></option>
											</c:forEach>
										</datalist>
									</div>

									<div class="col-1">
										<div
											onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
											class="btn btn-block">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>Mansione:</label>
							<div id="mansioneDiv">
								<div class="form-row mb-2">

									<div class="col-11">
										<input autocomplete="off" placeholder="Inserisci"
											list="mansioniDisponibili" id="mansioneInput"
											class="form-control custom-input">
										<datalist id="mansioniDisponibili">
											<c:forEach var="mans" items="${mansioneList}">
												<option value="${mans}"></option>
											</c:forEach>
										</datalist>
									</div>

									<div class="col-1">
										<div onclick="stampaMansioneSelezionata('${mansioneList}')"
											class="btn btn-block">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label>Specializzazione:</label>
							<div id="specializzazioneDiv">
								<div class="form-row mb-2">

									<div class="col-6">
										<input autocomplete="off" placeholder="Inserisci"
											list="specializzazioniDisponibili" id="specializzazioneInput"
											class="form-control custom-input">
										<datalist id="specializzazioniDisponibili">
											<c:forEach var="specializzazione"
												items="${specializzazioneList}">
												<option value="${specializzazione}"></option>
											</c:forEach>
										</datalist>
									</div>

									<div class="col-5">
										<input id="anniEsperienzaInput"
											class="form-control custom-input" type="number"
											placeholder="anni esperienza">
									</div>

									<div class="col-1">
										<div
											onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
											class="btn btn-block">
											<i class="fas fa-plus"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="custom-control custom-switch">
								<form:checkbox path="categoriaProtetta"
									class="custom-control-input" id="customSwitch1"
									name="categoriaProtetta"></form:checkbox>
								<label class="custom-control-label" for="customSwitch1">Categoria
									protetta</label>
							</div>
						</div>

						<hr>

						<div class="form-group">
							<button type="submit" class="btn btn-salva-candidato">Salva</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</header>

	<!-- === MODAL AGGIUNTA MANSIONE === -->
	<div class="modal fade" id="aggiungiMansione" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiMansione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content m-content-aggiungi">

				<div class="modal-header m-header-aggiungi">
					<span class="modal-title">Inserisci una <span
						style="color: #004fff;">mansione</span>:
					</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form modelAttribute="mansione" id="formMansione" method="POST"
					action="/ProgettoHR/MansioniSaveDaInserimentoCandidato/${businessUnit}"
					onsubmit="return validateMansione('Mansione', '${mansioneList}');">
					<div class="modal-body m-body-aggiungi">
						<div class="container-fluid">
							<div class="row">
								<div class="col-10">
									<form:input path="mansione" type="text"
										class="form-control m-input-aggiungi" id="mansione"
										name="mansione" autocomplete="off"></form:input>
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

	<!-- === MODAL AGGIUNTA AREA COMPETENZA === -->
	<div class="modal fade" id="aggiungiAreaCompetenza" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiAreaCompetenza"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content m-content-aggiungi">

				<div class="modal-header m-header-aggiungi">
					<span class="modal-title">Inserisci <span
						style="color: #004fff;">un' area di competenza</span>:
					</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form modelAttribute="areaCompetenza" id="formAreaCompetenza"
					method="POST"
					action="/ProgettoHR/AreaCompetenzaSaveDaInserimentoCandidato/${businessUnit}"
					onsubmit="return validateArea('Area di competenza', '${areaCompetenzaList}');">
					<div class="modal-body m-body-aggiungi">
						<div class="container-fluid">
							<div class="row">
								<div class="col-10">
									<form:input path="area" type="text"
										class="form-control m-input" id="area" autocomplete="off"></form:input>
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

	<!-- === MODAL AGGIUNTA SPECIALIZZAZOINE === -->
	<div class="modal fade" id="aggiungiSpecializzazione" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiSpecializzazione"
		aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered" role="document">
			<div class="modal-content m-content-aggiungi">

				<div class="modal-header m-header-aggiungi">
					<span class="modal-title">Inserisci una <span
						style="color: #004fff;">specializzazione</span>:
					</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form modelAttribute="specializzazione"
					id="formSpecializzazione" method="POST"
					action="/ProgettoHR/SpecializzazioneSaveDaInserimentoCandidato/${businessUnit}"
					onsubmit="return validateSpecializzazione('Specializzazione', '${specializzazioneList}');">
					<div class="modal-body m-body-aggiungi">
						<div class="container-fluid">
							<div class="row">
								<div class="col-10">
									<form:input path="specializzazione" type="text"
										class="form-control m-input" id="specializzazione"
										autocomplete="off"></form:input>
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

	<!-- MODAL ERRORE -->
	<div class="modal fade" id="errore" tabindex="-1" role="dialog"
		aria-labelledby="modalErrore" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content m-content">
				<div class="modal-body m-errore-body text-center" id="m-errore-text"></div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		//areaCnt = 0;
		//mansioneCnt = 0;
		//specializzazioneCnt = 0;
		
		function impostaAnno(){
			document.getElementById("anno").value = "";
		}
		

		function stampaAreaCompetenzaSelezionata(areaCompetenzaList) {
			var areeCompetenzaEsistenti = document.getElementById("areeCompetenzaDiv").children;
			if(areeCompetenzaEsistenti.length > 1){   
				for(var i=1; i<areeCompetenzaEsistenti.length; i++){    
					var input = areeCompetenzaEsistenti[i].children[0].children[0];
					if(input.value === document.getElementById("areaCompetenzaInput").value){  
						$('#errore').modal('toggle');   
						document.getElementById("m-errore-text").innerHTML = "Valore già inserito";  
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
						ColDiv1.classList.add("col-11");
					var ColDiv2 = document.createElement("div");
						ColDiv2.classList.add("col-1");
					
					//areaName = "area" + areaCnt;
					//areaCnt++;
					
					//tagInput.id = areaName;
					tagInput.name = "areaCompetenza";
					tagInput.readOnly = true;
					
					tagDivButton.classList.add("btn");
					tagDivButton.classList.add("btn-block");
					tagDivButton.style.margin = "0px 0px 8px 0px";
					tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
					
					tagDivButton.onclick = function(){				              	              	          				
						tagDiv.remove();
					};
					
					ColDiv1.appendChild(tagInput)
					tagDiv.appendChild(ColDiv1);
					ColDiv2.appendChild(tagDivButton)
					tagDiv.appendChild(ColDiv2);
					
					document.getElementById("areeCompetenzaDiv").appendChild(tagDiv);
					document.getElementById("areaCompetenzaInput").value = "";
					document.getElementById("areaCompetenzaInput").focus();
					return;
				}	
			}
			$('#errore').modal('toggle');
			document.getElementById("m-errore-text").innerHTML = "L'area di competenza inserita non è esistente."
			
		}
		
		

		function stampaMansioneSelezionata(mansioneList) {
			var mansioniEsistenti = document.getElementById("mansioneDiv").children;
			if(mansioniEsistenti.length > 1){   
				for(var i=1; i<mansioniEsistenti.length; i++){    
					var input = mansioniEsistenti[i].children[0].children[0];
					if(input.value === document.getElementById("mansioneInput").value){  
						$('#errore').modal('toggle');   
						document.getElementById("m-errore-text").innerHTML = "Valore già inserito.";  
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
						ColDiv1.classList.add("col-11");
					var ColDiv2 = document.createElement("div");
						ColDiv2.classList.add("col-1");
			
			//mansioneName = "mansione" + mansioneCnt;
			//mansioneCnt++;
			
			//tagInput.id = mansioneName;
			tagInput.name = "mansioni";
			tagInput.readOnly = true;
			
			tagDivButton.classList.add("btn");
			tagDivButton.classList.add("btn-block");
			tagDivButton.style.margin = "0px 0px 8px 0px";
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
			$('#errore').modal('toggle');
			document.getElementById("m-errore-text").innerHTML = "La mansione inserita non è esistente."
		}
		
		
		function stampaSpecializzazioneSelezionata(specializzazioneList) {
			var specializzazioniEsistenti = document.getElementById("specializzazioneDiv").children;
			if(specializzazioniEsistenti.length > 1){   
				for(var i=1; i<specializzazioniEsistenti.length; i++){    
					var input = specializzazioniEsistenti[i].children[0].children[0];
					input = input.value;
					input = input.split(" ");
					if(input[0] === document.getElementById("specializzazioneInput").value){  
						$('#errore').modal('toggle');   
						document.getElementById("m-errore-text").innerHTML = "Valore già inserito.";  
						return;              
              		}           
				} 			
			}
			
			if(document.getElementById("anniEsperienzaInput").value < 0){
				$('#errore').modal('toggle');   
				document.getElementById("m-errore-text").innerHTML = "Gli anni di esperienza non possono essere meno di zero.";  
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
						ColDiv1.classList.add("col-11");
					var ColDiv2 = document.createElement("div");
						ColDiv2.classList.add("col-1");

					//specializzazioneName = "specializzazione" + specializzazioneCnt;
					//specializzazioneCnt++;
					
					//tagInput.id = specializzazioneName;
					tagInput.name = "specializzazione";
					tagInput.readOnly = true;
					
					tagDivButton.classList.add("btn");
					tagDivButton.classList.add("btn-block");
					tagDivButton.style.margin = "0px 0px 8px 0px";
					tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
					
					tagDivButton.onclick = function(){				              	              	          				
						tagDiv.remove();
						specializzazioneCnt--;
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
			$('#errore').modal('toggle');
			document.getElementById("m-errore-text").innerHTML = "La specializzazione inserita non è esistente."
			
		}


		function buildString(string) {
			return string.replace("[", "").replace("]", "").split(", ");
		}

		
		function validateForm(){
			
			
			if(document.getElementById("telefono").value.length != 10 || isNaN(document.getElementById("telefono").value)){
				$('#errore').modal('toggle');
				document.getElementById("m-errore-text").innerHTML = "Il numero di telefono deve essere composto da 10 cifre."
				return false;
			}
			
			if(document.getElementById("codiceFiscale").value != "" && document.getElementById("codiceFiscale").value.length != 16){
				$('#errore').modal('toggle');
				document.getElementById("m-errore-text").innerHTML = "Il codice fiscale deve essere composto da 16 lettere/cifre."
				return false;
			}
			
			if(document.getElementById("nome").value == "" || document.getElementById("cognome").value == "" || document.getElementById("telefono").value == "" || document.getElementById("email").value == "" || document.getElementById("data-nascita".value == "")){
				return false;
			} else {
				if(!validateEmail()){
					return false
				}
			}
		
			return true;
			}
		
		function validateEmail(){
			var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
			if(document.getElementById("email").value.match(mailformat))
			 {
			    return true
			 }
			$('#errore').modal('toggle');
			document.getElementById("m-errore-text").innerHTML = "L'e-mail non è inserita in modo corretto."
			return false
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
		function insertionMessage(tipo, id, lista){
			lista = buildString(lista);
			if(lista.indexOf(document.getElementById(id).value) !== -1){
				$('#errore').modal('toggle');   
				document.getElementById("m-errore-text").innerHTML = tipo + " già inserita.";  
				return false;
			}
			
			return true;
		}
		function openMenu() {
			  document.getElementById("sidebar").style.width = "500px";
			  document.getElementById("header").style.marginLeft = "250px";
			  document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
			}

		function closeMenu() {	
			  document.getElementById("sidebar").style.width = "0";			 
			  document.getElementById("header").style.marginLeft = "0";
			  
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
