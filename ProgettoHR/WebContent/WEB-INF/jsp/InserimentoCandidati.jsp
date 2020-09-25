<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
	transition: 0.5s;
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

#iconaLogout {
	width: 25px;
	height: 48px;
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

@media screen and (max-width: 951px) {
	.responsiveSidebar {
		width: 100%;
		margin-bottom: 25px;
	}
	#sidebar {
		border-radius: 0px 0px 0px 0px;
	}
}
</style>

</head>

<body onload="impostaAnno()">
	<div class="container-fluid p-0">
		<!-- NAVBAR -->
		<nav class="navbar">

			<!-- LOGO -->
			<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
				<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
			</a>

			<div id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<form action="/ProgettoHR/Logout">
							<button type="submit" class="btn nav-link p-0">
								<i id="iconaLogout" class="fas fa-sign-out-alt"></i>
							</button>
						</form>
					</li>
				</ul>
			</div>
		</nav>

		<div class="row justify-content-start w-100 mt-4 mr-0 ml-0">
			<!-- COLONNA BOTTONI LATERALI -->
			<div class="col-auto responsiveSidebar p-0">
				<!-- BARRA LATERALE -->
				<nav id="sidebar">

					<div class="sidebar-header p-2 pt-4">
						<h3>Inserimento candidato</h3>
					</div>

					<ul class="list-unstyled components">
						<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
							<c:if test="${funz.funzionalita == 'aggiunta mansione'}">
								<li><a href="" data-toggle="modal"
									data-target="#mansioneModal" type="button"><i
										class="fas fa-plus"></i> Nuova mansione</a></li>
							</c:if>

							<c:if test="${funz.funzionalita == 'aggiunta area'}">
								<li><a href="" data-toggle="modal"
									data-target="#areaCompetenzaModal" type="button"><i
										class="fas fa-plus"></i> Nuova Area</a></li>
							</c:if>

							<c:if test="${funz.funzionalita == 'aggiunta specializzazione'}">
								<li><a href="" data-toggle="modal"
									data-target="#specializzazioneModal" type="button"><i
										class="fas fa-plus"></i> Nuova Specializzazione</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</nav>
			</div>

			<!-- COLONNA INSERIMENTO CANDIDATO -->
			<div class="col-auto">

				<form:form class="border rounded p-3" autocomplete="off"
					method="POST" onsubmit="return validateForm()"
					modelAttribute="candidato"
					action="/ProgettoHR/CandidatiSave/${businessUnit}">

					<h4 class="text-center">Nuovo candidato</h4>
					<p class="text-center">Compila i campi presenti per inserire un
						nuovo candidato</p>
					<hr class="my-4">

					<div class="form-row">

						<div class="form-group col-6">
							<label>Nome: </label>
							<form:input path="nome" type="text" class="form-control"
								id="nome" required="required"></form:input>
						</div>
						<div class="form-group col-6">
							<label>Cognome: </label>
							<form:input type="text" path="cognome" class="form-control"
								id="cognome" required="required"></form:input>
						</div>

					</div>

					<div class="form-row">

						<div class="form-group col-4">
							<label>Anno di nascita: </label>
							<form:input type="text" path="anno" class="form-control"
								placeholder="yyyy" id="anno"></form:input>
						</div>

						<div class="form-group col-8">
							<label>Telefono:</label>
							<form:input type="text" path="telefono" class="form-control"
								id="telefono" maxlength="10" required="required" placeholder="123-456-7890"></form:input>
						</div>
					</div>

					<div class="form-group">
						<label>E-mail:</label>
						<form:input type="email" path="email" size="30"
							class="form-control" id="email" required="required"></form:input>
					</div>

					<div class="form-group">
						<label>Codice fiscale:</label>
						<form:input type="text" path="codiceFiscale" maxlength="16"
							class="form-control" id="codiceFiscale"></form:input>
					</div>
					<div class="form-row">
						<div class="form-group col-6">
							<label>Seniority:</label>
							<form:select path="seniority.seniority" class="custom-select">

								<c:forEach var="sen" items="${seniorityList}">
									<option value="${sen.seniority}">${sen.seniority}</option>
								</c:forEach>
							</form:select>
						</div>

						<div class="form-group col-6">
							<label>Business unit:</label>
							<form:select path="business.business" class="custom-select">
								<c:forEach var="bus" items="${businessList}">
									<option value="${bus.business}">${bus.business}</option>
								</c:forEach>
							</form:select>
						</div>
					</div>

					<div class="form-group">
						<label>Provenienza candidatura:</label>
						<form:input type="text" path="provenienza" class="form-control"
							id="provenienza" name="provenienza"></form:input>
					</div>

					<div class="form-group mb-3">
						<label>Area competenza:</label>
						<div id="areeCompetenzaDiv">
							<div class="form-row">
								<div class="col-11">
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
										class="btn btn-block form-control">
										<i class="fas fa-plus"></i>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group mb-3">
						<label>Mansione:</label>
						<div id="mansioneDiv">
							<div class="form-row">
								<div class="col-11">
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
						<label>Specializzazione:</label>
						<div id="specializzazioneDiv">
							<div class="form-row">
								<div class="col-6">
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

								<div class="col-5">
									<input id="anniEsperienzaInput" class="text-left form-control"
										type="number" placeholder="anni esperienza">
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

					<div class="form-group mt-2">
						<div class="custom-control custom-switch">
							<form:checkbox path="categoriaProtetta"
								class="custom-control-input" id="customSwitch1"
								name="categoriaProtetta"></form:checkbox>
							<label class="custom-control-label" for="customSwitch1">Categoria
								protetta</label>
						</div>
					</div>

					<hr class="my-4">

					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block">Salva</button>
						<button type="reset" class="btn btn-danger btn-block">Cancella</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<!-- MODAL AGGIUNTA MANSIONE -->
	<div class="modal fade" id="mansioneModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Aggiungi
						Mansione</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="mansione" id="formMansione" method="POST"
					action="/ProgettoHR/MansioniSaveDaInserimentoCandidato/${businessUnit}"
					onsubmit="return validate();">
					<div class="modal-body">
						<form:input path="mansione" type="text" class="form-control"
							placeholder="Mansione" id="mansione" name="mansione"></form:input>
					</div>

					<div class="modal-footer">
						<button type="submit" id="bottone-salva-mansione"
							class="btn btn-success">Salva</button>
						<button type="reset" id="bottone-cancella-mansione"
							class="btn btn-danger">Cancella</button>
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
					<h5 class="modal-title" id="exampleModalLabel">Aggiunta Area
						Competenza</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="areaCompetenza" id="formAreaCompetenza"
					method="POST"
					action="/ProgettoHR/AreaCompetenzaSaveDaInserimentoCandidato/${businessUnit}"
					onsubmit="return validateArea();">
					<div class="modal-body">

						<form:input path="area" type="text" class="form-control"
							placeholder="Area di Competenza" id="area"></form:input>
					</div>

					<div class="modal-footer">
						<button type="submit" id="bottone-salva-area"
							class="btn btn-success">Salva</button>
						<button type="reset" id="bottone-cancella-area"
							class="btn btn-danger">Cancella</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<!-- MODAL AGGIUNTA SPECIALIZZAZOINE -->
	<div class="modal fade" id="specializzazioneModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Aggiunta
						Specializzazione</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="specializzazione"
					id="formSpecializzazione" method="POST"
					action="/ProgettoHR/SpecializzazioneSaveDaInserimentoCandidato/${businessUnit}"
					onsubmit="return validateSpecializzazione();">
					<div class="modal-body">

						<form:input path="specializzazione" type="text"
							class="form-control" placeholder="Specializzazione"
							id="specializzazione"></form:input>

					</div>

					<div class="modal-footer">
						<button type="submit" id="bottone-salva-specializzazione"
							class="btn btn-success">Salva</button>
						<button type="reset" id="bottone-cancella-specializzazione"
							class="btn btn-danger">Cancella</button>
					</div>

				</form:form>
			</div>
		</div>
	</div>

	<!-- MODAL ERRORE -->
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
						ColDiv1.classList.add("col-11");
					var ColDiv2 = document.createElement("div");
						ColDiv2.classList.add("col-1");
					
					//areaName = "area" + areaCnt;
					//areaCnt++;
					
					//tagInput.id = areaName;
					tagInput.name = "areaCompetenza";
					tagInput.readOnly = true;
					
					tagDivButton.classList.add("btn");
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
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Area inserita non esistente"
			
		}
		
		

		function stampaMansioneSelezionata(mansioneList) {
			var mansioniEsistenti = document.getElementById("mansioneDiv").children;
			if(mansioniEsistenti.length > 1){   
				for(var i=1; i<mansioniEsistenti.length; i++){    
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
						ColDiv1.classList.add("col-11");
					var ColDiv2 = document.createElement("div");
						ColDiv2.classList.add("col-1");
			
			//mansioneName = "mansione" + mansioneCnt;
			//mansioneCnt++;
			
			//tagInput.id = mansioneName;
			tagInput.name = "mansioni";
			tagInput.readOnly = true;
			
			tagDivButton.classList.add("btn");
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
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Mansione inserita non esistente"
		}
		
		
		function stampaSpecializzazioneSelezionata(specializzazioneList) {
			var specializzazioniEsistenti = document.getElementById("specializzazioneDiv").children;
			if(specializzazioniEsistenti.length > 1){   
				for(var i=1; i<specializzazioniEsistenti.length; i++){    
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
						ColDiv1.classList.add("col-11");
					var ColDiv2 = document.createElement("div");
						ColDiv2.classList.add("col-1");

					//specializzazioneName = "specializzazione" + specializzazioneCnt;
					//specializzazioneCnt++;
					
					//tagInput.id = specializzazioneName;
					tagInput.name = "specializzazione";
					tagInput.readOnly = true;
					
					tagDivButton.classList.add("btn");
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
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Specializzazione inserita non esistente"
			
		}


		function buildString(string) {
			return string.replace("[", "").replace("]", "").split(", ");
		}

		
		function validateForm(){
			
			if(document.getElementById("anno").value != ""){
				if(document.getElementById("anno").value.length != 4 || isNaN(document.getElementById("anno").value)){
					$('#errorModal').modal('toggle');
					document.getElementById("errorModalBody").innerHTML = "Anno non inserito in modo corretto"
					return false;
				}
			}
			
			
			if(document.getElementById("telefono").value.length != 10 || isNaN(document.getElementById("telefono").value)){
				$('#errorModal').modal('toggle');
				document.getElementById("errorModalBody").innerHTML = "Telefono deve essere composto da 10 cifre"
				return false;
			}
			
			if(document.getElementById("codiceFiscale").value != "" && document.getElementById("codiceFiscale").value.length != 16){
				$('#errorModal').modal('toggle');
				document.getElementById("errorModalBody").innerHTML = "Codice Fiscale deve essere composto da 16 lettere/cifre"
				return false;
			}
			
			if(document.getElementById("nome").value == "" || document.getElementById("cognome").value == "" || document.getElementById("telefono").value == "" || document.getElementById("email").value == ""){
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
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Anno non inserito in modo corretto"
			return false
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
