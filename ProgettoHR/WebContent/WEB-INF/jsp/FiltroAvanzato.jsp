<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<!-- Scripts -->
<script src="https://kit.fontawesome.com/053b00be10.js"
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<!-- CSS -->
<style>
html, body {
	height: 100%;
}

.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
}

.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
	background-color: #3e8e41;
}

#myInput {
	box-sizing: border-box;
	background-position: 14px 12px;
	background-repeat: no-repeat;
	font-size: 16px;
	padding: 14px 20px 12px 45px;
	border: none;
	border-bottom: 1px solid #ddd;
}

#myInput:focus {
	outline: 3px solid #ddd;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f6f6f6;
	min-width: 230px;
	overflow: auto;
	border: 1px solid #ddd;
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown a:hover {
	background-color: #ddd;
}

.show {
	display: block;
}

--------------------------------------


* {
	box-sizing: border-box;
}

body {
	font: 16px Arial;
}

.autocomplete {
	/*the container must be positioned relative:*/
	position: relative;
	display: inline-block;
}

input {
	border: 1px solid transparent;
	background-color: #f1f1f1;
	padding: 10px;
	font-size: 16px;
}

input[type=text] {
	background-color: #f1f1f1;
	width: 100%;
}

input[type=submit] {
	background-color: DodgerBlue;
	color: #fff;
}

.autocomplete-items {
	position: absolute;
	border: 1px solid #d4d4d4;
	border-bottom: none;
	border-top: none;
	z-index: 99;
	/*position the autocomplete items to be the same width as the container:*/
	top: 100%;
	left: 0;
	right: 0;
}

.autocomplete-items div {
	padding: 10px;
	cursor: pointer;
	background-color: #fff;
	border-bottom: 1px solid #d4d4d4;
}

.autocomplete-items div:hover {
	/*when hovering an item:*/
	background-color: #e9e9e9;
}

.autocomplete-active {
	/*when navigating through the items using the arrow keys:*/
	background-color: DodgerBlue !important;
	color: #ffffff;
}
</style>

<!-- Meta -->
<meta charset="ISO-8859-1">
<title>Filtro Avanzato</title>

</head>
<%!String nomeString = "miao";%>


