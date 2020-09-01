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

	<div class="row w-100 p-0 m-0">
		<nav class="navbar navbar-light bg-primary w-100 "
			style="opacity: 0.8;">
			<h1>
				<span class="navbar-text  text-white"> <a
					href="/ProgettoHR/Home"><img alt="logo"
						src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4"></a></span>

			</h1>


			<button class="btn btn-primary dropdown-toggle" role="button"
				id="userOptions" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
				<i class="fas fa-user"></i>
			</button>

		</nav>
	</div>
	<div align="center" class="container-fluid ">
		<div class="row justify-content-md-start">
			<div class="col-auto p-0 bg-primary" style="opacity: 0.8;">

				<a href="/ProgettoHR/Home/${businessUnit}]" type="button"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">Torna alla Home <i
					class="fas fa-home float-right"></i></a> <a href="/ProgettoHR/Mansioni"
					type="button" class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">+ Mansione <i
					class="fas fa-briefcase float-right"></i></a>
			</div>

			<div align="center" class="col-auto m-2 p-2 border ">
				<h1>Inserimento Candidato</h1>
				<form autocomplete="off" method="POST"
					action="/ProgettoHR/CandidatiSave/${businessUnit}">
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Nome:</div>
								<input type="text" class="form-control" id="nome" name="nome"></input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Cognome:</div>
								<input type="text" class="form-control" id="cognome"
									name="cognome"></input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Anno
									di nascita:</div>
								<input type="text" class="form-control" id="anno" name="anno"></input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Telefono:</div>
								<input type="text" class="form-control" id="telefono"
									name="telefono"></input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Email:</div>
								<input type="text" class="form-control" id="email" name="email"></input>
							</div>
						</div>
					</div>


					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Seniority:</div>
								<select name="seniority" class="custom-select mb-3">
									<option selected></option>
									<c:forEach var="sen" items="${seniorityList}">
										<option value="${sen.seniority}">${sen.seniority}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Business
									Unit:</div>
								<select name="business" class="custom-select mb-3">
									<c:forEach var="bus" items="${businessList}">
										<option value="${bus.business}">${bus.business}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>




					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Provenienza:</div>
								<input type="text" class="form-control" id="provenienza"
									name="provenienza"></input>
							</div>
						</div>
					</div>




					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading10">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse10"
									aria-expanded="false" aria-controls="collapse10">
									<i class="fa fa-plus" aria-hidden="true"></i> Area Competenza <i
										class="fas fa-briefcase float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse10" class="collapse" aria-labelledby="heading10">
							<div class="card-body">

								<div id="areaCompetenzaDiv" class="autocomplete"
									style="border-bottom-style: ridge;">
									<input id="areaCompetenzaInput" class="text-left"
										style="border-color: transparent;" type="text"
										 placeholder=" area competenza candidato">

									<div onclick="stampaAreaCompetenzaSelezionata()" class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</div>

								</div>

							</div>
						</div>
					</div>


					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading10">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse10"
									aria-expanded="false" aria-controls="collapse10">
									<i class="fa fa-plus" aria-hidden="true"></i> Mansione <i
										class="fas fa-briefcase float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse10" class="collapse" aria-labelledby="heading10">
							<div class="card-body">

								<div id="mansioneDiv" class="autocomplete"
									style="border-bottom-style: ridge;">
									<input id="mansioneInput" class="text-left"
										style="border-color: transparent;" type="text"
										 placeholder=" mansione candidato">

									<div onclick="stampaMansioneSelezionata()" class="btn"><i class="fas fa-arrow-circle-down"></i></div>


								</div>

							</div>
						</div>
					</div>


					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading10">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse10"
									aria-expanded="false" aria-controls="collapse10">
									<i class="fa fa-plus" aria-hidden="true"></i> Specializzazione <i
										class="fas fa-briefcase float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse10" class="collapse" aria-labelledby="heading10">
							<div class="card-body">

								<div id="specializzazioneDiv" class="autocomplete"
									style="border-bottom-style: ridge;">
									<input id="specializzazioneInput" class="text-left"
										style="border-color: transparent;" type="text"
										 placeholder=" specializzazione candidato">

									<div onclick="stampaSpecializzazioneSelezionata()" class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</div>

								</div>

							</div>
						</div>
					</div>





					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">

									<input type="checkbox" class="form-check form-check-inline"
										id="categoriaProtetta" name="categoriaProtetta"
										style="float: rigth;"></input> Categoria Protetta
								</div>


							</div>
						</div>
					</div>

					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<button type="submit" class="btn btn-primary btn-block">Salva</button>
							<button type="reset" class="btn btn-danger btn-block">Cancella</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>



	<script type="text/javascript">
		areaCnt = 0;
		mansioneCnt = 0;
		specializzazioneCnt = 0;

		function mostraInputAnniEsperienza(contatore) {
			stringId = "candidatoSpecializzazione" + contatore + ".anni";
			var x = document.getElementById(stringId);
			if (x.type === 'hidden') {
				x.type = 'number';
			} else {
				x.type = 'hidden';
			}

		}

		function stampaAreaCompetenzaSelezionata() {
			var string = document.getElementById("areaCompetenzaInput").value;
			var tagDiv = document.createElement("input");
			//var node = document.createTextNode(string);
			tagDiv.value = string;
			areaName = "area" + areaCnt;
			areaCnt++;
			tagDiv.name = areaName;
			document.getElementById("areaCompetenzaDiv").appendChild(tagDiv);
		}

		function stampaMansioneSelezionata() {
			var string = document.getElementById("mansioneInput").value;
			var tagDiv = document.createElement("input");
			//var node = document.createTextNode(string);
			tagDiv.value = string;
			mansioneName = "mansione" + mansioneCnt;
			mansioneCnt++;
			tagDiv.name = mansioneName;
			document.getElementById("mansioneDiv").appendChild(tagDiv);
		}

		function stampaSpecializzazioneSelezionata() {
			var string = document.getElementById("specializzazioneInput").value;
			var tagDiv = document.createElement("input");
			//var node = document.createTextNode(string);
			tagDiv.value = string;
			specializzazioneName = "specializzazione"+specializzazioneCnt;
			specializzazioneCnt++;
			tagDiv.name = specializzazioneName;
			document.getElementById("specializzazioneDiv").appendChild(tagDiv);
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
