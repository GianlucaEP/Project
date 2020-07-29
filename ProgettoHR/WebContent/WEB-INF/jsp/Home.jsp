<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
		<nav class="navbar navbar-dark bg-primary " style=" opacity: 0.8">
			<h1>
				<span class="navbar-text bg-primary text-white">Erre
					Technology </span>
			</h1>

		</nav>
	</div>
	<br>
	<div class="container-fluid ">
		<div class="row">
			<div class="col-2 ">

				<button type="button" class="btn btn-primary btn-block">Aggiungi
					Candidato</button>


				<button type="button" class="btn btn-primary btn-block">Aggiungi
					Mansione</button>
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
						<c:forEach var="emp" items="${list}">
							<tr>
								<td>${emp.nome}</td>
								<td>${emp.cognome}</td>
								<td>${emp.mansione}</td>
								<td>${emp.seniority}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>