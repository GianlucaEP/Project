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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<style>

/* Body e html generale*/
html, body {
	height: 100%;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

p {
	font-family: 'Poppins', sans-serif;
	font-size: 1.1em;
	font-weight: 300;
	line-height: 1.7em;
	color: #999;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

/* Navbar */
.navbar {
	position: absolute;
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
	width: 100%;
}

.navbar .navbar-brand .logo {
	width: auto;
	height: 70px;
}

.navbar .btn {
	background: #7fc8f8;
	width: 50%;
	margin-left: 60px;
}

.line {
	width: 100%;
	height: 1px;
	border-bottom: 1px dashed #ddd;
	margin: 40px 0;
}

/* Barra Laterale */
.container-fluid2 {
	margin-top: 110px;
}

#sidebar {
	border-collapse: collapse;
	font-size: 0.9em;
	min-width: 250px;
	max-width: 250px;
	border-radius: 0px 5px 5px 0px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
	background: #5aa9e6;
	color: #fff;
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

<body>

	<!-- NAVBAR -->
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar">

				<!-- LOGO -->
				<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
					<img class="logo"
					src="/ProgettoHR/img/Erre_technology_group_NEW.png">
				</a>

				<!-- BOTTONE PROFILO -->
				<div class="col-1">

					<button class="btn" id="logout" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-cog"></i>
					</button>

					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="/ProgettoHR/Logout">Logout</a>
					</div>

				</div>

			</nav>
		</div>
	</div>

	<div class="container-fluid2 ">
		<div class="row">
			<!-- COLONNA BOTTONI LATERALI -->
			<div class="col-auto">

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
								id="anno"></form:input>
						</div>

						<div class="form-group col-8">
							<label>Telefono:</label>
							<form:input type="text" path="telefono" class="form-control"
								id="telefono" required="required"></form:input>
						</div>
					</div>

					<div class="form-group">
						<label>E-mail:</label>
						<form:input type="text" path="email" class="form-control"
							id="email" required="required"></form:input>
					</div>

					<div class="form-group">
						<label>Codice fiscale:</label>
						<form:input type="text" path="codiceFiscale" class="form-control"
							id="codiceFiscale"></form:input>
					</div>

					<div class="form-group">
						<label>Seniority:</label>
						<form:select path="seniority.seniority" class="custom-select">

							<c:forEach var="sen" items="${seniorityList}">
								<option value="${sen.seniority}">${sen.seniority}</option>
							</c:forEach>
						</form:select>
					</div>

					<div class="form-group">
						<label>Business unit:</label>
						<form:select path="business.business" class="custom-select">
							<c:forEach var="bus" items="${businessList}">
								<option value="${bus.business}">${bus.business}</option>
							</c:forEach>
						</form:select>
					</div>

					<div class="form-group">
						<label>Provenienza candidatura:</label>
						<form:input type="text" path="provenienza" class="form-control"
							id="provenienza" name="provenienza"></form:input>
					</div>


					<div class="form-group">

						<label>Area competenza:</label>
						<div id="areeCompetenzaDiv">
							<input autocomplete="off" placeholder="aggiungi"
								list="areeCompetenzeDisponibili" id="areaCompetenzaInput">
							<datalist id="areeCompetenzeDisponibili">
								<c:forEach var="area" items="${areaCompetenzaList}">
									<option value="${area}"></option>
								</c:forEach>
							</datalist>
							<div
								onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
								class="btn">
								<i class="fas fa-plus-square mr-1"></i>
							</div>
						</div>
					</div>

					<div class="form-group">

						<label>Mansione:</label>
						<div id="mansioneDiv">
							<input autocomplete="off" placeholder="aggiungi"
								list="mansioniDisponibili" id="mansioneInput">
							<datalist id="mansioniDisponibili">
								<c:forEach var="mans" items="${mansioneList}">
									<option value="${mans}"></option>
								</c:forEach>
							</datalist>
							<div onclick="stampaMansioneSelezionata('${mansioneList}')"
								class="btn">
								<i class="fas fa-plus-square mr-1"></i>
							</div>
						</div>
					</div>


					<div class="form-group">

						<label>Specializzazione:</label>

						<div id="specializzazioneDiv">
							<input autocomplete="off" placeholder="aggiungi"
								list="specializzazioniDisponibili" id="specializzazioneInput">
							<datalist id="specializzazioniDisponibili">
								<c:forEach var="specializzazione"
									items="${specializzazioneList}">
									<option value="${specializzazione}"></option>
								</c:forEach>
							</datalist>

							<input id="anniEsperienzaInput" class="text-left" type="number"
								placeholder="anni esperienza">
							<div
								onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
								class="btn">
								<i class="fas fa-plus-square mr-1"></i>
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
						<button type="submit" class="btn btn-primary btn-block">Salva</button>
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
					<h5 class="modal-title" id="exampleModalLabel">Aggiunta
						Mansione</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form modelAttribute="mansione" id="formMansione"
						method="POST" action="/ProgettoHR/MansioniSaveDaInserimentoCandidato/${businessUnit}"
						onsubmit="return validate();">
						<div class="form-group">
							<form:input path="mansione" type="text" class="form-control"
								placeholder="Mansione" id="mansione" name="mansione"></form:input>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Salva</button>
							<button type="reset" class="btn btn-danger btn-block">Cancella</button>
						</div>
					</form:form>
				</div>
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
				<div class="modal-body">
					<form:form modelAttribute="areaCompetenza" id="formAreaCompetenza"
						method="POST"
						action="/ProgettoHR/AreaCompetenzaSaveDaInserimentoCandidato/${businessUnit}"
						onsubmit="return validateArea();">
						<div class="form-group">
							<form:input path="area" type="text" class="form-control"
								placeholder="Area di Competenza" id="area"></form:input>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Salva</button>
							<button type="reset" class="btn btn-danger btn-block">Cancella</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- MODAL AGGIUNTA SPECIALIZZAZOINE -->
	<div class="modal fade" id="specializzazioneModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Aggiunta Specializzazione</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form modelAttribute="specializzazione" id="formSpecializzazione"
						method="POST"
						action="/ProgettoHR/SpecializzazioneSaveDaInserimentoCandidato/${businessUnit}"
						onsubmit="return validateArea();">
						<div class="form-group">
							<form:input path="specializzazione" type="text" class="form-control"
								placeholder="Specializzazione" id="specializzazione"></form:input>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-block">Salva</button>
							<button type="reset" class="btn btn-danger btn-block">Cancella</button>
						</div>
					</form:form>
				</div>
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
					
					tagDivButton.innerHTML = '<i class="material-icons">delete</i>';
					
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
			
			tagDivButton.innerHTML = '<i class="material-icons">delete</i>';
			
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
					
					tagDivButton.innerHTML = '<i class="material-icons">delete</i>';
					
					tagDivButton.onclick = function(){				              	              	          				
						tagDiv.remove();
					};
					
					tagDiv.appendChild(tagInput);
					tagDiv.appendChild(tagDivButton);
					
					document.getElementById("specializzazioneDiv").appendChild(tagDiv);
					document.getElementById("specializzazioneInput").value = "";
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
			
			if(document.getElementById("nome").value == "" || document.getElementById("cognome").value == "" || document.getElementById("telefono").value == "" || document.getElementById("email").value == ""){
				return false;
			}
		
			document.getElementById(idSubmit).disabled = "true";
			return true;
			}
		
		
	</script>

	<!-- jQuery CDN - Slim version (=without AJAX) -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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
