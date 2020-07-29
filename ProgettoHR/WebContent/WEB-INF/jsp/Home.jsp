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
	<div>
		<nav class="navbar navbar-dark bg-primary "
			style="opacity: 0.8; box-shadow: 10px 10px 5px grey;">
			<h1>
				<span class="navbar-text bg-primary text-white"> <a
					href="/ProgettoHR/Home"><img alt="logo"
						src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4"></a>
				</span>

			</h1>

		</nav>
	</div>
	<br>
	<div class="container-fluid ">
		<div class="row">
			<div class="col-2 ">

				<a href="/ProgettoHR/Candidati" type="button"
					class="btn btn-primary btn-block">Aggiungi Candidato</a> <a
					href="/ProgettoHR/Mansioni" type="button"
					class="btn btn-primary btn-block">Aggiungi Mansione</a>
			</div>

			<div class="col-10">
				<table
					class="table table-bordered table-striped text-center table-hover "
					style="box-shadow: 10px 10px 5px grey;">
					<thead>
						<tr>
							<th scope="col">Nome</th>
							<th scope="col">Cognome</th>
							<th scope="col">Mansione</th>
							<th scope="col">Seniority</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cand" items="${list}">
							<tr>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">${cand.nome}</td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">${cand.cognome}</td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">${cand.mansione}</td>
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
</html>