<body onload="getMansione('${mansioneList}')">


	<!--Navbar-->
	<div class="row w-100 p-0 m-0">
		<nav class="navbar navbar-light fixed-top bg-primary w-100"
			style="opacity: 0.8;">

			<!-- Logo -->
			<h1>
				<span class="navbar-text  text-white"> <a
					href="/ProgettoHR/Home"><img alt="logo"
						src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4"></a></span>

			</h1>



			<!-- Bottone profilo -->
			<button class="btn btn-primary dropdown-toggle" role="button"
				id="userOptions" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
				<i class="fas fa-user"></i>
			</button>

		</nav>
	</div>

	<!-- Bottoni Laterali -->
	<div style="margin-top: 110px;" class="container-fluid">
		<div class="row h-100">
			<div class="col-auto p-0 bg-primary"
				style="opacity: 0.9; border-radius: 1px 10px 10px 1px;">

				<!-- bottone aggiunta candidato
			<a href="/ProgettoHR/Candidati/${businessUnit}" type="button"
				class="btn btn-primary btn-block mt-1 text-left">+ Candidato <i
				class="fas fa-user"></i></a>-->

				<!-- bottone aggiunta mansione 
			<c:choose>
				<c:when test="${ ruolo == 'admin'}">
					<button class="btn btn-primary btn-block m-0 text-left"
						data-toggle="modal" data-target="#mansioneModal">
						+ Mansione <i class="fas fa-briefcase "></i>
					</button>
				</c:when>
			</c:choose>-->
				<div class="col">
					<div class="input-group mb-3">
						<form autocomplete="off"
							action="/ProgettoHR/Filter/advanced/${businessUnit}">
							<div class="autocomplete" style="width: 300px;">
								<input id="myInput" type="text" name="myCountry"
									placeholder="Country">
							</div>
							<input type="submit">
						</form>

						<form autocomplete="off"
							action="/ProgettoHR/Filter/advanced/${businessUnit}"
							method="post">
							<label>nome</label> <input type="text" name="nome"
								class="form-control" aria-describedby="basic-addon2"> <label>cognome</label>
							<input type="text" name="cognome" class="form-control"
								aria-describedby="basic-addon2">

							<div class="dropdown">
								<!--  <button onclick="myFunction()" class="dropbtn">Dropdown</button>-->

								<input oninput="myFunction()" type="text" placeholder="Search.."
									id="myInput" onkeyup="filterFunction()">
								<div id="myDropdown" class="dropdown-content">
									<!-- foreach su discord -->
									<!--  	<a href="#about">About</a> <a href="#base">Base</a> <a
										href="#blog">Blog</a> <a href="#contact">Contact</a> <a
										href="#custom">Custom</a> <a href="#support">Support</a> <a
										href="#tools">Tools</a>-->
								</div>
							</div>

							<label>mansione</label>

							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit">Button</button>
							</div>
						</form>
					</div>
				</div>



				<!-- Filtro -->

				<!--  <div>
			class="col-md-2 col-lg-10 p-0 justify-content-md-center table-responsive-md px-4">
			<div class="row">
				<div class="col">
					<div class="input-group mb-3">

						<form action="/ProgettoHR/Home/filter/${businessUnit}"
							method="post">
							<label>nome</label> <input type="text" name="nome"
								class="form-control" aria-describedby="basic-addon2"> <label>cognome</label>
							<input type="text" name="cognome" class="form-control"
								aria-describedby="basic-addon2"> <label>mansione</label>
					
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit">Button</button>
							</div>
						</form>
					</div>
				</div>
			</div>-->
				<!-- Tabella principale -->
				<!--  -->
			</div>

		</div>

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

		<div class="modal fade" id="filterErrorModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Errore</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">Nessun filtro inserito.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Chiudi</button>
					</div>
				</div>
			</div>
		</div>

		<script>
			function validateFilter(contatore) {
				var control = true;
				var nome = document.getElementsByName("nome")[0].value;
				var cognome = document.getElementsByName("cognome")[0].value;

				if (nome === ""
						&& cognome === ""
						&& document.querySelectorAll("input:checked").length === 0) {
					$("#filterErrorModal").modal()
					return !control;
				}

				return control;
			}
			function changeDotColor(stato) {
				if (stato === "attivo") {
					document.getElementById("dot").className = "dot bg-success";
				}
			}

			$(function() {
				$('[data-toggle="tooltip"]').tooltip()
			})

			function validate() {
				var mansione = document.getElementById("mansione").value;
				var list = document.getElementById("formMansione");
				var control = true;

				if (mansione === "") {

					var tagDiv = document.createElement("div");
					tagDiv.style = "color:red; font-size: small;"
					var textnode = document
							.createTextNode("Inserisci Mansione")
					tagDiv.appendChild(textnode)
					document.getElementById("mansione").appendChild(tagDiv);
					control = false;

				}

				return control;
			}
		</script>

		<script>
			/* When the user clicks on the button,
			 toggle between hiding and showing the dropdown content */
			function myFunction() {
				if (!document.getElementById("myDropdown").classList
						.toggle("show")) {
					document.getElementById("myDropdown").classList
							.toggle("show");
				}
				if (document.getElementById("myInput").value == "") {
					document.getElementById("myDropdown").classList
							.toggle("show");
				}
			}

			function filterFunction() {
				var input, filter, ul, li, a, i;
				input = document.getElementById("myInput");
				filter = input.value.toUpperCase();
				div = document.getElementById("myDropdown");
				checkbox = div.getElementsByTagName("input");
				for (i = 0; i < checkbox.length; i++) {
					txtValue = checkbox[i].value;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						checkbox[i].style.display = "block";

					} else {
						document.getElementById("prova").style.display = "none";
						checkbox[i].style.display = "none";
					}
				}
			}
		</script>

		<script type="text/javascript">
			function autocomplete(inp, arr) {
				/*the autocomplete function takes two arguments,
				the text field element and an array of possible autocompleted values:*/
				var currentFocus;
				/*execute a function when someone writes in the text field:*/
				inp.addEventListener(
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
									a.setAttribute("class",
											"autocomplete-items");
									/*append the DIV element as a child of the autocomplete container:*/
									this.parentNode.appendChild(a);
									/*for each item in the array...*/
									for (i = 0; i < arr.length; i++) {
										/*check if the item starts with the same letters as the text field value:*/
										if (arr[i].substr(0, val.length)
												.toUpperCase() == val
												.toUpperCase()) {
											/*create a DIV element for each matching element:*/
											b = document.createElement("DIV");
											/*make the matching letters bold:*/
											b.innerHTML = "<strong>"
													+ arr[i].substr(0,
															val.length)
													+ "</strong>";
											b.innerHTML += arr[i]
													.substr(val.length);
											/*insert a input field that will hold the current array item's value:*/
											b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
											/*execute a function when someone clicks on the item value (DIV element):*/
											b.addEventListener(
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
					var x = document.getElementById(this.id
							+ "autocomplete-list");
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
					var x = document
							.getElementsByClassName("autocomplete-items");
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

			function getMansione(list) {
				var res = list.replace("[", "").replace("]", "").split(",");
				autocomplete(document.getElementById("myInput"), res);
			}
		</script>
</body>

</html>
