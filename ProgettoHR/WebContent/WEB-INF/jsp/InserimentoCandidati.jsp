<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserimento Candidati</title>
<script src="https://kit.fontawesome.com/053b00be10.js"
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<!-- <style>
body {
    background-image: url("/ProgettoHR/img/sfondo.jpg");
}

</style> -->
</head>
<body
	onload="getMansione('${mansioneList}', '${specializzazioneList}', '${areaCompetenzaList}')">

	<!-- Navbar -->
	<div class="container-fluid">
		<div class="row w-100">
			<nav class="navbar navbar-light fixed-top bg-primary w-100 "
				style="opacity: 0.9;">

				<!-- Logo -->
				<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
					<img src="/ProgettoHR/img/Erre_technology_group_NEW.png"
					style="width: 170px;">
				</a>

				<!-- bottone profilo -->
				<div class="col-auto text-right">
					<button class="btn btn-primary dropdown-toggle"
						style="border-radius: 10px; box-shadow: 0px 0px 2px black;"
						role="button" id="logout" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="/ProgettoHR/Logout">Logout</a>
					</div>
				</div>

			</nav>
		</div>
	</div>

	<div style="margin-top: 110px;" class="container-fluid ">
		<div class="row">

			<!-- COLONNA BOTTONI LATERALI -->
			<div class="col-1.5"
				style="opacity: 0.9; border-radius: 0px 10px 10px 0px; background-color: #0466c8;">

				<!-- bottone aggiunta mansione -->
				<c:choose>
					<c:when test="${ utente!=null and utente.ruolo.ruolo == 'admin'}">
						<button class="btn btn-dark btn-block mt-1 text-left"
							style="background-color: #0353a4; border-color: transparent; border-radius: 1px 10px 10px 1px;"
							data-toggle="modal" data-target="#mansioneModal">
							<i class="fas fa-plus-square mr-1"></i> Mansione <i
								class="fas fa-briefcase "></i>
						</button>
					</c:when>
				</c:choose>

			</div>

			<!-- COLONNA INSERIMENTO CANDIDATO -->
			<div class="col-auto">

				<form class="border rounded p-3" autocomplete="off" method="POST"
					action="/ProgettoHR/CandidatiSave/${businessUnit}">

					<h4 class="text-center"">Nuovo candidato</h4>
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
								id="customSwitch1"> <label class="custom-control-label"
								for="customSwitch1">Categoria protetta</label>
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

</body>

</html>
