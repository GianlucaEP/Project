<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

</head>
<body>
	<div>
		<nav class="navbar navbar-dark bg-dark">
			<h1><span class="navbar-text">Erre Technology <button class="btn btn-dark"></button> </span></h1>
			
		</nav>
	</div>
	<div align="center" class="container-fluid ">
		<div align="center" class="col-sm-2 col-md-4 m-0 mt-2 p-2 border rounded">
			<div class="row p-2 justify-content-md-center" align="center">
				<h1>Inserimento Candidati</h1>
			</div>
			<form name="registrationForm"
				action="/RTWeb/CheckString" method="POST">
				<div class="form-group">
					<div class="row p-2 mb-0 w-100 justify-content-md-start">
						<label class="mb-0"
							style="display: inline-block; text-align: left;" for="fname">Nome:</label>
					</div>

					<div align="center"
						class="row m-0 w-100 justify-content-md-start">
						<br>
							<input class="form-control w-100" type="text" id="nome"
								name="nome"></input>
							<br>
					</div>
				</div>
				<div class="form-group">
					<div class="row p-2 mb-0 w-100 justify-content-md-start">
						<label class="mb-0"
							style="display: inline-block; text-align: left;" for="fname">Cognome:</label>
					</div>

					<div align="center"
						class="row m-0 w-100 justify-content-md-start">
						<br>
						
							<input class="form-control w-100" type="text" id="cognome" name="cognome"></input>
						<br>
					</div>
				</div>
				<div class="form-group">
					<div class="row p-2 mb-0 w-100 justify-content-md-start">
						<label class="mb-0"
							style="display: inline-block; text-align: left;" for="fname">Indirizzo:</label>
					</div>

					<div align="center"
						class="row m-0 w-100 justify-content-md-start">
						<br>
							<input class="form-control w-100" type="text" id="indirizzo" name="indirizzo"></input>
						<br>
					</div>
				</div>

				<div class="form-group">
					<div class="row p-2 mb-0 w-100 justify-content-md-start">
						<label class="mb-0"
							style="display: inline-block; text-align: left;" for="fname">Mail:</label>
					</div>

					<div align="center"
						class="row m-0 w-100 justify-content-md-start">
						<br>
							<input class="form-control w-100" type="text" id="mail" name="mail"></input>
						<br>
					</div>
				</div>

				<div class="form-group">
					<div class="row p-2 mb-0 w-100 justify-content-md-start">
						<label class="mb-0"
							style="display: inline-block; text-align: left;" for="fname">Numero
							telefonico:</label>
					</div>

					<div align="center"
						class="row m-0 w-100 justify-content-md-start">
						<br>
							<input class="form-control w-100" type="text" id="numeroTelefono"
								name="numeroTelefono"></input>
						<br>
					</div>
				</div>

				<div class="form-group">
					<div class="row p-2 mb-0 w-100 justify-content-md-start">
						<label class="mb-0"
							style="display: inline-block; text-align: left;" for="fname">Data
							nascita:</label>
					</div>

					<div align="center"
						class="row m-0 w-100 justify-content-md-start">
						<br>
						<%-- <fmt:formatDate value="${cForm.dataNascita}" pattern="MM-dd-yyyy"
							var="dateFormat" /> --%>
							<input class="form-control w-100" type="date" id="dataNascita"
								name="dataNascita"></input>
						<br>
					</div>
				</div>

				<div class="form-group">
					<div class="row p-2 mb-0 w-100 justify-content-md-start">
						<label class="mb-0"
							style="display: inline-block; text-align: left;" for="fname">Competenze:</label>
					</div>

					<div align="center"
						class="row m-0 w-100 justify-content-md-start">
						<br>
							<input class="form-control w-100" type="text" id="competenceName"
								name="competenceName"></input>
						<br>
					</div>
				</div>
				<!--<div align="center"
					class="row p-2 m-0 w-100 justify-content-md-start">
					<br> <form class="w-100" type="text" id="competence"
						name="competence"></form> <br>
				</div>-->

				<div align="center"
					class="row p-2 m-0 w-100 justify-content-md-start">
					<input type="submit" class="btn btn-secondary btn-block"
						value="Salva"> <input type="reset"
						class="btn btn-danger btn-block" value="Cancella">
				</div>
			</form>
		</div>

	</div>

	<!-- <div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="errorModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Errore</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Uno dei campi inseriti è vuoto</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="loadingModal" tabindex="-1" role="dialog"
		aria-labelledby="loadingModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Errore</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Caricamento Dati...</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div> -->

</body>
</html>
