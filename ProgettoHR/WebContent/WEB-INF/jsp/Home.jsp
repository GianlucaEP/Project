<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
		<nav class="navbar navbar-dark bg-primary">
			<h1>
				<span class="navbar-text">Erre Technology </span>
			</h1>

		</nav>
	</div>

	<div class="container">
		<div class="col">
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nome</th>
							<th scope="col">Cognome</th>
							<th scope="col">Mansione</th>
							<th scope="col">Seniority</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="emp" items="${list}">
							<tr>
								<td>${emp.id}</td>
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