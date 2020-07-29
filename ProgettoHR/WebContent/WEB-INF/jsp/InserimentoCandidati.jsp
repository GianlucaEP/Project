<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserimento Candidati</title>
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
	<div>
		<nav class="navbar navbar-dark bg-primary " style="opacity: 0.8; box-shadow: 10px 10px 5px grey;">
			<h1>
				<span class="navbar-text bg-primary text-white"> 
					<a href="/ProgettoHR/Home"><img
					alt="logo" src="/ProgettoHR/img/Erre_technology_group_NEW.png"
					
			class="col-4"></a>
				</span>
				
			</h1>

		</nav>
	</div>
	<div align="center" class="container-fluid ">
		<div class="row p-2 justify-content-md-center">
			<div class="col-auto p-2 border rounded">
				<h1>Inserimento Candidato</h1>
				<form:form method="POST" modelAttribute="candidato"  action="/ProgettoHR/CandidatiSave">
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Nome:</div>
								<form:input path="nome" type="text" class="form-control" id="nome" name="nome"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Cognome:</div>
								<form:input path="cognome" type="text" class="form-control" id="cognome"
									name="cognome"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Anno
									di nascita:</div>
								<form:input path="anno" type="text" class="form-control" id="anno"
									name="anno"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Telefono:</div>
								<form:input path="telefono" type="text" class="form-control" id="telefono"
									name="telefono"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Email:</div>
								<form:input path="email" type="text" class="form-control" id="email" name="email"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Mansione:</div>
								<form:input path="mansione" type="text" class="form-control" id="mansione"
									name="mansione"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Seniority:</div>
								<form:textarea style="resize: none;" path="seniority" type="text" class="form-control" id="seniority"
									name="seniority"></form:textarea>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Specializzazione:</div>
								<form:input path="specializzazione" type="text" class="form-control" id="specializzazione"
									name="competenza"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Inserimento
									Azienda:</div>
									<!--<fmt:formatDate pattern="YYYY-MM-DD" value="${candidato.inserimentoAzienda}" />-->
								<form:input path="inserimentoAzienda" type="date" class="form-control" id="inserimentoAzienda"
									name="inserimentoAzienda"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<button type="submit" class="btn btn-primary btn-block">Salva</button>
							<button type="reset" class="btn btn-danger btn-block">Cancella</button>
						</div>
					</div>
				</form:form>
			</div>

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
