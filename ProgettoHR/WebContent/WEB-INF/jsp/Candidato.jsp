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
	onload="changeStato('${mostraCandidato.stato.descrizione}', '${mostraFeedback}', '${mostraCandidato.categoriaProtetta}', '${mostraCandidato.qm}', '${mostraCandidato.file}', '${mostraCandidato.costo}', '${mostraCandidato.economics}')">


	<!-- Navbar -->

	<div class="container-fluid">
		<div class="row w-100 p-0 m-0">
			<nav class="navbar navbar-light fixed-top bg-primary w-100 "
				style="opacity: 0.9;">

				<!-- Logo -->
				<a class="navbar-brand"
					href="/ProgettoHR/Home/${mostraCandidato.business.business}"> <img
					src="/ProgettoHR/img/Erre_technology_group_NEW.png"
					style="width: 170px;">
				</a>

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


				<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
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


				<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
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

				<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
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

				<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
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
				<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
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
				<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
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
						<div class="table-responsive-md">
							<table
								class="table table-hover table-md table-bordered text-left shadow p-4 ml-2 mb-4 bg-white">
								<tbody>
									<tr>
										<th colspan=2 class="text-center table-info"
											style="background-color: #90e0ef">ANAGRAFICA <c:forEach
												var="funz" items="${utente.ruolo.funzionalita}">
												<c:choose>
													<c:when
														test="${funz.funzionalita == 'modifica anagrafica'}">
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
									<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
										<c:choose>
											<c:when test="${funz.funzionalita == 'modifica anagrafica'}">
												<tr>

													<th scope="col">Stato</th>
													<td scope="col"><button
															class="btn btn-primary dropdown-toggle" role="button"
															id="menuStato" data-toggle="dropdown"
															aria-haspopup="true" aria-expanded="false"></button> <!-- Dropdown per stati candidato -->
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
										<th style="width: 10%" scope="col">Nome</th>
										<td style="width: 30%" scope="col">${mostraCandidato.nome}</td>
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
									<tr>
										<th scope="col">Codice Fiscale</th>
										<td scope="col">${mostraCandidato.codiceFiscale}</td>
									</tr>
									<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
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
						</div>

						<!-- tabella ECONOMICS -->
						<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
							<c:choose>
								<c:when test="${funz.funzionalita == 'visualizza economics'}">
									<table id="economicsTable"
										class="table table-hover table-md table-bordered shadow p-4 ml-2 mb-4 bg-white">
										<tbody>

											<tr>
												<th colspan=2 class="text-center table-warning ">ECONOMICS
													<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
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
						<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
							<c:choose>
								<c:when
									test="${funz.funzionalita == 'visualizza profilo professionale'}">
									<table
										class="table table-hover table-md table-bordered shadow p-4 ml-2 mb-4 bg-white">

										<tbody>

											<tr>

												<th colspan=3 class="text-center table-success"
													style="background-color: #77bfa3">BUSINESS <c:forEach
														var="funz" items="${utente.ruolo.funzionalita}">
													</c:forEach>
												</th>

											</tr>

											<!-- BUSINESS UNIT -->
											<tr>

												<th scope="col">Business unit</th>
												<td scope="col">${mostraCandidato.business.business}</td>
												<th><c:forEach var="funz"
														items="${utente.ruolo.funzionalita}">
														<c:choose>
															<c:when
																test="${funz.funzionalita == 'modifica profilo professionale'}">
																<!-- Bottone modifica business unit -->
																<button type="button" data-toggle="modal"
																	data-target="#modificaBusinessUnit"
																	class="btn btn-light btn-block"
																	style="background-color: #52b788; border-color: transparent;">
																	<i class="fas fa-cogs"></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach></th>

											</tr>

											<!-- AREA COMPETENZA -->
											<tr>

												<th scope="col">Area di competenza</th>
												<td scope="col">
													<ul>
														<c:forEach var="area" items="${mostraCandidato.area}">
															<li>${area.area}</li>
														</c:forEach>
													</ul>
												</td>
												<th><c:forEach var="funz"
														items="${utente.ruolo.funzionalita}">
														<c:choose>
															<c:when
																test="${funz.funzionalita == 'modifica profilo professionale'}">
																<!-- Bottone modifica area di competenza-->
																<button type="button" data-toggle="modal"
																	data-target="#modificaAreaCompetenza"
																	class="btn btn-light btn-block"
																	style="background-color: #52b788; border-color: transparent;">
																	<i class="fas fa-cogs"></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach></th>

											</tr>

											<!-- MANSIONE -->
											<tr>
												<th scope="col">Mansione</th>
												<td scope="col">
													<ul>
														<c:forEach var="mansione"
															items="${mostraCandidato.mansione}">
															<li>${mansione.mansione}</li>
														</c:forEach>
													</ul>
												</td>
												<th><c:forEach var="funz"
														items="${utente.ruolo.funzionalita}">
														<c:choose>
															<c:when
																test="${funz.funzionalita == 'modifica profilo professionale'}">
																<!-- Bottone modifica mansione -->
																<button type="button" data-toggle="modal"
																	data-target="#modificaMansione"
																	class="btn btn-light btn-block"
																	style="background-color: #52b788; border-color: transparent;">
																	<i class="fas fa-cogs"></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach></th>

											</tr>

											<!-- SENIORITY -->
											<tr>

												<th scope="col">Seniority</th>
												<td scope="col">${mostraCandidato.seniority.seniority}</td>
												<th><c:forEach var="funz"
														items="${utente.ruolo.funzionalita}">
														<c:choose>
															<c:when
																test="${funz.funzionalita == 'modifica profilo professionale'}">
																<!-- Bottone modifica seniority -->
																<button type="button" data-toggle="modal"
																	data-target="#modificaSeniority"
																	class="btn btn-light btn-block"
																	style="background-color: #52b788; border-color: transparent;">
																	<i class="fas fa-cogs"></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach></th>

											</tr>

											<!-- SPECIALIZZAZIONE -->
											<tr>

												<th scope="col">Specializzazione</th>
												<td scope="col">
													<ul>
														<c:forEach var="specializzazione"
															items="${mostraCandidato.candidatoSpecializzazione}">
															<li>${specializzazione.specializzazione.specializzazione}
																&nbsp ${specializzazione.anni} anni esperienza</li>
														</c:forEach>
													</ul>
												</td>
												<th><c:forEach var="funz"
														items="${utente.ruolo.funzionalita}">
														<c:choose>
															<c:when
																test="${funz.funzionalita == 'modifica profilo professionale'}">
																<!-- Bottone modifica specializzazione -->
																<button type="button" data-toggle="modal"
																	data-target="#modificaSpecializzazione"
																	class="btn btn-light btn-block"
																	style="background-color: #52b788; border-color: transparent;">
																	<i class="fas fa-cogs"></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach></th>

											</tr>

											<!-- INSERIMENTO AZIENDA -->
											<tr>

												<th scope="col">Inserimento azienda</th>
												<td scope="col">${mostraCandidato.inserimentoAzienda}</td>
												<th><c:forEach var="funz"
														items="${utente.ruolo.funzionalita}">
														<c:choose>
															<c:when
																test="${funz.funzionalita == 'modifica profilo professionale'}">
																<!-- Bottone modifica inserimento azienda -->
																<button type="button" data-toggle="modal"
																	data-target="#modificaInserimentoAzienda"
																	class="btn btn-light btn-block"
																	style="background-color: #52b788; border-color: transparent;">
																	<i class="fas fa-cogs"></i>
																</button>
															</c:when>
														</c:choose>
													</c:forEach></th>

											</tr>
										</tbody>

									</table>
								</c:when>
							</c:choose>
						</c:forEach>

						<!--tabella COSTI -->
						<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
							<c:choose>
								<c:when test="${funz.funzionalita == 'visualizza costi'}">
									<table id="costiTable"
										class="table table-hover table-md table-bordered shadow p-4 ml-2 mb-4 bg-white">
										<tbody>

											<tr>
												<th colspan=2 class="text-center table-danger">COSTI <c:forEach
														var="funz" items="${utente.ruolo.funzionalita}">
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
							class="table table-hover table-md table-bordered shadow p-4 ml-2 mb-4 bg-white">
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
										<td><c:forEach var="funz"
												items="${utente.ruolo.funzionalita}">
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
							class="table table-hover table-md table-bordered shadow p-4 ml-2 mb-4 bg-white"
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
										<td><c:forEach var="funz"
												items="${utente.ruolo.funzionalita}">
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
						<c:forEach var="funz" items="${utente.ruolo.funzionalita}">
							<c:choose>
								<c:when test="${funz.funzionalita == 'visualizza allegati'}">
									<table id="allegatiTable"
										class="table table-hover table-md table-bordered text-left shadow p-4 ml-2 mb-4 bg-white">
										<thead>

											<tr>
												<th colspan=5 class="text-center table-secondary"
													style="background-color: #98c1d9">ALLEGATI</th>
											</tr>

											<tr>
												<th scope="col">Nome Allegato</th>

											</tr>

										</thead>

										<tbody>
											<c:forEach var="allegato" items="${mostraCandidato.file}">
												<tr>
													<td>${allegato.nomeFile}</td>

													<td><a
														href="<c:url value='/download/${mostraCandidato.id}/${allegato.id}' />"
														class="btn btn-success custom-width">Scarica</a></td>
													<td>
														<button onclick="impostaParametriAllegati(${allegato.id})"
															type="button" class="btn btn-danger custom-width"
															data-toggle="modal" data-target="#deleteModal">
															Cancella</button>
													</td>

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

	<!-- MODAL cancella allegati -->

	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Sei sicuro di voler cancellare l'allegato selezionato?
					<form action="/ProgettoHR/delete/${mostraCandidato.id}"
						method="GET">
						<div style="visibility: hidden;">
							<input name="idAllegato" id="Allegato" />
						</div>
						<div class="modal-body" id="errorModalBody"></div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">si</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">no</button>

						</div>

					</form>
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
						onsubmit="return validateForm('idSubmitModificaAnagrafica', 'idNome', 'idCognome', 'idAnno', 'idTelefono', 'idEmail');"
							action="/ProgettoHR/ModificaAnagrafica/${mostraCandidato.id}">


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Nome:</div>
								<form:input type="text" class="form-control" id="idNome"
									name="nome" path="nome" value="${mostraCandidato.nome}" required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Cognome:</div>
								<form:input type="text" class="form-control" id="idCognome"
									name="cognome" path="cognome"
									value="${mostraCandidato.cognome}" required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Anno
									di nascita:</div>
								<form:input type="text" class="form-control" id="idAnno"
									name="anno" path="anno" value="${mostraCandidato.anno}" required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Telefono:</div>
								<form:input type="text" class="form-control" id="idTelefono"
									name="telefono" path="telefono"
									value="${mostraCandidato.telefono}" required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">E-mail:</div>
								<form:input type="text" class="form-control" id="idEmail"
									name="email" path="email" value="${mostraCandidato.email}" required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Codice
									Fiscale:</div>
								<form:input type="text" class="form-control"
									id="idCodiceFiscale" name="codiceFiscale" path="codiceFiscale"
									value="${mostraCandidato.codiceFiscale}"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Provenienza
									Candidatura:</div>
								<form:input type="text" class="form-control"
									id="idProvenienzaCandidatura" name="provenienzaCandidatura"
									path="provenienza" value="${mostraCandidato.provenienza}"></form:input>
							</div>

							<div class="form-group mt-2">
								<div class="custom-control custom-switch">
									<form:checkbox class="custom-control-input"
										path="categoriaProtetta" id="customSwitch1"
										name="categoriaProtetta"></form:checkbox>
									<label class="custom-control-label" for="customSwitch1">Categoria
										protetta</label>
								</div>
							</div>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitModificaAnagrafica" class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Annulla Modifiche</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL MODIFICA BUSINESS UNIT -->
	<div class="modal fade" id="modificaBusinessUnit" tabindex="-1"
		role="dialog" aria-labelledby="modalBusinessUnit" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="titleBusinessUnit">Modifica
						Business Unit</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaBusinessUnit/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="form-row justify-content-center">

							<div class="form-group col-auto">
								<h5 class="text-center">Scegli:</h5>
								<select id="inputState" class="form-control text-center"
									name="businessUnit">
									<option disabled>business unit</option>
									<c:forEach var="business" items="${businessList}">
										<option value="${business.business}">${business.business}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
						<button type="submit" class="btn btn-success">Salva</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- MODAL MODIFICA AREA DI COMPETENZA -->
	<div class="modal fade" id="modificaAreaCompetenza" tabindex="-1"
		role="dialog" aria-labelledby="modalAreaCompetenza" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="titleAreaCompetenza">Modifica</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaAreaCompetenza/${mostraCandidato.id}"
					onsubmit="return validateMyForm('areaCompetenzaInput')">
					<div class="modal-body">
						<div style="border-color: transparent;">
							<div>
								<h5>Aree di competenza:</h5>
							</div>

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<div id="areaCompetenzeCandidato">
									<c:forEach var="area" items="${mostraCandidato.area}">
										<div>
											<input style="background: #3CBC8D" readonly type="text"
												name="areaCompetenza" value="${area.area}"></input> <span
												onclick="eliminaCampo('${area.area}', 'areaCompetenzeCandidato')"
												class="btn"> <i class="fa fa-close"></i>
											</span>
										</div>
									</c:forEach>
								</div>
								<div>
									<input autocomplete="off" placeholder="aggiungi"
										list="areeCompetenzeDisponibili" id="areaCompetenzaInput">
									<datalist id="areeCompetenzeDisponibili">
										<c:forEach var="area" items="${areaCompetenzaList}">
											<option value="${area}"></option>
										</c:forEach>
									</datalist>
									<div
										onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
										class="btn">
										<i class="fas fa-plus-square mr-1"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
						<button type="submit" class="btn btn-success">Salva</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- MODAL MODIFICA MANSIONE -->
	<div class="modal fade" id="modificaMansione" tabindex="-1"
		role="dialog" aria-labelledby="modalMansione" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="titleMansione">Modifica</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaMansione/${mostraCandidato.id}"
					onsubmit="return validateMyForm('mansioneInput');">
					<div class="modal-body">
						<div style="border-color: transparent;">

							<div>
								<h5>Mansioni:</h5>
							</div>
							<div class="autocomplete" style="border-bottom-style: ridge;">
								<div id="mansioniCandidato">
									<c:forEach var="mansione" items="${mostraCandidato.mansione}">
										<div>
											<input style="background: #3CBC8D" readonly type="text"
												name="mansione" value="${mansione.mansione}"></input> <span
												onclick="eliminaCampo('${mansione.mansione}', 'mansioniCandidato')"
												class="btn"> <i class="fa fa-close"></i>
											</span>
										</div>
									</c:forEach>
								</div>
								<div>
									<input autocomplete="off" placeholder="aggiungi"
										list="mansioniDisponibili" id="mansioneInput">
									<datalist id="mansioniDisponibili">
										<c:forEach var="mansione" items="${mansioneList}">
											<option value="${mansione}"></option>
										</c:forEach>
									</datalist>
									<div onclick="stampaMansioneSelezionata('${mansioneList}')"
										class="btn">
										<i class="fas fa-plus-square mr-1"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
						<button type="submit" class="btn btn-success" name="submitButton">Salva</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- MODAL MODIFICA SENIORITY-->
	<div class="modal fade" id="modificaSeniority" tabindex="-1"
		role="dialog" aria-labelledby="modalSeniority" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="titleSeniority">Modifica Seniority</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaSeniority/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="form-row justify-content-center">

							<div class="form-group col-auto">
								<h5 class="text-center">Scegli:</h5>
								<select id="senioritySelezionata"
									class="form-control text-center" name="seniority">
									<c:forEach var="seniority" items="${seniorityList}">
										<option value="${seniority.seniority}">${seniority.seniority}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
						<button type="submit" class="btn btn-success">Salva</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- MODAL MODIFICA SPECIALIZZAZIONE -->
	<div class="modal fade" id="modificaSpecializzazione" tabindex="-1"
		role="dialog" aria-labelledby="modalSpecializzazione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="titleSpecializzazione">Modifica</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaSpecializzazione/${mostraCandidato.id}"
					onsubmit="return validateMyForm('specializzazioneInput');">
					<div class="modal-body">
						<div style="border-color: transparent;">

							<div>
								<h5>Specializzazioni:</h5>
							</div>

							<div id="specializzazioniCandidato">
								<c:forEach var="spec"
									items="${mostraCandidato.candidatoSpecializzazione}">
									<div>
										<input style="background: #3CBC8D" readonly type="text"
											name="specializzazione"
											value="${spec.specializzazione.specializzazione} ${spec.anni}"></input>
										<span
											onclick="eliminaCampo('${spec.specializzazione.specializzazione} ${spec.anni}', 'specializzazioniCandidato')"
											class="btn"> <i class="fa fa-close"></i>
										</span>
									</div>
								</c:forEach>
							</div>
							<div>
								<input autocomplete="off" placeholder="aggiungi"
									list="specializzazioniDisponibili" id="specializzazioneInput">
								<datalist id="specializzazioniDisponibili">
									<c:forEach var="specializzazione"
										items="${specializzazioneList}">
										<option value="${specializzazione}"></option>
									</c:forEach>
								</datalist>

								<input id="anniEsperienzaInput" class="text-left" type="number"
									placeholder="anni esperienza">
								<div
									onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
									class="btn">
									<i class="fas fa-plus-square mr-1"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
						<button type="submit" class="btn btn-success">Salva</button>
					</div>
				</form>
			</div>
		</div>


	</div>


	<!-- MODIFICA INSERIMENTO AZIENDA -->
	<div class="modal fade" id="modificaInserimentoAzienda" tabindex="-1"
		role="dialog" aria-labelledby="modalInserimentoAzienda"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="titleInserimentoAzienda">Modifica</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaDataInserimentoAzienda/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="row w-100 p-2 m-0 justify-content-md-start">
							<div class="col w-100 p-0 justify-content-md-start">
								<div class="form-group">
									<div class="row w-100 p-0 m-0 justify-content-md-start">Data
										Inserimento azienda:</div>
									<input type="date" pattern="yyyy-MM-dd"
										value="${mostraCandidato.inserimentoAzienda}"
										class="form-control" id="idInserimentoAzienda"
										name="dataInserimentoAzienda"></input>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
						<button type="submit" class="btn btn-success">Salva</button>
					</div>
				</form>
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
						onsubmit="return validateForm('idSubmitAggiungiEconomics', 'idInquadramento', 'idRAL', 'idBenefit', 'idPreavviso', 'idDesiderata')"
							action="/ProgettoHR/AggiungiModificaEconomics/${mostraCandidato.id}">


							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Inquadramento:
										</div>
										<form:input type="text" class="form-control"
											id="idInquadramento" name="Inquadramento"
											path="economics.inquadramento"
											value="${economics.inquadramento}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">RAL:
										</div>
										<form:input type="text" class="form-control" id="idRAL"
											name="RAL" path="economics.ral" value="${economics.ral}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Benefit:</div>
										<form:input type="text" class="form-control" id="idBenefit"
											name="benefit" path="economics.benefit"
											value="${economics.benefit}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Preavviso:</div>
										<form:input type="text" class="form-control" id="idPreavviso"
											name="preavviso" path="economics.preavviso"
											value="${economics.preavviso}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Desiderata:
										</div>
										<form:input type="text" class="form-control" id="idDesiderata"
											name="desiderata" path="economics.desiderata"
											value="${economics.desiderata}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitAggiungiEconomics" class="btn btn-primary btn-block">Salva</button>
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
						onsubmit="return validateForm('idSubmitAggiungiCosto', 'idCostoOrario', 'idCostoGiornaliero', 'idCommentiCosto')"
							action="/ProgettoHR/AggiungiModificaCosto/${mostraCandidato.id}">


							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Costo
											orario:</div>
										<form:input type="text" class="form-control" id="idCostoOrario"
											name="costoOrario" path="costo.orario"
											value="${costo.orario}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Costo
											giornaliero:</div>
										<form:input type="text" class="form-control"
											id="idCostoGiornaliero" name="costoGiornaliero"
											path="costo.giornaliero" value="${costo.giornaliero}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Commenti:</div>
										<form:input type="text" class="form-control" id="idCommentiCosto"
											name="commenti" path="costo.commento"
											value="${costo.commento}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitAggiungiCosto" class="btn btn-primary btn-block">Salva</button>
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
						onsubmit="return validateForm('idSubmitModificaQM', 'clienteQualificationMeeting', 'dataPresentatoQualificationMeeting', 'riferimentoGaraQualificationMeeting', 'dataColloquioQualificationMeeting', 'feedbackQualificationMeeting');"
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
											class="form-control" path="cliente" name="costoOrario" required="required"></form:input>
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
											path="dataPresentato" name="costoGiornaliero" required="required"></form:input>
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
											path="riferimentoGara" name="commenti" required="required"></form:input>
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
											path="dataColloquio" name="commenti" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:input type="text" class="form-control"
											id="feedbackQualificationMeeting" path="feedback"
											name="commenti" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitModificaQM" class="btn btn-primary btn-block">Modifica</button>
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
						onsubmit="return validateForm('idSubmitModificaFeedback', 'dataFeedback', 'commentoFeedback')"
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
											pattern="yyyy-MM-dd" class="form-control" name="data" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:input id="commentoFeedback" path="commento" type="text"
											class="form-control" name="feedback" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitModificaFeedback" class="btn btn-primary btn-block">Salva</button>
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
									<td>Pick file:</td>
									<td><input type="file" name="fileUpload" size="50" required="required"/></td>
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
							onsubmit="return validateForm('idSubmitAggiungiFeedback', 'idDataFeedback', 'idCommentoFeedback')"
							action="/ProgettoHR/AggiungiFeedback/${mostraCandidato.id}">
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Tipo</div>
										<form:input readOnly="true" path="tipo.tipo" type="text"
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
											class="form-control" id="idDataFeedback" name="data"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:input path="commento" type="text" class="form-control"
											id="idCommentoFeedback" name="feedback"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitAggiungiFeedback"
										class="btn btn-primary btn-block">Aggiungi Feedback</button>
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
							onsubmit="return validateForm('idSubmitAggiungiQM', 'idClienteQM', 'idDataPresentazioneQM', 'idRiferimentoGaraQM', 'idDataColloquioQM', 'idCommentiQM');"
							action="/ProgettoHR/AggiungiQualificationMeeting/${mostraCandidato.id}">

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Cliente:</div>
										<form:input type="text" class="form-control" id="idClienteQM"
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
											class="form-control" id="idDataPresentazioneQM"
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
											id="idRiferimentoGaraQM" path="riferimentoGara"
											name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data
											colloquio:</div>
										<form:input type="date" pattern="yyyy-MM-dd"
											class="form-control" id="idDataColloquioQM"
											path="dataColloquio" name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:input type="text" class="form-control" id="idCommentiQM"
											path="feedback" name="commenti"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitAggiungiQM"
										class="btn btn-primary btn-block">Aggiungi
										Qualification Meeting</button>
								</div>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- MODAL ERRORE -->
	<div class="modal fade" id="errorModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Errore</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="errorModalBody"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
		function changeStato( stato, feedback, categoriaProtetta, qualificationMeeting, allegati, costi, economics) {
			if (stato === "Nuovo inserito") {
				document.getElementById("menuStato").className = "btn btn-secondary dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Nuovo inserito";
			} else if (stato === "Da contattare") {
				document.getElementById("menuStato").className = "btn btn-warning dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Da contattare";
			} else if (stato === "Scartato") {
				document.getElementById("menuStato").className = "btn btn-danger dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Scartato";
			} else if (stato === "Attivo") {
				document.getElementById("menuStato").className = "btn btn-success dropdown-toggle";
				document.getElementById("menuStato").innerHTML = "Attivo";
			} else if (stato === "Selezionato") {
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
		
		function impostaParametriAllegati(id) {
			document.getElementById("Allegato").value = id;
		
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
		
		
		function buildString(string) {
			return string.replace("[", "").replace("]", "").split(", ");
		}
		
	
		
		// gestione modal di modifica area competenza
		function stampaAreaCompetenzaSelezionata(areaCompetenzaList) {
			
			var areeCompetenzaEsistenti = document.getElementById("areaCompetenzeCandidato").children;
			if(areeCompetenzaEsistenti != null){   
				for(var i=0; i<areeCompetenzaEsistenti.length; i++){    
					var input = areeCompetenzaEsistenti[i].children;
					if(input[0].value === document.getElementById("areaCompetenzaInput").value){  
						$('#errorModal').modal('toggle');   
						document.getElementById("errorModalBody").innerHTML = "Valore gi� inserito";  
						return;              
              		}           
				} 			
			}
			
			var areaString = buildString(areaCompetenzaList);
			
			for(area of areaString){
				if(document.getElementById("areaCompetenzaInput").value === area){
			
			var tagDiv = document.createElement("div");		
			var tagInput = document.createElement("input");
			var tagDivButton = document.createElement("span");
			tagInput.value = document.getElementById("areaCompetenzaInput").value;
												
			tagInput.name = "areaCompetenza";
			tagInput.readOnly = true;			
			tagInput.style.backgroundColor = "#3CBC8D";
			
			tagDivButton.innerHTML = '&nbsp&nbsp&nbsp <i class="fa fa-close"></i>';
			
			tagDivButton.onclick = function(){				              	              	          				
				tagDiv.remove();
			};
			
			tagDiv.appendChild(tagInput);
			tagDiv.appendChild(tagDivButton);
			
			document.getElementById("areaCompetenzeCandidato").appendChild(tagDiv);
			document.getElementById("areaCompetenzaInput").value = "";
			document.getElementById("areaCompetenzaInput").focus();
			return;
				}
			}
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Area Competenza inserita non esistente"		
		}
		
		// gestione modal di modifica mansioni
		function stampaMansioneSelezionata(mansioneList) {
			
			//controllo che non sia gi� stato inserito il valore selezionato
			//il controllo viene fatto esplorando il DOM, in particolare il div che contiente gli input dei valori inseriti (qualora ci fossero)
			var mansioniEsistenti = document.getElementById("mansioniCandidato").children;
			if(mansioniEsistenti != null){   
				for(var i=0; i<mansioniEsistenti.length; i++){    
					var input = mansioniEsistenti[i].children;
					if(input[0].value === document.getElementById("mansioneInput").value){  
						$('#errorModal').modal('toggle');   
						document.getElementById("errorModalBody").innerHTML = "Valore gi� inserito";  
						return;              
              		}           
				} 			
			}
			
			var mansioneString = buildString(mansioneList);
			
			//controllo che il valore selezionato sia effettivamente un valore presente nel database per non incorrere in problemi futuri
			for(mansione of mansioneString){
				if(document.getElementById("mansioneInput").value === mansione){
			
			//creo dinamicamento la struttura contenente gli input con i valori selezionati
			var tagDiv = document.createElement("div");		
			var tagInput = document.createElement("input");
			var tagDivButton = document.createElement("span");
			tagInput.value = document.getElementById("mansioneInput").value;
												
			tagInput.name = "mansione";
			tagInput.readOnly = true;
			
			tagInput.style.backgroundColor = "#3CBC8D";
			
			//var mansioneDaCercare = document.getElementById("mansioneInput").value;
			tagDivButton.innerHTML = '&nbsp&nbsp&nbsp <i class="fa fa-close"></i>';
			
			tagDivButton.onclick = function(){				              	              	          				
				tagDiv.remove();
			};
			
			tagDiv.appendChild(tagInput);
			tagDiv.appendChild(tagDivButton);
			
			document.getElementById("mansioniCandidato").appendChild(tagDiv);
			document.getElementById("mansioneInput").value = "";
			document.getElementById("mansioneInput").focus();
			return;
				}
			}
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Mansione inserita non esistente"
		}
		
		
		function stampaSpecializzazioneSelezionata(specializzazioneList) {
			
			var specializzazioniEsistenti = document.getElementById("specializzazioniCandidato").children;
			if(specializzazioniEsistenti != null){   
				for(var i=0; i<specializzazioniEsistenti.length; i++){    
					var input = specializzazioniEsistenti[i].children;
					input = input[0].value;
					input = input.split(" ");
					if(input[0] === document.getElementById("specializzazioneInput").value){  
						$('#errorModal').modal('toggle');   
						document.getElementById("errorModalBody").innerHTML = "Valore gi� inserito";  
						return;              
              		}           
				} 			
			}
			
			var specializzazioneString = buildString(specializzazioneList);
			
			for(specializzazione of specializzazioneString){
				if(document.getElementById("specializzazioneInput").value === specializzazione){
			
			var tagDiv = document.createElement("div");		
			var tagInput = document.createElement("input");
			var tagDivButton = document.createElement("span");
			tagInput.value = document.getElementById("specializzazioneInput").value + " " + document.getElementById("anniEsperienzaInput").value;
												
			tagInput.name = "specializzazione";
			tagInput.readOnly = true;
			tagInput.style.backgroundColor = "#3CBC8D";
			
			tagDivButton.innerHTML = '&nbsp&nbsp&nbsp <i class="fa fa-close"></i>';			
			tagDivButton.onclick = function(){				              	              	          				
				tagDiv.remove();
			};
			
			tagDiv.appendChild(tagInput);
			tagDiv.appendChild(tagDivButton);
			
			document.getElementById("specializzazioniCandidato").appendChild(tagDiv);
			document.getElementById("specializzazioneInput").value = "";
			document.getElementById("anniEsperienzaInput").value = "";
			document.getElementById("specializzazioneInput").focus();
			return;
				}
			}
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Specializzazione inserita non esistente"
		}
		
		
		
		function eliminaCampo(campo, tipoCampo){
			
			var campiEsistenti = document.getElementById(tipoCampo).children;
			if(campiEsistenti != null){   
				for(var i=0; i<campiEsistenti.length; i++){    
					var input = campiEsistenti[i].children;
					if(input[0].value === campo){ 
						campiEsistenti[i].remove();
						return;              
              		}           
				} 			
			}
		}
		
		//funzione che mi salva le modifiche solo in caso non ci sia nulla all'interno dell'input
		function validateMyForm(id){

			if(document.getElementById(id).value != ""){			
				$('#errorModal').modal('toggle');
				document.getElementById("errorModalBody").innerHTML = "Premere bottone per aggiungere il valore selezionato"
				return false;
			}
			else {
				return true;
			}
		}
		
		function validateForm(idSubmit, ...campi){
			
			for(campo of campi){
				
			if(document.getElementById(campo).value == ""){
				return false;
			}
		}
			document.getElementById(idSubmit).disabled = "true";
			return true;
			
	}
	

	</script>

</body>

</html>