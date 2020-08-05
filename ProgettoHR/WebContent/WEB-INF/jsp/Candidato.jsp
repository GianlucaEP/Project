<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/053b00be10.js"
	crossorigin="anonymous"></script>

<link rel="icon" href="/favicon-32x32.png" type="image/png" />
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
<title>Candidato</title>
</head>
<body
	onload="changeStato('${mostraCandidato.stato.descrizione}', '${mostraFeedback}')">
	<div class="row w-100 p-0 m-0">
		<nav class="navbar navbar-light bg-primary w-100 "
			style="opacity: 0.8;">
			<h1>
				<span class="navbar-text  text-white"> <a
					href="/ProgettoHR/Home"><img alt="logo"
						src="/ProgettoHR/img/Erre_technology_group_NEW.png" class="col-4"></a></span>

			</h1>

			<button class="btn btn-primary dropdown-toggle" role="button"
				id="logout" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
				<i class="fas fa-user"></i>
			</button>

		</nav>
	</div>

	<!-- 	<div class="col-auto p-0 opacity-0 h-100 d-inline-block"
		>


		<a href="/ProgettoHR/Mansioni" type="button"
			class="btn btn-primary btn-block  m-0">Aggiungi Mansione del cazzo la madonna</a> <a
			href="/ProgettoHR/Home" type="button"
			class="btn btn-primary btn-block  m-0">Torna alla Home</a>



	</div> -->
	<div class="container-fluid ">
		<div class="row">
			<div class="col-2 p-0 bg-primary" style="opacity: 0.8;">

				<a href="/ProgettoHR/Home" type="button"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">Torna alla Home<i
					class="fas fa-home float-right"></i></a>
				<button type="button" data-toggle="modal"
					data-target="#modificaModal"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">
					Modifica Candidato<i class="fas fa-pen float-right"></i>
				</button>

				<button onclick="impostaTipoFeedback('colloquio HR')" type="button"
					data-toggle="modal" data-target="#feedbackModal"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">
					+ Colloquio HR<i class="fas fa-user-tie float-right"></i>
				</button>

				<button onclick="impostaTipoFeedback('colloquio Tecnico')"
					type="button" data-toggle="modal" data-target="#feedbackModal"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">
					+ Colloquio Tecnico<i class="fas fa-user float-right"></i>
				</button>

				<button onclick="impostaTipoFeedback('mail')" type="button"
					data-toggle="modal" data-target="#feedbackModal"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">
					+ Mail <i class="fas fa-envelope-open-text float-right"></i>
				</button>

				<button onclick="impostaTipoFeedback('social')" type="button"
					data-toggle="modal" data-target="#feedbackModal"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">
					+ Social <i class="fas fa-comment-dots float-right"></i>
				</button>

				<button onclick="impostaTipoFeedback('telefonata')" type="button"
					data-toggle="modal" data-target="#feedbackModal"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">
					+ Telefonata <i class="fas fa-phone float-right"></i>
				</button>

				<a href="/ProgettoHR/Mansioni" type="button"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">+ Mansione <i
					class="fas fa-briefcase float-right"></i></a>

				<button type="button" data-toggle="modal"
					data-target="#feedbackModal"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">+ Qualification Meeting</button>

				<button type="button" data-toggle="modal"
					data-target="#feedbackModal"
					class="btn btn-primary btn-block  m-0 text-left"
					style="border-radius: 0;">+ Economics</button>


			</div>
			<!-- 	<div class="col-2 p-0 bg-primary opacity-0 h-100 d-inline-block"  >

				<button type="button" class="btn btn-primary btn-block" style="border-radius: 0;">Aggiungi
					Candidato</button>


				<button type="button" class="btn btn-primary btn-block" style="border-radius: 0;">Aggiungi
					Mansione</button>
					
				<div style="width:100%; color:black; opacity:0.6; ">PROVA</div>
			</div> -->

			<div class="col-auto p-2 justify-content-md-end">

				<table class="table table-bordered  text-center "
					style="box-shadow: 10px 10px 5px grey;">
					<!-- <thead> -->
					<tbody>

						<tr>
							<th scope="col">Stato</th>
							<td scope="col"><button
									class="btn btn-primary dropdown-toggle" role="button"
									id="menuStato" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"></button>

								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item"
										href="/ProgettoHR/Aggiorna/${ mostraCandidato.id }/daContattare">Da
										contattare</a> <a class="dropdown-item"
										href="/ProgettoHR/Aggiorna/${ mostraCandidato.id }/scartato">Scartato</a>
									<a class="dropdown-item"
										href="/ProgettoHR/Aggiorna/${ mostraCandidato.id }/attivo">Attivo</a>
									<a class="dropdown-item"
										href="/ProgettoHR/Aggiorna/${ mostraCandidato.id }/selezionato">Selezionato</a>
								</div></td>
						</tr>

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
							<th scope="col">Provenienza</th>
							<td scope="col">${mostraCandidato.provenienza}</td>
						</tr>
						<tr>
							<th scope="col">Categoria Protetta</th>
							<td scope="col" id="categoriaProtetta">${mostraCandidato.categoriaProtetta}</td>
						</tr>
						<tr>
							<th scope="col">Business</th>
							<td scope="col">${mostraCandidato.business.business}</td>
						</tr>
						<tr>
							<th scope="col">Area Competenza</th>
							<td scope="col">${mostraCandidato.area.area}</td>
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
							<th scope="col">Specializzazione</th>
							<td scope="col">${mostraCandidato.specializzazione}</td>
						</tr>
						<tr>
							<th scope="col">Inserimento Azienda</th>
							<td scope="col">${mostraCandidato.inserimentoAzienda}</td>
						</tr>



					</tbody>
				</table>
			</div>
			<div class="col-auto p-2 justify-content-md-end">

				<table class="table table-bordered  text-center "
					style="box-shadow: 10px 10px 5px grey;" id="feedbackTable">
					<thead>
						<tr>
							<th scope="col">Data</th>
							<th scope="col">Tipo</th>
							<th scope="col">Feedback</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="feed" items="${mostraFeedback}">
							<tr>
								<td>${feed.data}</td>
								<td>${feed.tipo.tipo}</td>
								<td>${feed.commento}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modificaModal" tabindex="-1" role="dialog"
		aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Modifica</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form method="POST"
							action="/ProgettoHR/Modifica/${mostraCandidato.id}/${mostraCandidato.stato.descrizione}">
							<!-- modelAttribute="modificaCandidato" -->

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Nome:</div>
										<input type="text" class="form-control" id="nome" name="nome"
											value="${mostraCandidato.nome}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Cognome:</div>
										<input type="text" class="form-control" id="cognome"
											name="cognome" value="${mostraCandidato.cognome}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Anno
											di nascita:</div>
										<input type="text" class="form-control" id="anno" name="anno"
											value="${mostraCandidato.anno}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Telefono:</div>
										<input type="text" class="form-control" id="telefono"
											name="telefono" value="${mostraCandidato.telefono}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Email:</div>
										<input type="text" class="form-control" id="email"
											name="email" value="${mostraCandidato.email}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Mansione:</div>
										<input type="text" class="form-control" id="mansione"
											name="mansione" value="${mostraCandidato.mansione}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Specializzazione:</div>
										<textarea style="resize: none;" class="form-control"
											id="specializzazione" name="specializzazione"></textarea>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Seniority:</div>
										<input type="text" class="form-control" id="seniority"
											name="seniority" value="${mostraCandidato.seniority}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Inserimento
											Azienda:</div>
										<!--<fmt:formatDate pattern="YYYY-MM-DD" value="${candidato.inserimentoAzienda}" />-->
										<input type="date" class="form-control"
											id="inserimentoAzienda" name="inserimentoAzienda"
											value="${mostraCandidato.inserimentoAzienda}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Cancella</button>
								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="feedbackModal" tabindex="-1" role="dialog"
		aria-labelledby="feedbackModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="feedbackModalLabel">Feedback</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form method="POST"
							action="/ProgettoHR/AggiungiFeedback/${mostraCandidato.id}">
							<!-- modelAttribute="modificaCandidato" -->
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Tipo</div>
										<input type="text" class="form-control" id="tipoFeedback"
											name="tipoFeedback" value="${tipoFeedback.tipo}"></input>
									</div>
								</div>
							</div>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data:</div>
										<!--<fmt:formatDate pattern="YYYY-MM-DD" value="${feedback.data}" />-->
										<input type="date" pattern="yyyy-MM-dd" class="form-control"
											id="data" name="data" value="${feedback.data}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<input type="text" class="form-control" id="feedback"
											name="feedback" value="${feedback.commento}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Aggiungi
										Feedback</button>
								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>





	<script type="text/javascript">
		function changeStato(stato, feedback) {
			if (stato === "nuovo_inserito") {
				document.getElementById("menuStato").className = "btn btn-secondary dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Nuovo Inserito";
			} else if (stato === "da_contattare") {
				document.getElementById("menuStato").className = "btn btn-warning dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Da Contattare";
			} else if (stato === "scartato") {
				document.getElementById("menuStato").className = "btn btn-danger dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Scartato";
			} else if (stato === "attivo") {
				document.getElementById("menuStato").className = "btn btn-success dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Attivo";
			} else if (stato === "selezionato") {
				document.getElementById("menuStato").className = "btn btn-primary dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Selezionato";
			}

			removeFeedbackTable(feedback);
			checkCategoriaProtetta();

		}

		function removeFeedbackTable(feedback) {
			if (feedback === "[]") {
				var myobj = document.getElementById("feedbackTable");
				myobj.remove();
			}
		}

		function checkCategoriaProtetta() {
			if (document.getElementById("categoriaProtetta").val)
				document.getElementById("categoriaProtetta").innerHTML = "SI";
			else
				document.getElementById("categoriaProtetta").innerHTML = "NO";
		}

		function impostaTipoFeedback(tipoFeedback) {
			if (tipoFeedback === "mail") {
				document.getElementById("tipoFeedback").value = tipoFeedback;
			} else if (tipoFeedback === "telefonata") {
				document.getElementById("tipoFeedback").value = tipoFeedback;
			} else if (tipoFeedback === "colloquio HR") {
				document.getElementById("tipoFeedback").value = tipoFeedback;
			} else if (tipoFeedback === "colloquio Tecnico") {
				document.getElementById("tipoFeedback").value = tipoFeedback;
			} else if (tipoFeedback === "social") {
				document.getElementById("tipoFeedback").value = tipoFeedback;
			}
		}
	</script>
</body>
</html>