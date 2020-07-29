<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/053b00be10.js" crossorigin="anonymous"></script>

<link rel="icon" href="/favicon-32x32.png" type="image/png" />
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
<title>Candidato</title>
</head>
<body>
	<div>
		<nav class="navbar navbar-dark bg-dark "
			style="opacity: 0.8; box-shadow: 10px 10px 5px grey;">
			<h1>
				<span class="navbar-text  text-white"> <a
					href="/ProgettoHR/Home"><img alt="logo"
						src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4"></a></span>

			</h1>

		</nav>
	</div>
	<br>
	<!-- 	<div class="col-auto p-0 opacity-0 h-100 d-inline-block"
		>


		<a href="/ProgettoHR/Mansioni" type="button"
			class="btn btn-primary btn-block  m-0">Aggiungi Mansione del cazzo la madonna</a> <a
			href="/ProgettoHR/Home" type="button"
			class="btn btn-primary btn-block  m-0">Torna alla Home</a>



	</div> -->
	<div class="container-fluid ">
		<div class="row">
			<div class="col-auto p-0">


				<a href="/ProgettoHR/Mansioni" type="button"
					class="btn btn-secondary btn-block  m-0 " style="border-radius: 0;">Aggiungi Mansione</a> <a href="/ProgettoHR/Home" type="button"
					class="btn btn-secondary btn-block  m-0 " style="border-radius: 0;">Torna alla Home</a>



			</div>
			<!-- 	<div class="col-2 p-0 bg-primary opacity-0 h-100 d-inline-block"  >

				<button type="button" class="btn btn-primary btn-block" style="border-radius: 0;">Aggiungi
					Candidato</button>


				<button type="button" class="btn btn-primary btn-block" style="border-radius: 0;">Aggiungi
					Mansione</button>
					
				<div style="width:100%; color:black; opacity:0.6; ">PROVA</div>
			</div> -->

			<div class="col-auto">

				<table class="table table-bordered  text-center "
					style="box-shadow: 10px 10px 5px grey;">
					<!-- <thead> -->
					<tbody>



						<tr>
							<th scope="col">Nome</th>
							<td scope="col">${mostraCandidato.nome}</td>
						</tr>
						<tr>
							<th scope="col">Cognome</th>
							<td scope="col">${mostraCandidato.cognome}</td>
						</tr>
						<tr>
							<th scope="col">Anno di nascita</th>
							<td scope="col">${mostraCandidato.anno}</td>
						</tr>
						<tr>
							<th scope="col">N Telefonico</th>
							<td scope="col">${mostraCandidato.telefono}</td>
						</tr>
						<tr>
							<th scope="col">Email</th>
							<td scope="col">${mostraCandidato.email}</td>
						</tr>
						<tr>
							<th scope="col">Mansione</th>
							<td scope="col">${mostraCandidato.mansione}</td>
						</tr>
						<tr>
							<th scope="col">Seniority</th>
							<td scope="col">${mostraCandidato.seniority}</td>
						</tr>
						<tr>
							<th scope="col">specializzazione</th>
							<td scope="col">${mostraCandidato.specializzazione}</td>
						</tr>
						<tr>

						</tr>



					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>