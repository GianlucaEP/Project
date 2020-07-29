<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="icon" href="/img/favicon.ico" />
 
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
<title>Insert title here</title>
</head>
<body>
	<div>
		<nav class="navbar navbar-dark bg-primary " style="opacity: 0.8">
			<h1>
				<span class="navbar-text bg-primary text-white"> 
				
				</span>
				<img
					alt="logo" src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4">
			</h1>

		</nav>
	</div>
	<br>
	<div class="col-2 p-0 bg-primary opacity-0 h-100 d-inline-block" style="float:left;" >

				<button type="button" class="btn btn-primary btn-block" style="border-radius: 0;">Aggiungi
					Candidato</button>


				<button type="button" class="btn btn-primary btn-block" style="border-radius: 0;">Aggiungi
					Mansione</button>
					
				
			</div>
	<div class="container-fluid ">
		<div class="row">
		<!-- 	<div class="col-2 p-0 bg-primary opacity-0 h-100 d-inline-block"  >

				<button type="button" class="btn btn-primary btn-block" style="border-radius: 0;">Aggiungi
					Candidato</button>


				<button type="button" class="btn btn-primary btn-block" style="border-radius: 0;">Aggiungi
					Mansione</button>
					
				<div style="width:100%; color:black; opacity:0.6; ">PROVA</div>
			</div> -->

			<div class="col-auto">

				<table
					class="table table-bordered  text-center "
					style="box-shadow: 10px 10px 5px grey;">
					<!-- <thead> -->
					<tbody>



						<tr>
							<th scope="col">Nome</th>
							<td scope="col">${emp.nome}</td>
						</tr>
						<tr>
							<th scope="col">Cognome</th>
							<td scope="col">${emp.cognome}</td>
						</tr>
						<tr>
							<th scope="col">Anno di nascita</th>
							<td scope="col">${emp.anno}</td>
						</tr>
						<tr>
							<th scope="col">N Telefonico</th>
							<td scope="col">${emp.telefono}</td>
						</tr>
						<tr>
							<th scope="col">Email</th>
							<td scope="col">${emp.email}</td>
						</tr>
						<tr>
							<th scope="col">Mansione</th>
							<td scope="col">${emp.mansione}</td>
						</tr>
						<tr>
							<th scope="col">Seniority</th>
							<td scope="col">${emp.seniority}</td>
						</tr>
						<tr>
					<th scope="col">specializzazione</th>
							<td scope="col">${emp.specializzazione}</td>
						</tr>
						<tr>
							<th scope="col">Inserimento in azienda</th>
							<td scope="col">${emp.inserimentoAzienda}</td>
						</tr>
					


					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>