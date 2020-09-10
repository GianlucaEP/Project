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

/* Body e html generale*/
html, body {
	height: 100%;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

/* Navbar */
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
	margin-top: 20px;
	display: flex;
	flex-direction: rows;
	justify-content: flex-start;
}

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
	height: 100%;
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
</style>

</head>

<body onload="impostaAnno()">

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-xl ">
		<div class="container-fluid">

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

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="/ProgettoHR/Logout"><i class="fas fa-sign-out-alt"></i></a></li>

				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid container1 p-0">
		<div class="row">
			<!-- COLONNA BOTTONI LATERALI -->
			<div class="col-3">

				<!-- BARRA LATERALE -->
				<nav id="sidebar">

					<div class="sidebar-header">
						<h3>Inserimento candidato</h3>
					</div>

					<ul class="list-unstyled components">

						<c:if test="${utente.ruolo.ruolo == 'admin'}">
							<li><a href="" data-toggle="modal"
								data-target="#mansioneModal" type="button"><i
									class="fas fa-plus"></i> Nuova mansione</a></li>
						</c:if>

						<c:if test="${utente.ruolo.ruolo == 'admin'}">
							<li><a href="" data-toggle="modal"
								data-target="#areaCompetenzaModal" type="button"><i
									class="fas fa-plus"></i> Nuova Area</a></li>
						</c:if>

						<c:if test="${ utente.ruolo.ruolo == 'admin'}">
							<li><a href="" data-toggle="modal"
								data-target="#specializzazioneModal" type="button"><i
									class="fas fa-plus"></i> Nuova Specializzazione</a></li>
						</c:if>

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
								id="telefono" required="required" placeholder="123-456-7890"></form:input>
						</div>
					</div>

					<div class="form-group">
						<label>E-mail:</label>
						<form:input type="email" path="email" pattern=".+@globex.com"
							size="30" class="form-control" id="email" required="required"></form:input>
					</div>

					<div class="form-group">
						<label>Codice fiscale:</label>
						<form:input type="text" path="codiceFiscale" class="form-control"
							id="codiceFiscale"></form:input>
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
						<div class="form-row">
							<div class="col-11">
								<div id="areeCompetenzaDiv">
									<input autocomplete="off" placeholder="aggiungi"
										list="areeCompetenzeDisponibili" id="areaCompetenzaInput"
										class="form-control">
									<datalist id="areeCompetenzeDisponibili">
										<c:forEach var="area" items="${areaCompetenzaList}">
											<option value="${area}"></option>
										</c:forEach>
									</datalist>
								</div>
							</div>
							<div class="col-1">
								<button
									onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
									class="btn btn-block form-control">
									<i class="fas fa-plus"></i>
								</button>
							</div>
						</div>
					</div>

					<div class="form-group mb-3">
						<label>Mansione:</label>
						<div class="form-row">
							<div class="col-11">

								<div id="mansioneDiv">
									<input autocomplete="off" placeholder="aggiungi"
										list="mansioniDisponibili" id="mansioneInput"
										class="form-control">
									<datalist id="mansioniDisponibili">
										<c:forEach var="mans" items="${mansioneList}">
											<option value="${mans}"></option>
										</c:forEach>
									</datalist>

								</div>
							</div>
							<div class="col-1">
								<div onclick="stampaMansioneSelezionata('${mansioneList}')"
									class="btn">
									<i class="fas fa-plus"></i>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label>Specializzazione:</label>
						<div class="form-row">
							<div class="col-6">
								<div id="specializzazioneDiv">
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
							</div>
							<div class="col-5">
								<input id="anniEsperienzaInput" class="text-left form-control" type="number"
									placeholder="anni esperienza">
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
					action="/ProgettoHR/MansioniSaveDaHome/${businessUnit}"
					onsubmit="return validate();">
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
					<h5 class="modal-title" id="exampleModalLabel">Aggiunta Area
						Competenza</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form modelAttribute="areaCompetenza" id="formAreaCompetenza"
					method="POST"
					action="/ProgettoHR/AreaCompetenzaSaveDaHome/${businessUnit}"
					onsubmit="return validateArea();">
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
					action="/ProgettoHR/SpecializzazioneSaveDaHome/${businessUnit}"
					onsubmit="return validateSpecializzazione();">
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
		areaCnt = 0;
		mansioneCnt = 0;
		specializzazioneCnt = 0;
		
		function impostaAnno(){
			document.getElementById("anno").value = "";
		}
		

		function stampaAreaCompetenzaSelezionata(areaCompetenzaList) {
			if(document.getElementById("area0") !== null){   
				for(var i = 0; i<areaCnt; i++){       
				 	var areaId = "area"+i;
					if(document.getElementById(areaId).value === document.getElementById("areaCompetenzaInput").value){  
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
					
					areaName = "area" + areaCnt;
					areaCnt++;
					
					tagInput.id = areaName;
					tagInput.name = "areaCompetenza";
					tagInput.readOnly = true;
					
					tagDivButton.innerHTML = '<i class="material-icons"> cancella</i>';
					
					tagDivButton.onclick = function(){				              	              	          				
						tagDiv.remove();
					};
					
					tagDiv.appendChild(tagInput);
					tagDiv.appendChild(tagDivButton);
					
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
			if(document.getElementById("mansione0") !== null){   
				for(var i = 0; i<mansioneCnt; i++){       
				 	var mansioneId = "mansione"+i;
					if(document.getElementById(mansioneId).value === document.getElementById("mansioneInput").value){  
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
			
			mansioneName = "mansione" + mansioneCnt;
			mansioneCnt++;
			
			tagInput.id = mansioneName;
			tagInput.name = "mansioni";
			tagInput.readOnly = true;
			
			tagDivButton.innerHTML = '<i class="material-icons"> cancella</i>';
			
			tagDivButton.onclick = function(){				              	              	          				
				tagDiv.remove();
			};
			
			tagDiv.appendChild(tagInput);
			tagDiv.appendChild(tagDivButton);
			
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
			if(document.getElementById("specializzazione0") !== null){   
				for(var i = 0; i<specializzazioneCnt; i++){       
				 	var specializzazioneId = "specializzazione"+i;
				 	var spec = document.getElementById(specializzazioneId).value;
					if(spec.split(" ")[0] === document.getElementById("specializzazioneInput").value){  
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

					specializzazioneName = "specializzazione" + specializzazioneCnt;
					specializzazioneCnt++;
					
					tagInput.id = specializzazioneName;
					tagInput.name = "specializzazione";
					tagInput.readOnly = true;
					
					tagDivButton.innerHTML = '<i class="material-icons"> cancella</i>';
					
					tagDivButton.onclick = function(){				              	              	          				
						tagDiv.remove();
					};
					
					tagDiv.appendChild(tagInput);
					tagDiv.appendChild(tagDivButton);
					
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
					return false
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
			}
		
			document.getElementById(idSubmit).disabled = "true";
			return true;
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
