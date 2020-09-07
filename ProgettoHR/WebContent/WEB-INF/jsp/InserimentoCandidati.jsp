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

<body
	onload="getMansione('${mansioneList}', '${specializzazioneList}', '${areaCompetenzaList}')">

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
						<li><c:choose>
								<c:when
									test="${ utente!=null and utente.ruolo.ruolo == 'admin'}">
									<a href="" data-toggle="modal" data-target="#mansioneModal"
										type="button"><i class="fas fa-plus"></i> Nuova mansione</a>
								</c:when>
							</c:choose></li>
					</ul>
				</nav>
			</div>

			<!-- COLONNA INSERIMENTO CANDIDATO -->
			<div class="col-auto">

				<form class="border rounded p-3" autocomplete="off" method="POST"
					action="/ProgettoHR/CandidatiSave/${businessUnit}">

					<h4 class="text-center">Nuovo candidato</h4>
					<p class="text-center">Compila i campi presenti per inserire un
						nuovo candidato</p>
					<hr class="my-4">

					<div class="form-row">

						<div class="form-group col-6">
							<label>Nome: </label><input type="text" class="form-control"
								id="nome" name="nome"></input>
						</div>
						<div class="form-group col-6">
							<label>Cognome: </label><input type="text" class="form-control"
								id="cognome" name="cognome"></input>
						</div>

					</div>

					<div class="form-row">

						<div class="form-group col-4">
							<label>Anno di nascita: </label> <input type="text"
								class="form-control" id="anno" name="anno"></input>
						</div>

						<div class="form-group col-8">
							<label>Telefono:</label> <input type="text" class="form-control"
								id="telefono" name="telefono"></input>
						</div>
					</div>

					<div class="form-group">
						<label>E-mail:</label> <input type="text" class="form-control"
							id="email" name="email"></input>
					</div>

					<div class="form-group">
						<label>Codice fiscale:</label> <input type="text"
							class="form-control" id="codiceFiscale" name="codiceFiscale"></input>
					</div>

					<div class="form-group">
						<label>Seniority:</label> <select name="seniority"
							class="custom-select">

							<c:forEach var="sen" items="${seniorityList}">
								<option value="${sen.seniority}">${sen.seniority}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label>Business unit:</label> <select name="business"
							class="custom-select">
							<c:forEach var="bus" items="${businessList}">
								<option value="${bus.business}">${bus.business}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label>Provenienza candidatura:</label> <input type="text"
							class="form-control" id="provenienza" name="provenienza"></input>
					</div>


					<div class="form-group">

						<label>Area competenza:</label>
						<button class="btn btn-block text-center border collapsed"
							type="button" data-toggle="collapse"
							data-target="#collapseAreaCompetenza" aria-expanded="false"
							aria-controls="collapseAreaCompetenza">
							<i class="fa fa-plus" aria-hidden="true"></i>
						</button>

						<div id="collapseAreaCompetenza" class="collapse"
							aria-labelledby="headingAreaCompetenza">
							<div id="areaCompetenzaDiv" class="card-body">
								<div class="autocomplete" style="border-bottom-style: ridge;">

									<input id="areaCompetenzaInput"
										style="border-color: transparent;" type="text">

									<div
										onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
										class="btn float-right">
										<i class="fas fa-arrow-circle-down"></i>
									</div>

								</div>

							</div>
						</div>
					</div>

					<div class="form-group">

						<label>Mansione:</label>
						<button class="btn btn-block text-center border collapsed"
							type="button" data-toggle="collapse"
							data-target="#collapseMansione" aria-expanded="false"
							aria-controls="collapseMansione">
							<i class="fa fa-plus" aria-hidden="true"></i>
						</button>

						<div id="collapseMansione" class="collapse"
							aria-labelledby="headingMansione">
							<div id="mansioneDiv" class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="mansioneInput" style="border-color: transparent;"
										type="text">

									<div onclick="stampaMansioneSelezionata('${mansioneList}')"
										class="btn float-right">
										<i class="fas fa-arrow-circle-down"></i>
									</div>


								</div>

							</div>
						</div>
					</div>

					<div class="form-group">

						<label>Specializzazione:</label>
						<button class="btn btn-block text-center border collapsed"
							type="button" data-toggle="collapse"
							data-target="#collapseSpecializzazione" aria-expanded="false"
							aria-controls="collapseSpecializzazione">
							<i class="fa fa-plus" aria-hidden="true"></i>
						</button>



						<div id="collapseSpecializzazione" class="collapse"
							aria-labelledby="headingSpecializzazione">
							<div id="specializzazioneDiv" class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">

									<input id="specializzazioneInput" class="text-left"
										style="border-color: transparent;" type="text"
										placeholder="specializzazione"> <input
										id="anniEsperienzaInput" class="text-left"
										style="border-color: transparent;" type="number"
										placeholder="anni esperienza">

									<div
										onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
										class="btn float-right">
										<i class="fas fa-arrow-circle-down"></i>
									</div>

								</div>

							</div>
						</div>
					</div>

					<div class="form-group mt-2">
						<div class="custom-control custom-switch">
							<input type="checkbox" class="custom-control-input"
								id="customSwitch1" name="categoriaProtetta"> <label
								class="custom-control-label" for="customSwitch1">Categoria
								protetta</label>
						</div>
					</div>

					<hr class="my-4">

					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block">Salva</button>
						<button type="reset" class="btn btn-danger btn-block">Cancella</button>
					</div>

				</form>
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
						method="POST" action="/ProgettoHR/MansioniSave/${businessUnit}"
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
					var tagInput = document.createElement("input");
					tagInput.value = document.getElementById("areaCompetenzaInput").value;
					
					areaName = "area" + areaCnt;
					areaCnt++;
					
					tagInput.id = areaName;
					tagInput.name = areaName;
					tagInput.readOnly = true;
					
					document.getElementById("areaCompetenzaDiv").appendChild(tagInput);
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
			
			var tagInput = document.createElement("input");
			tagInput.value = document.getElementById("mansioneInput").value;
			
			mansioneName = "mansione" + mansioneCnt;
			mansioneCnt++;
			
			tagInput.id = mansioneName;
			tagInput.name = mansioneName;
			tagInput.readOnly = true;
			
			document.getElementById("mansioneDiv").appendChild(tagInput);
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
					if(document.getElementById(specializzazioneId).value === document.getElementById("specializzazioneInput").value){  
						$('#errorModal').modal('toggle');   
						document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
						return;              
              		}           
				} 
			
			}
			
			for(specializzazione of buildString(specializzazioneList)){
				if(document.getElementById("specializzazioneInput").value === specializzazione){
					
				
					var tagInput = document.createElement("input");
					tagInput.value = document.getElementById("specializzazioneInput").value + " " + document.getElementById("anniEsperienzaInput").value;

					specializzazioneName = "specializzazione" + specializzazioneCnt;
					specializzazioneCnt++;
					
					tagInput.id = specializzazioneName;
					tagInput.name = specializzazioneName;
					tagInput.readOnly = true;
					
					document.getElementById("specializzazioneDiv").appendChild(tagInput);
					document.getElementById("specializzazioneInput").value = "";
					document.getElementById("specializzazioneInput").focus();
					return;
				}
			}
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Specializzazione inserita non esistente"
			
		}

		function autocomplete(inp, arr) {
			/*the autocomplete function takes two arguments,
			the text field element and an array of possible autocompleted values:*/
			var currentFocus;
			/*execute a function when someone writes in the text field:*/
			inp
					.addEventListener(
							"input",
							function(e) {
								var a, b, i, val = this.value;
								/*close any already open lists of autocompleted values*/
								closeAllLists();
								if (!val) {
									return false;
								}
								currentFocus = -1;
								/*create a DIV element that will contain the items (values):*/
								a = document.createElement("DIV");
								a.setAttribute("id", this.id
										+ "autocomplete-list");
								a.setAttribute("class", "autocomplete-items");
								/*append the DIV element as a child of the autocomplete container:*/
								this.parentNode.appendChild(a);
								/*for each item in the array...*/
								for (i = 0; i < arr.length; i++) {
									/*check if the item starts with the same letters as the text field value:*/
									if (arr[i].substr(0, val.length)
											.toUpperCase() == val.toUpperCase()) {
										/*create a DIV element for each matching element:*/
										b = document.createElement("DIV");
										/*make the matching letters bold:*/
										b.innerHTML = "<strong>"
												+ arr[i].substr(0, val.length)
												+ "</strong>";
										b.innerHTML += arr[i]
												.substr(val.length);
										/*insert a input field that will hold the current array item's value:*/
										b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
										/*execute a function when someone clicks on the item value (DIV element):*/
										b
												.addEventListener(
														"click",
														function(e) {
															/*insert the value for the autocomplete text field:*/
															inp.value = this
																	.getElementsByTagName("input")[0].value;
															/*close the list of autocompleted values,
															(or any other open lists of autocompleted values:*/
															closeAllLists();
														});
										a.appendChild(b);
									}
								}
							});
			/*execute a function presses a key on the keyboard:*/
			inp.addEventListener("keydown", function(e) {
				var x = document.getElementById(this.id + "autocomplete-list");
				if (x)
					x = x.getElementsByTagName("div");
				if (e.keyCode == 40) {
					/*If the arrow DOWN key is pressed,
					increase the currentFocus variable:*/
					currentFocus++;
					/*and and make the current item more visible:*/
					addActive(x);
				} else if (e.keyCode == 38) { //up
					/*If the arrow UP key is pressed,
					decrease the currentFocus variable:*/
					currentFocus--;
					/*and and make the current item more visible:*/
					addActive(x);
				} else if (e.keyCode == 13) {
					/*If the ENTER key is pressed, prevent the form from being submitted,*/
					e.preventDefault();
					if (currentFocus > -1) {
						/*and simulate a click on the "active" item:*/
						if (x)
							x[currentFocus].click();
					}
				}
			});
			function addActive(x) {
				/*a function to classify an item as "active":*/
				if (!x)
					return false;
				/*start by removing the "active" class on all items:*/
				removeActive(x);
				if (currentFocus >= x.length)
					currentFocus = 0;
				if (currentFocus < 0)
					currentFocus = (x.length - 1);
				/*add class "autocomplete-active":*/
				x[currentFocus].classList.add("autocomplete-active");
			}
			function removeActive(x) {
				/*a function to remove the "active" class from all autocomplete items:*/
				for (var i = 0; i < x.length; i++) {
					x[i].classList.remove("autocomplete-active");
				}
			}
			function closeAllLists(elmnt) {
				/*close all autocomplete lists in the document,
				except the one passed as an argument:*/
				var x = document.getElementsByClassName("autocomplete-items");
				for (var i = 0; i < x.length; i++) {
					if (elmnt != x[i] && elmnt != inp) {
						x[i].parentNode.removeChild(x[i]);
					}
				}
			}
			/*execute a function when someone clicks in the document:*/
			document.addEventListener("click", function(e) {
				closeAllLists(e.target);
			});
		}

		function buildString(string) {
			return string.replace("[", "").replace("]", "").split(", ");
		}

		function getMansione(listMansione, specializzazioneList,
				areaCompetenzaList) {
			var mansioneString = buildString(listMansione);
			var specializzazioneString = buildString(specializzazioneList);
			var areaCompetenzaString = buildString(areaCompetenzaList);
			autocomplete(document.getElementById("mansioneInput"),
					mansioneString);
			autocomplete(document.getElementById("specializzazioneInput"),
					specializzazioneString);
			autocomplete(document.getElementById("areaCompetenzaInput"),
					areaCompetenzaString);
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
