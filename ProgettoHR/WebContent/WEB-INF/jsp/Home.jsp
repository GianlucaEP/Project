<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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

<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>

<body>
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


	<div class="container-fluid ">
		<div class="row">
			<div class="col-auto p-0 bg-primary justify-content-md-start"
				style="opacity: 0.8;">

				<a href="/ProgettoHR/Candidati" type="button"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">+ Candidato <i class="fas fa-user"></i></a>
				<a href="/ProgettoHR/Mansioni" type="button"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">+ Mansione <i
					class="fas fa-briefcase float-right"></i></a>
			</div>

			<div class="col-auto p-2 justify-content-md-center">
				<table
					class="table table-bordered table-striped text-center table-hover "
					style="box-shadow: 10px 10px 5px grey;">
					<thead>
						<tr>
							<th scope="col">Stato</th>
							<th scope="col">Business</th>
							<th scope="col">Nome</th>
							<th scope="col">Cognome</th>
							<th scope="col">Area Competenza</th>
							<th scope="col">Mansione</th>
							<th scope="col">Seniority</th>
						</tr>
					</thead>
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
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">${cand.business.business}</td>
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
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">${cand.seniority}</td>
								<td data-toggle="modal" data-target="#EliminaModal"><i
									class="fas fa-trash-alt"></i></td>
							</tr>
							<!-- The Modal -->
							<div class="modal" id="EliminaModal">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">Elimina Candidato</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<div class="modal-body">Sei sicuro di voler eliminare il
											candidato ${cand.nome} ${cand.cognome}?</div>

										<!-- Modal footer -->
										<div class="modal-footer">
											<button
												onclick="window.location = '/ProgettoHR/Elimina/${cand.id}'"
												type="button" class="btn btn-success" data-dismiss="modal">Si</button>
											<button onclick="window.location = '/ProgettoHR/Home'"
												type="button" class="btn btn-danger" data-dismiss="modal">No</button>
										</div>

									</div>
								</div>
							</div>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>




</body>

<script>
	function changeDotColor(stato) {
		if (stato === "attivo") {
			document.getElementById("dot").className = "dot bg-success";
		}
	}

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})
</script>

<style>
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
}
</style>
</html>

