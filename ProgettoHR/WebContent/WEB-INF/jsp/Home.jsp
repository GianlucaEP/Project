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
</style>

<!-- Meta -->
<meta charset="ISO-8859-1">
<title>Home Page</title>

</head>

<body>

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
	<div style="margin-top: 110px;" class="container-fluid"></div>
	<div class="row h-100">
		<div class="col-auto p-0 bg-primary"
			style="opacity: 0.9; border-radius: 1px 10px 10px 1px;">

			<!-- bottone aggiunta candidato-->
			<a href="/ProgettoHR/Candidati/${businessUnit}" type="button"
				class="btn btn-primary btn-block mt-1 text-left">+ Candidato <i
				class="fas fa-user"></i></a>

			<!-- bottone aggiunta mansione -->
			<c:choose>
				<c:when test="${ ruolo == 'admin'}">
					<button class="btn btn-primary btn-block m-0 text-left"
						data-toggle="modal" data-target="#mansioneModal">
						+ Mansione <i class="fas fa-briefcase "></i>
					</button>
				</c:when>
			</c:choose>

		</div>

		<!-- Filtro -->
		<div
			class="col-md-2 col-lg-10 p-0 justify-content-md-center table-responsive-md px-4">
			<div class="row">
				<div class="col">
					<div class="input-group mb-3">

						<form action="/ProgettoHR/Home/filter/${businessUnit}"
							method="post" >
							<label>nome</label> <input type="text" name="nome"
								class="form-control" aria-describedby="basic-addon2"> <label>cognome</label>
							<input type="text" name="cognome" class="form-control"
								aria-describedby="basic-addon2"> <label>mansione</label>
							<c:forEach var="mans" items="${mansioneList}"
								varStatus="contatore">
								<div>
									<input type="checkbox" name="mansione${contatore.index}"
										value="${mans.mansione}" /> ${mans.mansione}
								</div>
							</c:forEach>
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit">Button</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Tabella principale -->
			<table
				class="table table-striped text-center table-hover shadow  bg-white">

				<!-- Testa della tabella -->
				<thead class="thead-dark">
					<tr>
						<th scope="col">Stato</th>
						<th scope="col">Business unit</th>
						<th scope="col">Nome</th>
						<th scope="col">Cognome</th>
						<th scope="col">Area Competenza</th>
						<th scope="col">Mansione</th>
						<th scope="col">Seniority</th>
						<th scope="col"></th>
					</tr>
				</thead>

				<!-- Corpo della tabella -->
				<tbody>
					<c:forEach var="cand" items="${list}">
						<tr>
							<td><c:choose>
									<c:when test="${ cand.stato.descrizione == 'attivo'}">
										<span id="dot" data-toggle="tooltip" data-placement="top"
											title="Attivo" class="dot bg-success"></span>
									</c:when>
									<c:when test="${ cand.stato.descrizione == 'selezionato'}">
										<span id="dot" data-toggle="tooltip" data-placement="top"
											title="Selezionato" class="dot bg-primary"></span>
									</c:when>
									<c:when test="${ cand.stato.descrizione == 'da_contattare'}">
										<span id="dot" data-toggle="tooltip" data-placement="top"
											title="Da contattare" class="dot bg-warning"></span>
									</c:when>
									<c:when test="${ cand.stato.descrizione == 'scartato'}">
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
								onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">${cand.nome}</td>
							<td
								onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">${cand.cognome}</td>

							<td><c:forEach var="area" items="${cand.area}">
									<span
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${area.area}</span>
								</c:forEach></td>

							<td><c:forEach var="mansione" items="${cand.mansione}">
									<span
										onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
										${mansione.mansione}</span>
								</c:forEach></td>

							<td
								onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
								${cand.seniority.seniority}</td>
							<td data-toggle="modal" data-target="#EliminaModal"><i
								class="fas fa-trash-alt"></i></td>
						</tr>
						<!-- The Modal -->
						<!--  <div class="modal" id="EliminaModal">
							<div class="modal-dialog">
								<div class="modal-content">

									
									<div class="modal-header">
										<h4 class="modal-title">Elimina Candidato</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

								
									<div class="modal-body">Sei sicuro di voler eliminare il
										candidato ${cand.nome} ${cand.cognome}?</div>

								
									<div class="modal-footer">
										<button
											onclick="window.location = '/ProgettoHR/Elimina/${cand.id}'"
											type="button" class="btn btn-success" data-dismiss="modal">Si</button>
										<button onclick="window.location = '/ProgettoHR/Home'"
											type="button" class="btn btn-danger" data-dismiss="modal">No</button>
									</div>

								</div>
							</div>
						</div>-->
					</c:forEach>
				</tbody>
			</table>
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

			if (nome === "" && cognome === "" && document.querySelectorAll("input:checked").length === 0) {
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
				var textnode = document.createTextNode("Inserisci Mansione")
				tagDiv.appendChild(textnode)
				document.getElementById("mansione").appendChild(tagDiv);
				control = false;

			}

			return control;
		}
	</script>

</body>

</html>
