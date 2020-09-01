<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>

<!--Link CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="icon" href="/favicon-32x32.png" type="image/png" />

<!--Script-->
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
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<!--Meta-->
<meta charset="ISO-8859-1">
<title>Candidato</title>

</head>

<body
	onload="changeStato('${mostraCandidato.stato.descrizione}', '${mostraFeedback}', '${mostraCandidato.categoriaProtetta}', '${mostraCandidato.qm}', '${mostraCandidato.file}', '${mostraCandidato.costo}', '${mostraCandidato.economics}' )">

	<!-- Navbar -->
	<div class="container-fluid">
		<div class="row w-100 p-0 m-0">
			<nav class="navbar navbar-light fixed-top bg-primary w-100 "
				style="opacity: 0.9;">

				<!-- Logo -->
				<nav class="navbar">
					<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}"> <img
						src="/ProgettoHR/img/Erre_technology_group_NEW.png"
						style="width: 170px;">
					</a>
				</nav>

				<!-- bottone profilo -->
				<div class="col-auto text-right">
					<button class="btn btn-primary dropdown-toggle"
						style="border-radius: 10px; box-shadow: 0px 0px 2px black;"
						role="button" id="logout" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user"></i>
					</button>
				</div>

			</nav>
		</div>
	</div>

	<!-- Bottoni laterali -->
	<div style="margin-top: 110px;" class="container-fluid ">
		<div class="row ">
			<div class="col-1.5"
				style="opacity: 0.9; border-radius: 1px 10px 10px 5px; background-color: #0466c8;">


				<c:forEach var="funz" items="${ruolo.funzionalita}">
					<c:choose>
						<c:when test="${funz.funzionalita == 'aggiunta mansione'}">
							<button data-toggle="modal" data-target="#aggiungiMansione"
								type="button" class="btn btn-dark btn-block mt-1 text-left"
								style="background-color: #0353a4; border-color: transparent; border-radius: 1px 10px 10px 1px;">
								<i class="fas fa-plus-square mr-1"></i> Mansione <i
									class="fas fa-briefcase" style="vertical-align: auto;"></i>
							</button>
						</c:when>
					</c:choose>
				</c:forEach>

				<c:forEach var="funz" items="${ruolo.funzionalita}">
					<c:choose>
						<c:when
							test="${funz.funzionalita == 'aggiunta qualification meeting'}">
							<button type="button" data-toggle="modal"
								data-target="#qualificationMeetingModal"
								class="btn btn-dark btn-block  mt-1 text-left"
								style="background-color: #0353a4; border-color: transparent; border-radius: 1px 10px 10px 1px;">
								<i class="fas fa-plus-square"></i> Qualification meeting <i
									class="fas fa-brain"></i>
							</button>
						</c:when>
					</c:choose>
				</c:forEach>

				<c:forEach var="funz" items="${ruolo.funzionalita}">
					<c:choose>
						<c:when test="${funz.funzionalita == 'aggiunta economics'}">
							<button type="button" data-toggle="modal"
								data-target="#modificaEconomicsModal"
								class="btn btn-dark btn-block  mt-1 text-left"
								style="background-color: #0353a4; border-color: transparent; border-radius: 1px 10px 10px 1px;">
								<i class="fas fa-plus-square"></i> Economics<i
									class="fas fa-coins pl-1"></i>
							</button>
						</c:when>
					</c:choose>
				</c:forEach>

				<c:forEach var="funz" items="${ruolo.funzionalita}">
					<c:choose>
						<c:when test="${funz.funzionalita == 'aggiunta costi'}">
							<button type="button" data-toggle="modal"
								data-target="#modificaCostiModal"
								class="btn btn-dark btn-block  mt-1 text-left"
								style="background-color: #0353a4; border-color: transparent; border-radius: 1px 10px 10px 1px;">
								<i class="fas fa-plus-square"></i> Costi<i
									class="fas fa-euro-sign pl-1"></i>
							</button>
						</c:when>
					</c:choose>
				</c:forEach>

				<!-- Dropdown feedback -->
				<c:forEach var="funz" items="${ruolo.funzionalita}">
					<c:choose>
						<c:when test="${funz.funzionalita == 'aggiunta feedback'}">
							<div>

								<button
									class="btn btn-primary btn-block mt-1 text-center dropdown-toggle "
									style="background-color: #0353a4; border-color: transparent; border-radius: 1px 10px 10px 1px;"
									role="button" id="menuFeedback" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">Feedback</button>

								<div class="dropdown-menu"
									style="background-color: transparent; border-color: transparent;"
									aria-labelledby="dropdownMenuLink">

									<button onclick="impostaTipoFeedback('Colloquio HR')"
										type="button" data-toggle="modal" data-target="#feedbackModal"
										class="btn btn-primary btn-block m-0 text-left"
										style="background-color: #03045e; border-color: transparent; border-radius: 10px 10px 10px 10px;">
										<i class="fas fa-plus-square mr-1"></i> Colloquio HR<i
											class="fas fa-user-tie pl-1" style="vertical-align: auto;"></i>
									</button>

									<button onclick="impostaTipoFeedback('Colloquio Tecnico')"
										type="button" data-toggle="modal" data-target="#feedbackModal"
										class="btn btn-primary btn-block mt-1 text-left"
										style="background-color: #03045e; border-color: transparent; border-radius: 10px 10px 10px 10px;">
										<i class="fas fa-plus-square mr-1"></i> Colloquio tecnico<i
											class="fas fa-user pl-1" style="vertical-align: auto;"></i>
									</button>

									<button onclick="impostaTipoFeedback('Mail')" type="button"
										data-toggle="modal" data-target="#feedbackModal"
										class="btn btn-success btn-block mt-1 text-left"
										style="background-color: #03045e; border-color: transparent; border-radius: 10px 10px 10px 10px;">
										<i class="fas fa-plus-square mr-1"></i> E-mail <i
											class="fas fa-envelope-open-text pl-1"
											style="vertical-align: auto;"></i>
									</button>

									<button onclick="impostaTipoFeedback('Social')" type="button"
										data-toggle="modal" data-target="#feedbackModal"
										class="btn btn-success btn-block mt-1 text-left"
										style="background-color: #03045e; border-color: transparent; border-radius: 10px 10px 10px 10px;">
										<i class="fas fa-plus-square mr-1"></i> Social network <i
											class="fas fa-comment-dots pl-1"
											style="vertical-align: auto;"></i>
									</button>

									<button onclick="impostaTipoFeedback('Telefonata')"
										type="button" data-toggle="modal" data-target="#feedbackModal"
										class="btn btn-success btn-block mt-1 text-left"
										style="background-color: #03045e; border-color: transparent; border-radius: 10px 10px 10px 10px;">
										<i class="fas fa-plus-square mr-1"></i> Telefonata <i
											class="fas fa-phone pl-1" style="vertical-align: auto;"></i>
									</button>

								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>

				<!-- Bottone AGGIUNTA FILE -->
				<c:forEach var="funz" items="${ruolo.funzionalita}">
					<c:choose>
						<c:when test="${funz.funzionalita == 'aggiunta allegati'}">
							<button type="button"
								class="btn btn-primary btn-block mt-1 text-center"
								style="background-color: #0353a4; border-color: transparent; border-radius: 1px 10px 10px 1px;"
								data-toggle="modal" data-target="#allegatiModal">
								Allegati <i class="fa fa-upload text-right " aria-hidden="true"></i>
							</button>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>

			<!-- Colonna principale che contiene tutte le altre-->
			<div class="col-10">
				<!-- Row principale che tiene tutte le collone-->
				<div class="row">

					<!-- COLONNA 1-->
					<div class="col-6">
						<!-- Tabella ANAGRAFICA -->
						<table
							class="table table-bordered text-left shadow p-4 ml-2 mb-4 bg-white">
							<tbody>
								<tr>
									<th colspan=2 class="text-center table-info"
										style="background-color: #90e0ef">ANAGRAFICA <c:forEach
											var="funz" items="${ruolo.funzionalita}">
											<c:choose>
												<c:when test="${funz.funzionalita == 'modifica anagrafica'}">
													<!-- Bottone modifica anagrafica -->
													<button type="button" data-toggle="modal"
														data-target="#modificaAnagraficaModal"
														class="btn btn-info float-md-right">
														<i class="fas fa-pen "></i>
													</button>
												</c:when>
											</c:choose>
										</c:forEach>

									</th>
								</tr>
								<c:forEach var="funz" items="${ruolo.funzionalita}">
									<c:choose>
										<c:when test="${funz.funzionalita == 'modifica anagrafica'}">
											<tr>

												<th scope="col">Stato</th>
												<td scope="col"><button
														class="btn btn-primary dropdown-toggle" role="button"
														id="menuStato" data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false"></button> <!-- Dropdown per stati candidato -->
													<div class="dropdown-menu"
														aria-labelledby="dropdownMenuLink">
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
										</c:when>
									</c:choose>
								</c:forEach>
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
									<th scope="col">Telefono</th>
									<td scope="col">${mostraCandidato.telefono}</td>
								</tr>
								<tr>
									<th scope="col">E-mail</th>
									<td scope="col">${mostraCandidato.email}</td>
								</tr>
								<c:forEach var="funz" items="${ruolo.funzionalita}">
									<c:choose>
										<c:when
											test="${funz.funzionalita == 'visualizza anagrafica completa'}">
											<tr>
												<th scope="col">Provenienza candidatura</th>
												<td scope="col">${mostraCandidato.provenienza}</td>
											</tr>

											<tr>
												<th scope="col">Categoria protetta</th>
												<td scope="col" id="categoriaProtetta"></td>
											</tr>
										</c:when>
									</c:choose>
								</c:forEach>

							</tbody>
						</table>

						<!-- tabella ECONOMICS -->
						<c:forEach var="funz" items="${ruolo.funzionalita}">
							<c:choose>
								<c:when test="${funz.funzionalita == 'visualizza economics'}">
									<table id="economicsTable"
										class="table table-bordered text-left shadow p-4 ml-2 mb-4 bg-white">
										<tbody>

											<tr>
												<th colspan=2 class="text-center table-warning ">ECONOMICS
													<c:forEach var="funz" items="${ruolo.funzionalita}">
														<c:choose>
															<c:when
																test="${funz.funzionalita == 'modifica economics'}">
																<!-- Bottone modifica economics-->
																<button type="button" data-toggle="modal"
																	data-target="#modificaEconomicsModal"
																	class="btn btn-warning float-md-right">
																	<i class="fas fa-pen "></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach>
												</th>
											</tr>
											<tr>
												<th scope="col">Inquadramento</th>
												<td scope="col">${mostraCandidato.economics.inquadramento}</td>
											</tr>
											<tr>
												<th scope="col">RAL</th>
												<td scope="col">${mostraCandidato.economics.ral}</td>
											</tr>
											<tr>
												<th scope="col">Benefit</th>
												<td scope="col">${mostraCandidato.economics.benefit}</td>
											</tr>
											<tr>
												<th scope="col">Preavviso</th>
												<td scope="col">${mostraCandidato.economics.preavviso}</td>
											</tr>
											<tr>
												<th scope="col">Desiderata</th>
												<td scope="col">${mostraCandidato.economics.desiderata}</td>
											</tr>

										</tbody>
									</table>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>


					<!-- COLONNA 2 -->
					<div class="col-6 justify-content-start">
						<!-- tabella BUSINESS-->
						<c:forEach var="funz" items="${ruolo.funzionalita}">
							<c:choose>
								<c:when
									test="${funz.funzionalita == 'visualizza profilo professionale'}">
									<table
										class="table table-bordered text-left shadow p-4 ml-2 mb-4 bg-white">
										<tbody>

											<tr>
												<th colspan=2 class="text-center table-success"
													style="background-color: #77bfa3">BUSINESS <c:forEach
														var="funz" items="${ruolo.funzionalita}">
														<c:choose>
															<c:when
																test="${funz.funzionalita == 'modifica profilo professionale'}">
																<!-- Bottone modifica business -->
																<button type="button" data-toggle="modal"
																	data-target="#modificaBusinessModal"
																	class="btn btn-success float-md-right">
																	<i class="fas fa-pen "></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach>
												</th>
											</tr>

											<tr>
												<th scope="col">Business unit</th>
												<td scope="col">${mostraCandidato.business.business}</td>
											</tr>
											<tr>
												<th scope="col">Area di competenza</th>
												<td scope="col"><c:forEach var="area"
														items="${mostraCandidato.area}">
														<span>${area.area}</span>
													</c:forEach></td>
											</tr>
											<tr>
												<th scope="col">Mansione</th>
												<td scope="col"><c:forEach var="mansione"
														items="${mostraCandidato.mansione}">
														<span>${mansione.mansione}</span>
													</c:forEach></td>
											</tr>
											<tr>
												<th scope="col">Seniority</th>
												<td scope="col">${mostraCandidato.seniority.seniority}</td>
											</tr>
											<tr>
												<th scope="col">Specializzazione</th>
												<td scope="col"><c:forEach var="specializzazione"
														items="${mostraCandidato.candidatoSpecializzazione}">
														<span>${specializzazione.specializzazione.specializzazione}
															&nbsp ${specializzazione.anni} anni esperienza</span>
													</c:forEach></td>
											</tr>
											<tr>
												<th scope="col">Inserimento azienda</th>
												<td scope="col">${mostraCandidato.inserimentoAzienda}</td>
											</tr>

										</tbody>
									</table>
								</c:when>
							</c:choose>
						</c:forEach>

						<!--tabella COSTI -->
						<c:forEach var="funz" items="${ruolo.funzionalita}">
							<c:choose>
								<c:when test="${funz.funzionalita == 'visualizza costi'}">
									<table id="costiTable"
										class="table table-bordered text-left shadow p-4 ml-2 mb-4 bg-white">
										<tbody>

											<tr>
												<th colspan=2 class="text-center table-danger">COSTI <c:forEach
														var="funz" items="${ruolo.funzionalita}">
														<c:choose>
															<c:when test="${funz.funzionalita == 'modifica costi'}">
																<!-- Bottone modifica costi-->
																<button type="button" data-toggle="modal"
																	data-target="#modificaCostiModal"
																	class="btn btn-danger float-md-right"
																	style="border-color: transparent;">
																	<i class="fas fa-pen "></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach>
												</th>
											</tr>
											<tr>
												<th scope="col">Costo orario</th>
												<td scope="col">${mostraCandidato.costo.orario}</td>
											</tr>
											<tr>
												<th scope="col">Costo giornaliero</th>
												<td scope="col">${mostraCandidato.costo.giornaliero}</td>
											</tr>
											<tr>
												<th scope="col">Commenti</th>
												<td scope="col">${mostraCandidato.costo.commento}</td>
											</tr>

										</tbody>
									</table>
								</c:when>
							</c:choose>
						</c:forEach>

					</div>
				</div>

				<div class="row justify-content-center">
					<!-- COLONNA 3 -->
					<div class="col-12">

						<!-- tabella QUALIFICATION MEETING-->
						<table id="qualificationMeetingTable"
							class="table table-bordered text-left shadow p-4 ml-2 mb-4 bg-white">
							<thead>

								<tr>
									<th colspan=6 class="text-center table-success"
										style="background-color: #fca311">QUALIFICATION MEETING <!-- Bottone modifica qualification meeting-->

									</th>
								</tr>

								<tr>

									<th scope="col">Cliente</th>
									<th scope="col">Data di presentazione</th>
									<th scope="col">Riferimento gara</th>
									<th scope="col">Data colloquio</th>
									<th scope="col">Feedback</th>

								</tr>

							</thead>

							<tbody>


								<c:forEach var="qualificationMeeting"
									items="${mostraCandidato.qm}">
									<tr>
										<td>${qualificationMeeting.cliente}</td>
										<td>${qualificationMeeting.dataPresentato}</td>
										<td>${qualificationMeeting.riferimentoGara}</td>
										<td>${qualificationMeeting.dataColloquio}</td>
										<td>${qualificationMeeting.feedback}</td>
										<td><c:forEach var="funz" items="${ruolo.funzionalita}">
												<c:choose>
													<c:when
														test="${funz.funzionalita == 'modifica qualification meeting'}">
														<button
															onclick="impostaParametriQualificationMeeting('${qualificationMeeting.id}', '${qualificationMeeting.cliente}', '${qualificationMeeting.dataPresentato}', '${qualificationMeeting.riferimentoGara}', '${qualificationMeeting.dataColloquio}', '${qualificationMeeting.feedback}' )"
															type="button" data-toggle="modal"
															data-target="#modificaQualificationMeetingModal"
															class="btn btn-light float-md-right"
															style="background-color: #fcbf49; border-color: transparent;">
															<i class="fas fa-pen "></i>
														</button>
													</c:when>
												</c:choose>
											</c:forEach></td>
									</tr>
								</c:forEach>


							</tbody>
						</table>

						<!-- Tabella FEEDBACK -->
						<table
							class="table table-bordered text-left shadow p-4 ml-2 mb-4 bg-white"
							id="feedbackTable">
							<thead>

								<tr>
									<th colspan=4 class="text-center table-secondary"
										style="background-color: #e7d8c9">FEEDBACK <!-- Bottone modifica feedback -->
									</th>
								</tr>

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
										<td><c:forEach var="funz" items="${ruolo.funzionalita}">
												<c:choose>
													<c:when test="${funz.funzionalita == 'modifica feedback'}">
														<button
															onclick="impostaParametriFeedback('${feed.id}', '${feed.tipo.tipo}', '${feed.data}', '${feed.commento}')"
															type="button" data-toggle="modal"
															data-target="#modificaFeedbackModal"
															class="btn btn-light float-md-right"
															style="background-color: #ddbea9; border-color: transparent;">
															<i class="fas fa-pen "></i>
														</button>
													</c:when>
												</c:choose>
											</c:forEach></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- Tabella ALLEGATI -->
						<c:forEach var="funz" items="${ruolo.funzionalita}">
							<c:choose>
								<c:when test="${funz.funzionalita == 'visualizza allegati'}">
									<table id="allegatiTable"
										class="table table-bordered text-left shadow p-4 ml-2 mb-4 bg-white">
										<thead>

											<tr>
												<th colspan=5 class="text-center table-secondary"
													style="background-color: #98c1d9">ALLEGATI</th>
											</tr>

											<tr>
												<th scope="col">Nome Allegato</th>
												<th scope="col">File</th>
											</tr>

										</thead>

										<tbody>
											<c:forEach var="allegato" items="${mostraCandidato.file}">
												<tr>
													<td>${allegato.nomeFile}</td>
													<td>${allegato.tipo}</td>
													<td><a
														href="<c:url value='/download/${mostraCandidato.id}/${allegato.id}' />"
														class="btn btn-success custom-width">Scarica</a></td>
													<td><a
														href="<c:url value='/delete/${mostraCandidato.id}/${allegato.id}' />"
														class="btn btn-danger custom-width">Cancella</a></td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- MODAL modifica ANAGRAFICA -->
	<div class="modal fade" id="modificaAnagraficaModal" tabindex="-1"
		role="dialog" aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Modifica
						anagrafica</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="mostraCandidato"
							action="/ProgettoHR/ModificaAnagrafica/${mostraCandidato.id}/${mostraCandidato.stato.descrizione}">

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Nome:</div>
										<form:input type="text" class="form-control" id="nome"
											name="nome" path="nome" value="${mostraCandidato.nome}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Cognome:</div>
										<form:input type="text" class="form-control" id="cognome"
											name="cognome" path="cognome"
											value="${mostraCandidato.cognome}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Anno
											di nascita:</div>
										<form:input type="text" class="form-control" id="anno"
											name="anno" path="anno" value="${mostraCandidato.anno}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Telefono:</div>
										<form:input type="text" class="form-control" id="telefono"
											name="telefono" path="telefono"
											value="${mostraCandidato.telefono}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">E-mail:</div>
										<form:input type="text" class="form-control" id="email"
											name="email" path="email" value="${mostraCandidato.email}"></form:input>
									</div>
								</div>
							</div>

							<!--  <div class="row w-100 p-2 m-0 justify-content-md-start">
                  <div class="col w-100 p-0 justify-content-md-start">
                      <div class="form-group">
                          <div class="row w-100 p-0 m-0 justify-content-md-start">Specializzazione:</div>
                          <textarea style="resize: none;" class="form-control"
                              id="specializzazione" name="specializzazione"></textarea>
                      </div>
                  </div>
              </div> -->

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Inserimento
											azienda:</div>
										<!--<fmt:formatDate pattern="YYYY-MM-DD" value="${candidato.inserimentoAzienda}" />-->
										<form:input type="date" class="form-control"
											id="inserimentoAzienda" name="inserimentoAzienda"
											path="inserimentoAzienda"
											value="${mostraCandidato.inserimentoAzienda}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Cancella</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL modifica BUSINESS -->
	<div class="modal fade" id="modificaBusinessModal" tabindex="-1"
		role="dialog" aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Modifica
						business</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form method="POST"
							action="/ProgettoHR/Modifica/${mostraCandidato.id}/${mostraCandidato.stato.descrizione}">


							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Business
											unit:</div>
										<input type="text" class="form-control" id="businessUnit"
											name="businessUnit"
											value="${mostraCandidato.business.business}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Area
											di competenza:</div>
										<input type="text" class="form-control" id="areaCompetenza"
											name="areaCompetenza"
											value="<c:forEach var=" area"
                                            items="${mostraCandidato.area}">
                                        <span>${area.area}</span>
                                        </c:forEach>"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Mansione:</div>
										<input type="text" class="form-control" id="mansione"
											name="mansione"
											value="<c:forEach var=" mansione" items="${mostraCandidato.mansione}">
                                        <span>${mansione.mansione}</span>
                                        </c:forEach>"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Seniority:</div>
										<input type="text" class="form-control" id="seniority"
											name="seniority"
											value="${mostraCandidato.seniority.seniority}"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">
											Specializzazione:</div>
										<input type="text" class="form-control" id="specializzazione"
											name="specializzazione"
											value="<c:forEach var=" specializzazione"
                                            items="${mostraCandidato.candidatoSpecializzazione}">
                                        <span>${specializzazione.specializzazione.specializzazione}
                                            &nbsp ${specializzazione.anni} anni esperienza</span>
                                        </c:forEach>"></input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Inserimento
											azienda:</div>
										<input type="text" class="form-control"
											id="inserimentoAzienda" name="inserimentoAzienda "
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

	<!--MODAL modifica ECONOMICS-->
	<div class="modal fade" id="modificaEconomicsModal" tabindex="-1"
		role="dialog" aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Modifica
						economics</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="mostraCandidato"
							action="/ProgettoHR/AggiungiModificaEconomics/${mostraCandidato.id}">


							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Inquadramento:
										</div>
										<form:input type="text" class="form-control"
											id="Inquadramento" name="Inquadramento"
											path="economics.inquadramento"
											value="${economics.inquadramento}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">RAL:
										</div>
										<form:input type="text" class="form-control" id="RAL"
											name="RAL" path="economics.ral" value="${economics.ral}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Benefit:</div>
										<form:input type="text" class="form-control" id="benefit"
											name="benefit" path="economics.benefit"
											value="${economics.benefit}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Preavviso:</div>
										<form:input type="text" class="form-control" id="preavviso"
											name="preavviso" path="economics.preavviso"
											value="${economics.preavviso}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Desiderata:
										</div>
										<form:input type="text" class="form-control" id="desiderata"
											name="desiderata" path="economics.desiderata"
											value="${economics.desiderata}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Cancella</button>
								</div>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!--  MODAL modifica COSTI-->
	<div class="modal fade" id="modificaCostiModal" tabindex="-1"
		role="dialog" aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Modifica costi</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="mostraCandidato"
							action="/ProgettoHR/AggiungiModificaCosto/${mostraCandidato.id}">


							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Costo
											orario:</div>
										<form:input type="text" class="form-control" id="costoOrario"
											name="costoOrario" path="costo.orario"
											value="${costo.orario}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Costo
											giornaliero:</div>
										<form:input type="text" class="form-control"
											id="costoGiornaliero" name="costoGiornaliero"
											path="costo.giornaliero" value="${costo.giornaliero}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Commenti:</div>
										<form:input type="text" class="form-control" id="commenti"
											name="commenti" path="costo.commento"
											value="${costo.commento}"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Cancella</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--  MODAL MODIFICA QUALIFICATION MEETING-->
	<div class="modal fade" id="modificaQualificationMeetingModal"
		tabindex="-1" role="dialog" aria-labelledby="modificaModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Modifica
						qualification meeting</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="qualificationMeeting"
							action="/ProgettoHR/ModificaQualificationMeeting/${mostraCandidato.id}">

							<div style="visibility: hidden"
								class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start"></div>
										<form:input path="id" type="hidden" class="form-control"
											id="idQualificationMeeting" name="idQualificationMeeting"
											value=""></form:input>
									</div>
								</div>
							</div>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Cliente:</div>
										<form:input id="clienteQualificationMeeting" type="text"
											class="form-control" path="cliente" name="costoOrario"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data
											di presentazione:</div>
										<form:input id="dataPresentatoQualificationMeeting"
											type="date" pattern="yyyy-MM-dd" class="form-control"
											path="dataPresentato" name="costoGiornaliero"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Riferimento
											gara:</div>
										<form:input type="text" class="form-control"
											id="riferimentoGaraQualificationMeeting"
											path="riferimentoGara" name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data
											colloquio:</div>
										<form:input type="date" pattern="yyyy-MM-dd"
											class="form-control" id="dataColloquioQualificationMeeting"
											path="dataColloquio" name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:input type="text" class="form-control"
											id="feedbackQualificationMeeting" path="feedback"
											name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Modifica</button>
									<button type="reset" class="btn btn-danger btn-block">Cancella</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  MODAL FEEDBACK per MODIFICA FEEDBACK-->
	<div class="modal fade" id="modificaFeedbackModal" tabindex="-1"
		role="dialog" aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Modifica
						feedback</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="feedback"
							action="/ProgettoHR/ModificaFeedback/${mostraCandidato.id}">

							<div style="visibility: hidden"
								class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start"></div>
										<form:input path="id" type="hidden" class="form-control"
											id="idFeedback" name="idFeedback" value=""></form:input>
									</div>
								</div>
							</div>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Tipo</div>
										<form:input path="tipo.tipo" type="text" class="form-control"
											id="tipoModificaFeedback" name="tipoFeedback" value=""></form:input>
									</div>
								</div>
							</div>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data:</div>
										<form:input id="dataFeedback" path="data" type="date"
											pattern="yyyy-MM-dd" class="form-control" name="data"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:input id="commentoFeedback" path="commento" type="text"
											class="form-control" name="feedback"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Cancella</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal AGGIUNTA FILE -->
	<div class="modal fade" id="allegatiModal" tabindex="-1" role="dialog"
		aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Allegati</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form method="post"
							action="/ProgettoHR/doUpload/${mostraCandidato.id}"
							enctype="multipart/form-data">
							<table>
								<tr>
									<td>Pick file #1:</td>
									<td><input type="file" name="fileUpload" size="50" /></td>
								</tr>
								<tr>
									<td>Pick file #2:</td>
									<td><input type="file" name="fileUpload" size="50" /></td>
								</tr>

							</table>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Aggiunti
										Allegati</button>
									<button type="reset" class="btn btn-danger btn-block">Cancella</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal AGGIUNTA MANSIONE -->
	<div class="modal fade" id="aggiungiMansione" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Aggiunta
						mansione</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form modelAttribute="mansione" id="formMansione"
						method="POST"
						action="/ProgettoHR/MansioniSaveInCandidato/${mostraCandidato.id}"
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

	<!-- MODAL FEEDBACK per AGGIUNTA FEEDBACK -->
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
						<form:form method="POST" modelAttribute="feedback"
							action="/ProgettoHR/AggiungiFeedback/${mostraCandidato.id}">
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Tipo</div>
										<form:input readonly="readonly" path="tipo.tipo" type="text"
											class="form-control" id="tipoAggiungiFeedback"
											name="tipoFeedback" value=""></form:input>
									</div>
								</div>
							</div>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data:</div>
										<form:input path="data" type="date" pattern="yyyy-MM-dd"
											class="form-control" id="data" name="data"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:input path="commento" type="text" class="form-control"
											id="feedback" name="feedback"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Aggiungi
										Feedback</button>
								</div>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- MODAL  per AGGIUNTA QUALIFICATION MEETING -->
	<div class="modal fade" id="qualificationMeetingModal" tabindex="-1"
		role="dialog" aria-labelledby="qualificationMeetingModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="qualificationMeetingModalLabel">Qualification
						Meeting</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="qualificationMeeting"
							action="/ProgettoHR/AggiungiQualificationMeeting/${mostraCandidato.id}">

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Cliente:</div>
										<form:input type="text" class="form-control" id="cliente"
											path="cliente" name="costoOrario"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data
											di presentazione:</div>
										<form:input type="date" pattern="yyyy-MM-dd"
											class="form-control" id="dataPresentazione"
											path="dataPresentato" name="costoGiornaliero"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Riferimento
											gara:</div>
										<form:input type="text" class="form-control" id="riferimento"
											path="riferimentoGara" name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data
											colloquio:</div>
										<form:input type="date" pattern="yyyy-MM-dd"
											class="form-control" id="commenti" path="dataColloquio"
											name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:input type="text" class="form-control" id="commenti"
											path="feedback" name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Aggiungi
										Qualification Meeting</button>
								</div>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		function changeStato(stato, feedback, categoriaProtetta,
				qualificationMeeting, allegati, costi, economics) {
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
			removeAllegatiTable(allegati);
			removeCostiTable(costi);
			removeEconomicsTable(economics);
			removeQualificationMeetingTable(qualificationMeeting);
			checkCategoriaProtetta(categoriaProtetta);

		}

		function removeFeedbackTable(feedback) {
			if (feedback === "[]") {
				var myobj = document.getElementById("feedbackTable");
				myobj.remove();
			}
		}

		function removeQualificationMeetingTable(qualificationMeeting) {
			if (qualificationMeeting === "[]") {
				var myobj = document
						.getElementById("qualificationMeetingTable");
				myobj.remove();
			}
		}

		function removeAllegatiTable(allegati) {
			if (allegati === "[]") {
				var myobj = document.getElementById("allegatiTable");
				myobj.remove();
			}
		}

		function removeCostiTable(costi) {
			if (costi === "") {
				var myobj = document.getElementById("costiTable");
				myobj.remove();
			}
		}

		function removeEconomicsTable(economics) {
			if (economics === "") {
				var myobj = document.getElementById("economicsTable");
				myobj.remove();
			}
		}

		function checkCategoriaProtetta(categoriaProtetta) {
			if (categoriaProtetta === "true") {
				document.getElementById("categoriaProtetta").innerHTML = "Si";
			} else {
				document.getElementById("categoriaProtetta").innerHTML = "No";
			}
		}

		function impostaTipoFeedback(tipoFeedback) {
			if (tipoFeedback === "Mail") {
				document.getElementById("tipoAggiungiFeedback").value = tipoFeedback;
			} else if (tipoFeedback === "Telefonata") {
				document.getElementById("tipoAggiungiFeedback").value = tipoFeedback;
			} else if (tipoFeedback === "Colloquio HR") {
				document.getElementById("tipoAggiungiFeedback").value = tipoFeedback;
			} else if (tipoFeedback === "Colloquio Tecnico") {
				document.getElementById("tipoAggiungiFeedback").value = tipoFeedback;
			} else if (tipoFeedback === "Social") {
				document.getElementById("tipoAggiungiFeedback").value = tipoFeedback;
			}
		}

		function impostaParametriFeedback(id, tipo, data, commento) {
			document.getElementById("idFeedback").value = id;
			document.getElementById("tipoModificaFeedback").value = tipo;
			document.getElementById("dataFeedback").value = data;
			document.getElementById("commentoFeedback").value = commento;
		}

		function impostaParametriQualificationMeeting(id, cliente,
				dataPresentato, riferimentoGara, dataColloquio, feedback) {
			document.getElementById("idQualificationMeeting").value = id;
			document.getElementById("clienteQualificationMeeting").value = cliente;
			document.getElementById("dataPresentatoQualificationMeeting").value = dataPresentato;
			document.getElementById("riferimentoGaraQualificationMeeting").value = riferimentoGara;
			document.getElementById("dataColloquioQualificationMeeting").value = dataColloquio;
			document.getElementById("feedbackQualificationMeeting").value = feedback;
		}
	</script>

</body>

</html>