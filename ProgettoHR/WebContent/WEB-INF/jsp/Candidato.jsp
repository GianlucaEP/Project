<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Candidato</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style>
* {
	font-family: 'Poppins', sans-serif;
}

body, html {
	height: 100%;
	transition: background-color .5s;
	background-image: url("/ProgettoHR/img/home.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
}

header {
	height: 100%;
	transition: margin-left .5s;
}

#btn-nav {
	border: 1px solid white;
	border-radius: 30px;
	height: 45px;
	background-color: white;
}

#btn-logout, #btn-home, #btn-menu {
	border-radius: 100%;
	background-color: white;
	color: black;
	box-shadow: none !important;
	outline: 0;
	border: 1px solid white;
	transition: 0.5s;
}

#btn-logout:hover, #btn-home:hover, #btn-menu:hover {
	border: 1px solid #d3d3d3;
	background-color: #d3d3d3;
	transition: 0.5s;
	color: black;
	box-shadow: none !important;
	outline: 0;
}

#sidebar {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: white;
	transition: 0.5s;
	padding-top: 60px;
	overflow-x: hidden;
}

#sidebar a {
	text-decoration: none;
	font-size: 20px;
	letter-spacing: 5px;
	display: block;
	transition: 0.3s;
	color: black;
	text-align: left;
}

#sidebar a:hover {
	color: #004fff;
}

#sidebar #btn-menu-close {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

/* =====================
 	TABELLA ANAGRAFICA 
 ======================= */
.tabellaAnagrafica {
	width: 100%;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
	border-collapse: collapse;
}

.tabellaAnagrafica .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaAnagrafica .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 4px;
	transition: 0.5s;
}

.tabellaAnagrafica .body tr:hover {
	color: black;
	transition: 0.5s;
	background-color: white;
}

.tabellaAnagrafica .body {
	background-color: #bde0fe;
}

.tabellaAnagrafica th {
	padding: 8px;
}

.tabellaAnagrafica td {
	font-size: 14px;
	padding: 4px;
}

.tabellaAnagrafica .footer {
	background-color: white;
}

#btn-stato {
	letter-spacing: 5px;
	border-radius: 10px 0px 0px 10px;
	box-shadow: none !important;
	outline: 0;
}

#dropdown-stato {
	border-radius: 0px 10px 10px 0px;
}

.btn-modifica {
	background-color: white;
	border: 1px solid white;
	border-radius: 10px;
	outline: 0;
	box-shadow: none !important;
}

/* =====================
 	TABELLA BUSINESS 
 ======================= */
.tabellaBusiness {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
}

.tabellaBusiness .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaBusiness .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaBusiness .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaBusiness .body {
	background-color: #e9ecef;
}

.tabellaBusiness .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaBusiness .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaBusiness th {
	padding: 8px;
}

.tabellaBusiness td {
	font-size: 14px;
	padding: 4px;
}

.tabellaBusiness .footer {
	background-color: white;
}

/* =====================
 	TABELLA ECONOMICS
 ======================= */
.tabellaEconomics {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
}

.tabellaEconomics .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaEconomics .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaEconomics .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaEconomics .body {
	background-color: #e9ecef;
}

.tabellaEconomics .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaEconomics .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaEconomics th {
	padding: 8px;
}

.tabellaEconomics td {
	font-size: 14px;
	padding: 4px;
}

.tabellaEconomics .footer {
	background-color: white;
}

/* =====================
 	  TABELLA COSTI
 ======================= */
.tabellaCosti {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
}

.tabellaCosti  .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaCosti  .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaCosti  .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaCosti  .body {
	background-color: #e9ecef;
}

.tabellaCosti  .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaCosti  .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaCosti  th {
	padding: 8px;
}

.tabellaCosti  td {
	font-size: 14px;
	padding: 4px;
}

.tabellaCosti  .footer {
	background-color: white;
}

/* =====================
 	  TABELLA TITOLI
 ======================= */
.tabellaTitoli {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
}

.tabellaTitoli  .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaTitoli  .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaTitoli  .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaTitoli  .body {
	background-color: #e9ecef;
}

.tabellaTitoli  .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaTitoli  .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaTitoli  th {
	padding: 8px;
}

.tabellaTitoli  td {
	font-size: 14px;
	padding: 4px;
}

.tabellaTitoli  .footer {
	background-color: white;
}

/* =====================
TABELLA COMPETENZE LINGUISTICHE
 ======================= */
.tabellaCompetenzeLinguistiche {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
}

.tabellaCompetenzeLinguistiche  .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaCompetenzeLinguistiche  .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaCompetenzeLinguistiche .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaCompetenzeLinguistiche .body {
	background-color: #e9ecef;
}

.tabellaCompetenzeLinguistiche .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaCompetenzeLinguistiche  .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaCompetenzeLinguistiche th {
	padding: 8px;
}

.tabellaCompetenzeLinguistiche  td {
	font-size: 14px;
	padding: 4px;
}

.tabellaCompetenzeLinguistiche .footer {
	background-color: white;
}

/* =====================
	TABELLA FEEDBACK
 ======================= */
.tabellaFeedback {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
}

.tabellaFeedback  .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaFeedback  .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaFeedback .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaFeedback .body {
	background-color: #e9ecef;
}

.tabellaFeedback .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaFeedback  .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaFeedback th {
	padding: 8px;
}

.tabellaFeedback  td {
	font-size: 14px;
	padding: 4px;
}

.tabellaFeedback .footer {
	background-color: white;
}

/* =====================
	TABELLA QUALIFICATION
 ======================= */
.tabellaQualification {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
}

.tabellaQualification  .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaQualification .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaQualification .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaQualification .body {
	background-color: #e9ecef;
}

.tabellaQualification .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaQualification  .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaQualification th {
	padding: 8px;
}

.tabellaQualification  td {
	font-size: 14px;
	padding: 4px;
}

.tabellaQualification .footer {
	background-color: white;
}

/* =====================
	TABELLA ALLEGATI
 ======================= */
.tabellaAllegati {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 10px;
	overflow: hidden;
}

.tabellaAllegati .head {
	background-color: white;
	color: black;
	letter-spacing: 5px;
}

.tabellaAllegati .body tr {
	border-bottom: 2px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaAllegati .body tr:hover {
	color: #004fff;
	transition: 0.5s;
}

.tabellaAllegati .body {
	background-color: #e9ecef;
}

.tabellaAllegati .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaAllegati  .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaAllegati th {
	padding: 8px;
}

.tabellaAllegati  td {
	font-size: 14px;
	padding: 4px;
}

.tabellaAllegati .footer {
	background-color: white;
}
</style>

</head>

<body
	onload="changeStato('${mostraCandidato.stato.descrizione}', '${mostraFeedback}', '${mostraCandidato.categoriaProtetta}', '${mostraCandidato.qm}', '${mostraCandidato.file}', '${mostraCandidato.costo}', '${mostraCandidato.economics}', '${mostraCandidato.titoloStudio}', '${mostraCandidato.candidatoCompetenzaLingustica}')">
	<header>
		<c:set var="singlequote" value="'" />
		<c:set var="backslash" value="&apos" />

		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<div class="row w-100">
					<div id="btn-nav" class="d-flex flex-row">
						<div class="col-auto align-self-center">
							<button onclick="openMenu()" class="btn" id="btn-menu">
								<i class="fas fa-bars"></i>
							</button>
						</div>
						<!-- SIDEBAR MENU -->
						<div id="sidebar">

							<a href="javascript:void(0)" id="btn-menu-close"
								onclick="closeMenu()">&times;</a>

							<ul class="list-unstyled components">

								<c:if
									test='${fn:contains(funzionalita, "aggiunta qualification meeting")}'>
									<li><a href="" data-toggle="modal"
										data-target="#aggiungiQualificationMeeting" type="button">+
											Qualification meeting</a></li>
									<hr>
								</c:if>

								<c:if test='${fn:contains(funzionalita, "aggiunta economics")}'>
									<li><a href="" data-toggle="modal"
										data-target="#modificaEconomics" type="button">+ Economics</a></li>
									<hr>
								</c:if>

								<c:if test='${fn:contains(funzionalita, "aggiunta costi")}'>
									<li><a href="" data-toggle="modal"
										data-target="#modificaCosti" type="button">+ Costi</a></li>
									<hr>
								</c:if>
								<c:if
									test='${fn:contains(funzionalita, "aggiunta titolo di studio")}'>
									<li><a href="" data-toggle="modal"
										data-target="#aggiungiTitoloStudio" type="button">+ Titolo
											di studio</a></li>
									<hr>
								</c:if>
								<c:if
									test='${fn:contains(funzionalita, "aggiunta competenza linguistica")}'>
									<li><a href="" data-toggle="modal"
										data-target="#aggiungiCompetenzaLinguistica" type="button">+
											Competenza linguistica</a></li>
									<hr>
								</c:if>

								<c:if test='${fn:contains(funzionalita, "aggiunta feedback")}'>
									<li class="active"><a href="#homeSubmenu"
										id="frecciaSidebar" data-toggle="collapse"
										aria-expanded="false" class="dropdown-toggle">- Feedback</a>
										<hr>
										<ul class="collapse list-unstyled" id="homeSubmenu">
											<li><a onclick="impostaTipoFeedback('Colloquio HR')"
												class="dropdown-item" href="" type="button"
												data-toggle="modal" data-target="#aggiungiFeedback">+
													Colloquio HR </a>
												<hr> <a
												onclick="impostaTipoFeedback('Colloquio Tecnico')"
												type="button" data-toggle="modal"
												data-target="#aggiungiFeedback" class="dropdown-item"
												href="">+ Colloquio tecnico </a>
												<hr> <a class="dropdown-item" href=""
												onclick="impostaTipoFeedback('Mail')" type="button"
												data-toggle="modal" data-target="#aggiungiFeedback">+
													E-mail </a>
												<hr> <a class="dropdown-item" href=""
												onclick="impostaTipoFeedback('Social')" type="button"
												data-toggle="modal" data-target="#aggiungiFeedback">+
													Social network </a>
												<hr> <a class="dropdown-item" href=""
												onclick="impostaTipoFeedback('Telefonata')" type="button"
												data-toggle="modal" data-target="#aggiungiFeedback">+
													Telefonata </a></li>

										</ul></li>
									<hr>
								</c:if>

								<c:if test='${fn:contains(funzionalita, "aggiunta allegati")}'>
									<li><a href="" data-toggle="modal"
										data-target="#aggiungiAllegato" type="button"
										class="text-center">Allegati <i class="fas fa-folder-open"></i>
									</a></li>
									<hr>
								</c:if>
								<li><a href="/ProgettoHR/Filter/${businessUnit}"
									class="btn">- Ricerca candidati</a></li>
							</ul>
						</div>
						<div class="col-auto align-self-center">
							<button class="btn"
								onclick="location.href = '/ProgettoHR/Home/${businessUnit}';"
								id="btn-home">
								<i class="fas fa-home"></i>
							</button>
						</div>
						<div class="col-auto align-self-center">
							<button onclick="location.href = '/ProgettoHR/Login';"
								class="btn float-right" id="btn-logout">
								<i class="fas fa-sign-out-alt"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<div class="row">
				<div class="col mt-5">

					<div class="row d-flex flex-column">
						<div class="col mb-3">
							<!-- Tabella ANAGRAFICA -->
							<div class="table-responsive">
								<table class="tabellaAnagrafica">

									<thead class="head">
										<tr>
											<th><h3>ANAGRAFICA</h3></th>
											<th colspan=2><c:if
													test='${fn:contains(funzionalita, "modifica anagrafica")}'>
													<!-- Bottone modifica anagrafica -->
													<button type="button" data-toggle="modal"
														data-target="#modificaAnagrafica"
														class="btn float-right btn-modifica">
														<i class="fas fa-user-cog"></i>
													</button>
												</c:if></th>
										</tr>
									</thead>

									<tbody class="body">
										<c:if
											test='${fn:contains(funzionalita, "modifica anagrafica")}'>
											<tr>

												<th scope="col">Stato</th>
												<td scope="col">
													<div class="btn-group dropright">
														<button type="button" class="btn" id="btn-stato"
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false"></button>
														<div class="dropdown-menu" id="dropdown-stato">
															<a class="dropdown-item"
																href="/ProgettoHR/Aggiorna/${businessUnit}/${ mostraCandidato.id }/daContattare">
																Da contattare</a> <a class="dropdown-item"
																href="/ProgettoHR/Aggiorna/${businessUnit}/${ mostraCandidato.id }/scartato">
																Scartato</a> <a class="dropdown-item"
																href="/ProgettoHR/Aggiorna/${businessUnit}/${ mostraCandidato.id }/attivo">
																Attivo</a> <a class="dropdown-item"
																href="/ProgettoHR/Aggiorna/${businessUnit}/${ mostraCandidato.id }/selezionato">
																Selezionato</a>
														</div>
													</div>
												</td>
											</tr>
										</c:if>
										<tr>
											<th scope="col">Nome</th>
											<td scope="col">${mostraCandidato.nome}</td>
										</tr>
										<tr>
											<th scope="col">Cognome</th>
											<td scope="col">${mostraCandidato.cognome}</td>
										</tr>
										<tr>
											<th scope="col">Data di nascita</th>
											<td scope="col">${mostraCandidato.dataNascita}</td>
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
											<th scope="col">Residenza</th>
											<td scope="col">${mostraCandidato.residenza}</td>
										</tr>
										<tr>
											<th scope="col">Domicilio</th>
											<td scope="col">${mostraCandidato.domicilio}</td>
										</tr>
										<tr>
											<th scope="col">Codice Fiscale</th>
											<td scope="col">${mostraCandidato.codiceFiscale}</td>
										</tr>
										<c:if
											test='${fn:contains(funzionalita, "visualizza anagrafica completa")}'>
											<tr>
												<th scope="col">Provenienza candidatura</th>
												<td scope="col">${mostraCandidato.provenienza}</td>
											</tr>

											<tr>
												<th scope="col">Categoria protetta</th>
												<td scope="col" id="categoriaProtetta"></td>
											</tr>

										</c:if>

										<tr>
											<th scope="col">Inserito da</th>
											<td scope="col">${mostraCandidato.inseritoDa.username}</td>
										</tr>
									</tbody>
									<tfoot class="footer">
										<tr>
											<td colspan=3></td>

										</tr>
									</tfoot>
								</table>
							</div>
						</div>

						<div class="col mb-3">
							<!-- tabella ECONOMICS -->
							<c:if test='${fn:contains(funzionalita, "visualizza economics")}'>
								<div class="table-responsive">
									<table id="economicsTable" class="tabellaEconomics">
										<thead class="head">
											<tr>
												<th><h3>ECONOMICS</h3></th>
												<th colspan=2><c:if
														test='${fn:contains(funzionalita, "modifica economics")}'>
														<!-- Bottone modifica economics-->
														<button type="button" data-toggle="modal"
															data-target="#modificaEconomics" class="btn float-right">
															<i class="fas fa-user-cog"></i>
														</button>
													</c:if></th>
											</tr>
										</thead>
										<tbody class="body">
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
										<tfoot class="footer">
											<tr>
												<td colspan=2></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</c:if>
						</div>

						<div class="col">
							<!-- Tabella TITOLI DI STUDIO-->
							<table id="titoliTable" class="tabellaTitoli">

								<thead class="head">
									<tr>
										<th colspan=2><h3>TITOLI DI STUDIO</h3></th>
									</tr>
									<tr>
										<th colspan="2">Titolo di studio</th>
									</tr>
								</thead>
								<tbody class="body">
									<c:forEach var="titolo" items="${mostraCandidato.titoloStudio}">
										<tr>
											<td>${titolo.titoloStudio}</td>
											<td><c:if
													test='${fn:contains(funzionalita, "modifica titolo di studio")}'>
													<button
														onclick="impostaParametriTitoloStudio('${titolo.id}','${titolo.titoloStudio}')"
														type="button" data-toggle="modal" id="btn-modifica-titolo"
														data-target="#modificaTitoloStudio"
														class="btn float-right">
														<i class="fas fa-user-cog"></i>
													</button>
													<button
														onclick="impostaParametriEliminaTitoloStudio('${titolo.id}')"
														type="button" data-toggle="modal" id="btn-cancella-titolo"
														data-target="#eliminaTitoloStudio" class="btn float-right">
														<i class="fas fa-trash"></i>
													</button>
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>

								<tfoot class="footer">
									<tr>
										<td colspan=2></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>

				<div class="col mt-5">
					<div class="row d-flex flex-column">
						<div class="col mb-3">
							<!-- tabella BUSINESS-->
							<c:if
								test='${fn:contains(funzionalita, "visualizza profilo professionale")}'>
								<div class="table-responsive">
									<table class="tabellaBusiness">
										<thead class="head">
											<tr>
												<th><h3>BUSINESS</h3></th>
												<th colspan=3></th>
											</tr>
										</thead>

										<tbody class="body">
											<!-- BUSINESS UNIT -->
											<tr>
												<th scope="col">Business unit</th>
												<td scope="col">${mostraCandidato.business.business}</td>
												<th><c:if
														test='${fn:contains(funzionalita, "modifica profilo professionale")}'>
														<!-- Bottone modifica business unit -->
														<button type="button" data-toggle="modal"
															data-target="#modificaBusinessUnit"
															class="btn float-right btn-business-unit">
															<i class="fas fa-user-cog"></i>
														</button>

													</c:if></th>
											</tr>
											<!-- AREA COMPETENZA -->
											<tr>
												<th scope="col">Area di competenza</th>
												<td scope="col"><c:forEach var="area"
														items="${mostraCandidato.area}">
														<li>${area.area}</li>
													</c:forEach></td>
												<th><c:if
														test='${fn:contains(funzionalita, "modifica profilo professionale")}'>
														<!-- Bottone modifica area di competenza-->
														<button type="button" data-toggle="modal"
															data-target="#modificaAreaCompetenza"
															class="btn float-right btn-business-unit">
															<i class="fas fa-user-cog"></i>
														</button>
													</c:if></th>
											</tr>
											<!-- MANSIONE -->
											<tr>
												<th scope="col">Mansione</th>
												<td scope="col"><c:forEach var="mansione"
														items="${mostraCandidato.mansione}">
														<li>${mansione.mansione}</li>
													</c:forEach></td>
												<th><c:if
														test='${fn:contains(funzionalita, "modifica profilo professionale")}'>
														<!-- Bottone modifica mansione -->
														<button type="button" data-toggle="modal"
															data-target="#modificaMansione"
															class="btn float-right btn-business-unit">
															<i class="fas fa-user-cog"></i>
														</button>
													</c:if></th>
											</tr>
											<!-- SENIORITY -->
											<tr>
												<th scope="col">Seniority</th>
												<td scope="col">${mostraCandidato.seniority.seniority}</td>
												<th><c:if
														test='${fn:contains(funzionalita, "modifica profilo professionale")}'>
														<!-- Bottone modifica seniority -->
														<button type="button" data-toggle="modal"
															data-target="#modificaSeniority"
															class="btn float-right btn-business-unit">
															<i class="fas fa-user-cog"></i>
														</button>
													</c:if></th>
											</tr>
											<!-- SPECIALIZZAZIONE -->
											<tr>
												<th scope="col">Specializzazione</th>
												<td scope="col"><c:forEach var="specializzazione"
														items="${mostraCandidato.candidatoSpecializzazione}">
														<li>${specializzazione.specializzazione.specializzazione}
															&nbsp ${specializzazione.anni} anni esperienza</li>
													</c:forEach></td>
												<th><c:if
														test='${fn:contains(funzionalita, "modifica profilo professionale")}'>
														<!-- Bottone modifica specializzazione -->
														<button type="button" data-toggle="modal"
															data-target="#modificaSpecializzazione"
															class="btn float-right btn-business-unit">
															<i class="fas fa-user-cog"></i>
														</button>
													</c:if></th>
											</tr>
											<!-- INSERIMENTO AZIENDA -->
											<tr>
												<th scope="col">Inserimento azienda</th>
												<td scope="col">${mostraCandidato.inserimentoAzienda}</td>
												<th><c:if
														test='${fn:contains(funzionalita, "modifica profilo professionale")}'>
														<!-- Bottone modifica inserimento azienda -->
														<button type="button" data-toggle="modal"
															data-target="#modificaInserimentoAzienda"
															class="btn float-right btn-business-unit">
															<i class="fas fa-user-cog"></i>
														</button>
													</c:if></th>
											</tr>
										</tbody>

										<tfoot class="footer">
											<tr>
												<td colspan=3></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</c:if>
						</div>

						<div class="col mb-3">
							<!--tabella COSTI -->
							<c:if test='${fn:contains(funzionalita, "visualizza costi")}'>

								<div class="table-responsive">
									<table id="costiTable" class="tabellaCosti">
										<thead class="head">
											<tr>
												<th><h3>COSTI</h3></th>
												<th colspan=2><c:if
														test='${fn:contains(funzionalita, "modifica costi")}'>
														<!-- Bottone modifica costi-->
														<button type="button" data-toggle="modal"
															data-target="#modificaCosti" class="btn float-right">
															<i class="fas fa-user-cog"></i>
														</button>
													</c:if></th>
											</tr>
										</thead>
										<tbody class="body">
											<tr>
												<th scope="col">Costo orario</th>
												<td scope="col">${mostraCandidato.costo.orario}</td>
											</tr>
											<tr>
												<th scope="col">Costo giornaliero</th>
												<td scope="col">${mostraCandidato.costo.giornaliero}</td>
											</tr>
											<c:if test="${not empty mostraCandidato.costo.commento}">
												<tr>
													<th scope="col">Commenti</th>
													<td scope="col">${mostraCandidato.costo.commento}</td>
												</tr>
											</c:if>
										</tbody>

										<tfoot class="footer">
											<tr>
												<td colspan=2></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</c:if>
						</div>


						<div class="col">
							<!-- Tabella COMPETENZE LINGUISTICHE-->
							<table id="competenzeLinguisticheTable"
								class="tabellaCompetenzeLinguistiche">

								<thead class="head">
									<tr>
										<th colspan=5><h3>COMPETENZE LINGUISTICHE</h3></th>
										<th colspan=5>
									</tr>
									<tr>
										<th>Lingua</th>
										<th>Letto</th>
										<th>Scritto</th>
										<th>Parlato</th>
										<th colspan=2></th>
									</tr>
								</thead>
								<tbody class="body" id="competenzaLinguisticaBodyTable">
									<c:forEach var="item"
										items="${mostraCandidato.candidatoCompetenzaLingustica}">
										<c:choose>
											<c:when test="${item.madreLingua == true}">
												<tr>
													<th scope="col">Madre lingua :
														${item.competenzaLinguistica.lingua}</th>
													<td scope="col"></td>
													<td scope="col"></td>
													<td scope="col"></td>
													<c:if
														test='${fn:contains(funzionalita, "modifica competenza linguistica")}'>
														<td>
															<button
																onclick="impostaParametriEliminaCompetenzaLinguistica('${item.competenzaLinguistica.id}')"
																type="button" data-toggle="modal"
																data-target="#eliminaCompetenzaLinguistica"
																class="btn float-right btn-elimina-competenza">
																<i class="fas fa-trash"></i>
															</button>
														</td>
														<td>
															<button
																onclick="impostaParametriModificaCompetenzaLinguistica('${item.competenzaLinguistica.id}','${item.competenzaLinguistica.lingua}','${item.madreLingua}', '${item.letto}','${item.scritto}','${item.parlato}')"
																type="button" data-toggle="modal"
																data-target="#modificaCompetenzaLinguistica"
																class="btn float-right btn-modifica-competenza">
																<i class="fas fa-user-cog"></i>
															</button>
														</td>
													</c:if>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<th scope="col">Lingua :
														${item.competenzaLinguistica.lingua}</th>
													<td scope="col">${item.letto}</td>
													<td scope="col">${item.scritto}</td>
													<td scope="col">${item.parlato}</td>
													<c:if
														test='${fn:contains(funzionalita, "modifica competenza linguistica")}'>
														<td>
															<button
																onclick="impostaParametriEliminaCompetenzaLinguistica('${item.competenzaLinguistica.id}')"
																type="button" data-toggle="modal"
																id="btn-competenza-linguistica"
																data-target="#eliminaCompetenzaLinguistica"
																class="btn float-right btn-elimina-competenza">
																<i class="fas fa-trash "></i>
															</button>
														</td>
														<td>
															<button
																onclick="impostaParametriModificaCompetenzaLinguistica('${item.competenzaLinguistica.id}','${item.competenzaLinguistica.lingua}','${item.madreLingua}', '${item.letto}','${item.scritto}','${item.parlato}')"
																type="button" data-toggle="modal"
																data-target="#modificaCompetenzaLinguistica"
																class="btn float-right btn-modifica-competenza">
																<i class="fas fa-user-cog"></i>
															</button>
														</td>
													</c:if>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</tbody>

								<tfoot class="footer">
									<tr>
										<td colspan=6></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="row d-flex flex-column">
				<div class="col mt-5 mb-3">
					<!-- Tabella FEEDBACK -->
					<div class="table-responsive">
						<table class="tabellaFeedback" id="feedbackTable">
							<thead class="head">
								<tr>
									<th colspan="4"><h3>FEEDBACK</h3></th>
								</tr>

								<tr>
									<th scope="col">Data</th>
									<th scope="col">Tipo</th>
									<th scope="col">Feedback</th>
									<th scope="col"></th>
								</tr>
							</thead>

							<tbody class="body">
								<c:forEach var="feed" items="${mostraFeedback}">
									<tr>
										<td>${feed.data}</td>
										<td>${feed.tipo.tipo}</td>
										<c:set var="commento"
											value="${fn:replace(feed.commento, singlequote, backslash)}"></c:set>
										<c:set var="commentoXSS"
											value="${fn:escapeXml(feed.commento)}"></c:set>
										<td>${commentoXSS}</td>
										<td><c:if
												test='${fn:contains(funzionalita, "modifica feedback")}'>
												<button
													onclick="impostaParametriEliminaFeedback('${feed.id}')"
													type="button" data-toggle="modal" id="btn-elimina-feedback"
													data-target="#eliminaFeedback" class="btn float-right">
													<i class="fas fa-trash"></i>
												</button>
												<button
													onclick="impostaParametriFeedback('${feed.id}', '${feed.tipo.tipo}', '${feed.data}', '${commento}')"
													type="button" data-toggle="modal"
													id="btn-modifica-feedback" data-target="#modificaFeedback"
													class="btn float-right">
													<i class="fas fa-user-cog"></i>
												</button>
											</c:if></td>
									</tr>
								</c:forEach>
							</tbody>

							<tfoot class="footer">
								<tr>
									<td colspan=4></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>

				<div class="col mb-3">
					<!-- tabella QUALIFICATION MEETING-->
					<div class="table-responsive">
						<table id="qualificationMeetingTable" class="tabellaQualification">
							<thead class="head">
								<tr>
									<th colspan=6><h3>QUALIFICATION MEETING</h3></th>
								</tr>
								<tr>
									<th scope="col">Cliente</th>
									<th scope="col">Data di presentazione</th>
									<th scope="col">Riferimento gara</th>
									<th scope="col">Data colloquio</th>
									<th scope="col">Feedback</th>
									<th scope="col"></th>
								</tr>
							</thead>

							<tbody class="body">
								<c:forEach var="qualificationMeeting"
									items="${mostraCandidato.qm}">
									<tr>

										<c:set var="cliente"
											value="${fn:replace(qualificationMeeting.cliente, singlequote, backslash)}"></c:set>
										<c:set var="clienteXSS"
											value="${fn:escapeXml(qualificationMeeting.cliente)}"></c:set>
										<td>${clienteXSS}</td>
										<td>${qualificationMeeting.dataPresentato}</td>
										<c:set var="riferimentoGara"
											value="${fn:replace(qualificationMeeting.riferimentoGara, singlequote, backslash)}"></c:set>
										<c:set var="riferimentoGaraXSS"
											value="${fn:escapeXml(qualificationMeeting.riferimentoGara)}"></c:set>
										<td>${riferimentoGaraXSS}</td>
										<td>${qualificationMeeting.dataColloquio}</td>
										<c:set var="feedback"
											value="${fn:replace(qualificationMeeting.feedback, singlequote, backslash)}"></c:set>
										<c:set var="feedbackXSS"
											value="${fn:escapeXml(qualificationMeeting.feedback)}"></c:set>
										<td>${feedbackXSS}</td>
										<td><c:if
												test='${fn:contains(funzionalita, "modifica qualification meeting")}'>
												<button
													onclick="impostaParametriEliminaQualificationMeeting('${qualificationMeeting.id}')"
													type="button" data-toggle="modal"
													id="btn-elimina-qualification"
													data-target="#eliminaQualificationMeeting"
													class="btn float-right">
													<i class="fas fa-trash"></i>
												</button>
												<button
													onclick="impostaParametriQualificationMeeting('${qualificationMeeting.id}','${cliente}','${qualificationMeeting.dataPresentato}','${riferimentoGara}','${qualificationMeeting.dataColloquio}','${feedback}')"
													type="button" data-toggle="modal"
													id="btn-modifica-qualification"
													data-target="#modificaQualificationMeeting"
													class="btn float-right">
													<i class="fas fa-user-cog"></i>
												</button>
											</c:if></td>
										<!-- "${fn:escapeXml(param.foo)}" -->
									</tr>
								</c:forEach>
							</tbody>

							<tfoot class="footer">
								<tr>
									<td colspan=6></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>

				<div class="col mb-5">
					<!-- Tabella ALLEGATI -->
					<c:if test='${fn:contains(funzionalita, "visualizza allegati")}'>
						<div class="table-responsive">
							<table id="allegatiTable" class="tabellaAllegati">
								<thead class="head">
									<tr>
										<th colspan=3><h3>ALLEGATI</h3></th>
									</tr>
									<tr>
										<th scope="col">Nome allegato</th>
										<th scope="col"></th>
										<th scope="col"></th>
									</tr>
								</thead>

								<tbody class="body">
									<c:forEach var="allegato" items="${mostraCandidato.file}">
										<tr>
											<td>${allegato.nomeFile}</td>
											<td><a
												href="<c:url value='/download/${businessUnit}/${mostraCandidato.id}/${allegato.id}' />"
												class="btn" id="btn-salva-allegato">Scarica</a></td>
											<td>
												<button onclick="impostaParametriAllegati(${allegato.id})"
													type="button" class="btn" id="btn-cancella-allegato"
													data-toggle="modal" data-target="#eliminaAllegato">Cancella</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>

								<tfoot class="footer">
									<tr>
										<td colspan=5></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</header>

	<!-- ================================================================================================================= -->
	<!-- ===  MODAL MODIFICA TABELLA ANAGRAFICA === -->
	<div class="modal fade" id="modificaAnagrafica" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaAnagrafica"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica anagrafica:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="mostraCandidato"
					onsubmit="return validateAnagraficaForm();"
					action="/ProgettoHR/ModificaAnagrafica/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row d-flex flex-column">
								<div class="col">
									<div class="form-group">
										<label>Nome:</label>
										<form:input type="text" class="form-control" id="idNome"
											name="nome" path="nome" value="${mostraCandidato.nome}"
											required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Cognome:</label>
										<form:input type="text" class="form-control" id="idCognome"
											name="cognome" path="cognome"
											value="${mostraCandidato.cognome}" required="required"></form:input>
									</div>

								</div>
								<div class="col">
									<div class="form-group">
										<label>Data di nascita:</label> <input type="date"
											pattern="yyyy-MM-dd" class="form-control" id="idDataNascita"
											name="dataDiNascita" value="${mostraCandidato.dataNascita}"></input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Telefono:</label>
										<form:input type="text" class="form-control" id="idTelefono"
											name="telefono" path="telefono" placeholder="123-456-7890"
											value="${mostraCandidato.telefono}" required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>E-mail:</label>
										<form:input type="text" class="form-control" id="idEmail"
											size="30" name="email" path="email"
											value="${mostraCandidato.email}" required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Codice Fiscale:</label>
										<form:input type="text" class="form-control" maxlength="16"
											id="idCodiceFiscale" name="codiceFiscale"
											path="codiceFiscale" value="${mostraCandidato.codiceFiscale}"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Provenienza Candidatura:</label>
										<form:input type="text" class="form-control"
											id="idProvenienzaCandidatura" name="provenienzaCandidatura"
											path="provenienza" value="${mostraCandidato.provenienza}"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<div class="custom-control custom-switch">
											<form:checkbox class="custom-control-input"
												path="categoriaProtetta" id="customSwitch1"
												name="categoriaProtetta"></form:checkbox>
											<label class="custom-control-label" for="customSwitch1">Categoria
												protetta</label>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="reset" class="btn btn-danger btn-block">Annulla
							modifiche</button>
						<button type="submit" id="idSubmitModificaAnagrafica"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ================================================================================================================= -->

	<!-- ------------------------------------------------------------------------------------------------- -->
	<!-- === GRUPPO DI MODAL CHE MODIFICANO LA TABELLA BUSINESS === -->
	<!-- ------------------------------------------------------------------------------------------------- -->

	<!-- ================================================================================================ -->
	<!-- === MODAL MODIFICA BUSINESS UNIT === -->
	<div class="modal fade" id="modificaBusinessUnit" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaBusinessUnit"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica la business unit:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaBusinessUnit/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="form-group">
							<h5 class="text-center">Scegli la business unit:</h5>
							<select id="inputState" class="form-control text-center"
								name="businessUnit">
								<option disabled selected>Business unit</option>
								<c:forEach var="business" items="${businessList}">
									<option value="${business.business}">${business.business}</option>
								</c:forEach>
							</select>
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
	<!-- ================================================================================================= -->

	<!-- ===================================================================================================== -->
	<!-- === MODAL MODIFICA AREA DI COMPETENZA === -->
	<div class="modal fade" id="modificaAreaCompetenza" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaAreaCompetenza"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica le aree di competenza:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaAreaCompetenza/${businessUnit}/${mostraCandidato.id}"
					onsubmit="return validateMyForm('areaCompetenzaInput')">
					<div class="modal-body">
						<h5>Aree di competenza:</h5>
						<div id="areaCompetenzeCandidato">
							<c:forEach var="area" items="${mostraCandidato.area}">
								<div class="form-row">
									<div class="col-11">
										<input readonly type="text" name="areaCompetenza"
											class="form-control mb-2" style="background-color: #a7d8bb;"
											value="${area.area}"></input>
									</div>
									<div class="col-1">
										<span
											onclick="eliminaCampo('${area.area}', 'areaCompetenzeCandidato')"
											class="btn"><i class="fas fa-minus"></i> </span>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="form-row">
							<div class="col-11">
								<input autocomplete="off" placeholder="aggiungi"
									list="areeCompetenzeDisponibili" id="areaCompetenzaInput"
									class="form-control mt-2">
								<datalist id="areeCompetenzeDisponibili">
									<c:forEach var="area" items="${areaCompetenzaList}">
										<option value="${area}"></option>
									</c:forEach>
								</datalist>
							</div>
							<div class="col-1">
								<div
									onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
									class="btn mt-2">
									<i class="fas fa-plus"></i>
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
	<!-- ===================================================================================================== -->

	<!-- ===================================================================================================== -->
	<!-- === MODAL MODIFICA MANSIONE === -->
	<div class="modal fade" id="modificaMansione" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaMansione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica le mansioni:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaMansione/${businessUnit}/${mostraCandidato.id}"
					onsubmit="return validateMyForm('mansioneInput');">
					<div class="modal-body">
						<h5>Mansioni:</h5>
						<div id="mansioniCandidato">
							<c:forEach var="mansione" items="${mostraCandidato.mansione}">
								<div class="form-row">
									<div class="col-11">
										<input style="background-color: #a7d8bb;" readonly type="text"
											class="form-control mb-2" name="mansione"
											value="${mansione.mansione}"></input>
									</div>
									<div class="col-1">
										<span
											onclick="eliminaCampo('${mansione.mansione}', 'mansioniCandidato')"
											class="btn"><i class="fas fa-minus"></i> </span>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="form-row">
							<div class="col-11">

								<input autocomplete="off" placeholder="aggiungi"
									list="mansioniDisponibili" id="mansioneInput"
									class="form-control mt-2">
								<datalist id="mansioniDisponibili">
									<c:forEach var="mansione" items="${mansioneList}">
										<option value="${mansione}"></option>
									</c:forEach>
								</datalist>
							</div>
							<div class="col-1">
								<div onclick="stampaMansioneSelezionata('${mansioneList}')"
									class="btn mt-2">
									<i class="fas fa-plus"></i>
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
	<!-- ======================================================================================================= -->

	<!-- ==================================================================================================== -->
	<!-- === MODAL MODIFICA SENIORITY === -->
	<div class="modal fade" id="modificaSeniority" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaSeniority"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica la seniority:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaSeniority/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="form-group">
							<h5 class="text-center">Scegli la seniority:</h5>
							<select id="senioritySelezionata"
								class="form-control text-center" name="seniority">
								<option disabled selected>Seniority</option>
								<c:forEach var="seniority" items="${seniorityList}">
									<option value="${seniority.seniority}">${seniority.seniority}</option>
								</c:forEach>
							</select>
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
	<!-- ==================================================================================================== -->

	<!-- ================================================================================================================================================ -->
	<!-- === MODAL MODIFICA SPECIALIZZAZIONE === -->
	<div class="modal fade" id="modificaSpecializzazione" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaSpecializzazione"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica le specializzazioni:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaSpecializzazione/${businessUnit}/${mostraCandidato.id}"
					onsubmit="return validateMyForm('specializzazioneInput');">
					<div class="modal-body">
						<h5>Specializzazioni:</h5>
						<div id="specializzazioniCandidato">
							<c:forEach var="spec"
								items="${mostraCandidato.candidatoSpecializzazione}">
								<div class="form-row">
									<div class="col-11">
										<input readonly type="text" class="form-control mb-2"
											style="background-color: #a7d8bb;" name="specializzazione"
											value="${spec.specializzazione.specializzazione} ${spec.anni}"></input>
									</div>
									<div class="col-1">
										<span
											onclick="eliminaCampo('${spec.specializzazione.specializzazione} ${spec.anni}', 'specializzazioniCandidato')"
											class="btn"><i class="fas fa-minus"></i> </span>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="form-row">
							<div class="col-6">
								<div>
									<input autocomplete="off" placeholder="aggiungi"
										list="specializzazioniDisponibili" id="specializzazioneInput"
										class="form-control mt-2">
									<datalist id="specializzazioniDisponibili">
										<c:forEach var="specializzazione"
											items="${specializzazioneList}">
											<option value="${specializzazione}"></option>
										</c:forEach>
									</datalist>
								</div>
							</div>
							<div class="col-5">
								<input id="anniEsperienzaInput" class="form-control mt-2"
									type="number" placeholder="anni esperienza">
							</div>
							<div class="col-1">
								<div
									onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
									class="btn mt-2">
									<i class="fas fa-plus"></i>
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
	<!-- ================================================================================================================================================ -->

	<!-- ====================================================================================================== -->
	<!-- === MODIFICA INSERIMENTO AZIENDA === -->
	<div class="modal fade" id="modificaInserimentoAzienda" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaInserimentoAzienda"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica l'inserimento in azienda:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="POST"
					action="/ProgettoHR/ModificaDataInserimentoAzienda/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="form-group">
							<label>Data d'inserimento in azienda:</label> <input type="date"
								pattern="yyyy-MM-dd"
								value="${mostraCandidato.inserimentoAzienda}"
								class="form-control" id="idInserimentoAzienda"
								name="dataInserimentoAzienda"></input>
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
	<!-- ======================================================================================================== -->
	<!-- -------------------------------------------------------------------------------------------------------- -->

	<!-- ============================================================================================================= -->
	<!-- === MODAL MODIFICA E AGGIUNGI ECONOMICS === -->
	<div class="modal fade" id="modificaEconomics" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaEconomics"
		aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi/Modifica economics:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="mostraCandidato"
					onsubmit="return validateEconomicsForm()"
					action="/ProgettoHR/AggiungiModificaEconomics/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row d-flex flex-column">
								<div class="col">
									<div class="form-group">
										<label>Inquadramento: </label>
										<form:input type="text" class="form-control"
											id="idInquadramento" name="Inquadramento"
											path="economics.inquadramento"
											value="${economics.inquadramento}" required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>RAL: </label>
										<form:input type="text" class="form-control" id="idRAL"
											maxlength="9" name="RAL" path="economics.ral"
											value="${economics.ral}" required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Benefit:</label>
										<form:input type="text" class="form-control" id="idBenefit"
											name="benefit" path="economics.benefit"
											value="${economics.benefit}" required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Preavviso:</label>
										<form:input type="text" class="form-control" id="idPreavviso"
											name="preavviso" path="economics.preavviso"
											value="${economics.preavviso}" required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Desiderata: </label>
										<form:input type="text" class="form-control" id="idDesiderata"
											name="desiderata" path="economics.desiderata" maxlength="9"
											value="${economics.desiderata}" required="required"></form:input>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="reset" class="btn btn-danger btn-block">Annulla
							modifiche</button>
						<button type="submit" id="idSubmitAggiungiEconomics"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ============================================================================================================= -->

	<!-- ======================================================================================================================= -->
	<!--  === MODAL MODIFICA COSTI === -->
	<div class="modal fade" id="modificaCosti" tabindex="-1" role="dialog"
		aria-labelledby="modalModificaCosti" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica costi:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="mostraCandidato"
					onsubmit="return validateCostoForm('idSubmitAggiungiCosto', 'idCostoOrario', 'idCostoGiornaliero')"
					action="/ProgettoHR/AggiungiModificaCosto/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row d-flex flex-column">
								<div class="col">
									<div class="form-group">
										<label>Costo orario:</label>
										<form:input type="number" step="0.01" class="form-control"
											id="idCostoOrario" name="costoOrario" path="costo.orario"
											value="${costo.orario}" required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Costo giornaliero:</label>
										<form:input type="number" step="0.01" class="form-control"
											id="idCostoGiornaliero" name="costoGiornaliero"
											path="costo.giornaliero" value="${costo.giornaliero}"
											required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Commenti:</label>
										<form:textarea class="form-control" maxlength="1000" rows="6"
											style="resize: none;" id="idCommentiCosto" name="commenti"
											path="costo.commento" value="${costo.commento}"></form:textarea>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="reset" class="btn btn-danger btn-block">Annulla
							modifiche</button>
						<button type="submit" id="idSubmitAggiungiCosto"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ======================================================================================================================= -->


	<!-- ------------------------------------------------------------------------------------------------- -->
	<!-- === GRUPPO DI MODAL CHE MODIFICANO,AGGIUNGONO E CANCELLANO LA TABELLA TITOLI DI STUDIO === -->
	<!-- ------------------------------------------------------------------------------------------------- -->

	<!-- ====================================================================================================== -->
	<!-- === MODAL AGGIUNGI TITOLI DI STUDIO === -->
	<div class="modal fade" id="aggiungiTitoloStudio" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiTitoloStudio"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi un titolo di studio:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="titoloStudio"
					action="/ProgettoHR/AggiungiTitoloStudio/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col">
									<form:input type="text" class="form-control"
										id="idTitoloStudio" name="titoloStudio" path="titoloStudio"
										value="" required="required"></form:input>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="reset" class="btn btn-danger btn-block">Annulla
							modifiche</button>
						<button type="submit" id="idSubmitAggiungiCosto"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ====================================================================================================== -->

	<!-- ====================================================================================================== -->
	<!-- === MODAL MODIFICA TITOLI DI STUDIO === -->
	<div class="modal fade" id="modificaTitoloStudio" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaTitoloStudio"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica il titolo di studio:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="titoloStudio"
					action="/ProgettoHR/ModificaTitoloStudio/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col">
									<form:input type="text" class="form-control"
										id="idModificaTitoloStudio" name="modificaTitoloStudio"
										path="titoloStudio" value="${titoloStudio.titoloStudio}"
										required="required"></form:input>
									<form:input style="visibility: hidden;"
										name="modificaTitoloStudioId" id="modificaTitoloStudioId"
										path="id" />
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="reset" class="btn btn-danger btn-block">Annulla
							modifiche</button>
						<button type="submit" id="idSubmitAggiungiCosto"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ====================================================================================================== -->

	<!-- ===================================================================================== -->
	<!-- === MODAL CANCELLA TITOLO STUDIO === -->
	<div class="modal fade" id="eliminaTitoloStudio" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaTitoloStudio"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/EliminaTitoloStudio/${businessUnit}/${id}"
					method="POST">

					<div class="modal-header">
						<h5 class="modal-title">Eliminazione del titolo di studio:</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>

					</div>

					<div class="modal-body">
						<input style="visibility: hidden;" name="titoloStudioIdRemove"
							id="titoloStudioRemove" />
						<p>Sei sicuro di voler cancellare il titolo di studio
							selezionato?</p>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-success">Sì</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- ===================================================================================== -->
	<!-- ------------------------------------------------------------------------------------- -->


	<!-- ------------------------------------------------------------------------------------------------- -->
	<!-- === GRUPPO DI MODAL CHE MODIFICANO,AGGIUNGONO E CANCELLANO LA TABELLA COMPETENZE LINGUISTICHE === -->
	<!-- ------------------------------------------------------------------------------------------------- -->

	<!-- ===================================================================================================== -->
	<!-- === MODAL AGGIUNGI COMPETENZA LINGUISTICA === -->
	<div class="modal fade " id="aggiungiCompetenzaLinguistica"
		tabindex="-1" role="dialog"
		aria-labelledby="modalAggiungiCompetenzaLinguistica"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi una competenza linguistica:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST"
					modelAttribute="candidatoCompetenzaLinguistica"
					onsubmit="return validateCompetenzaLinguisticaForm('linguaInput')"
					action="/ProgettoHR/AggiungiCompetenzaLinguistica/${businessUnit}/${mostraCandidato.id}">

					<div class="modal-body">
						<div class="container-fluid">
							<div class="row d-flex flex-column">
								<div class="col">
									<div class="form-group">
										<h5>Inserisci una lingua:</h5>
										<form:input autocomplete="off" list="lingueDisponibili"
											id="linguaInput" path="competenzaLinguistica.lingua"
											class="form-control mt-2"></form:input>
										<datalist id="lingueDisponibili">
											<c:forEach var="competenzaLinguistica"
												items="${competenzaLinguisticaList}">
												<option value="${competenzaLinguistica.lingua}"></option>
											</c:forEach>
										</datalist>
									</div>
								</div>

								<div class="col">
									<div class="form-group">
										<label for="madrelingua">Madrelingua:</label>
										<form:checkbox
											onchange="hideOrDisplayLevels('madrelingua', 'idLetto', 'idScritto', 'idParlato')"
											data-toggle="switch" name="madrelingua" path="madreLingua"
											id="madrelingua" value="false" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">

									<div class="form-group">
										<label for="letto">Letto:</label>
										<form:select id="idLetto" path="letto"
											class="form-control text-center" name="letto">
											<option disabled selected>Livello</option>
											<option value="A1">A1</option>
											<option value="A2">A2</option>
											<option value="B1">B1</option>
											<option value="B2">B2</option>
											<option value="C1">C1</option>
											<option value="C2">C2</option>
										</form:select>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="scritto">Scritto:</label>
										<form:select id="idScritto" path="scritto"
											class="form-control text-center" name="scritto">
											<option disabled selected>Livello</option>
											<option value="A1">A1</option>
											<option value="A2">A2</option>
											<option value="B1">B1</option>
											<option value="B2">B2</option>
											<option value="C1">C1</option>
											<option value="C2">C2</option>
										</form:select>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="parlato">Parlato:</label>
										<form:select id="idParlato" path="parlato"
											class="form-control text-center" name="parlato">
											<option disabled selected>Livello</option>
											<option value="A1">A1</option>
											<option value="A2">A2</option>
											<option value="B1">B1</option>
											<option value="B2">B2</option>
											<option value="C1">C1</option>
											<option value="C2">C2</option>
										</form:select>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
						<button type="submit" class="btn btn-success">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ===================================================================================================== -->

	<!-- ===================================================================================================== -->
	<!-- === MODAL MODIFICA COMPETENZA LINGUISTICA === -->
	<div class="modal fade " id="modificaCompetenzaLinguistica"
		tabindex="-1" role="dialog"
		aria-labelledby="modalModificaCompetenzaLinguistica"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica la competenza linguistica:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST"
					modelAttribute="candidatoCompetenzaLinguistica"
					action="/ProgettoHR/ModificaCompetenzaLinguistica/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col">
									<form:input style="visibility: hidden;"
										path="competenzaLinguistica.id"
										name="modificaCompetenzaLinguistica"
										id="idModificaCompetenzaLinguistica" />
									<div class="form-group">
										<h5>Inserisci un'altra lingua:</h5>
										<form:input autocomplete="off" list="lingueDisponibili"
											id="linguaModificaCompetenzaLinguistica"
											path="competenzaLinguistica.lingua" class="form-control mt-2"></form:input>
										<datalist id="lingueDisponibili">
											<c:forEach var="competenzaLinguistica"
												items="${competenzaLinguisticaList}">
												<option value="${competenzaLinguistica.lingua}"></option>
											</c:forEach>
										</datalist>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="madrelingua">Madrelingua:</label>
										<form:checkbox
											onchange="hideOrDisplayLevels('madrelinguaModificaCompetenzaLinguistica', 'idModificaLetto', 'idModificaScritto', 'idModificaParlato')"
											data-toggle="switch" name="madrelingua" path="madreLingua"
											id="madrelinguaModificaCompetenzaLinguistica" value="false" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div class="form-group">
										<label for="letto">Letto:</label>
										<form:select id="idModificaLetto" path="letto"
											class="form-control text-center" name="modificaLetto">
											<option disabled selected>Livello</option>
											<option value="A1">A1</option>
											<option value="A2">A2</option>
											<option value="B1">B1</option>
											<option value="B2">B2</option>
											<option value="C1">C1</option>
											<option value="C2">C2</option>
										</form:select>
									</div>
								</div>

								<div class="col">
									<div class="form-group">
										<label for="scritto">Scritto:</label>
										<form:select id="idModificaScritto" path="scritto"
											class="form-control text-center" name="modificaScritto">
											<option disabled selected>Livello</option>
											<option value="A1">A1</option>
											<option value="A2">A2</option>
											<option value="B1">B1</option>
											<option value="B2">B2</option>
											<option value="C1">C1</option>
											<option value="C2">C2</option>
										</form:select>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label for="parlato">Parlato:</label>
										<form:select id="idModificaParlato" path="parlato"
											class="form-control text-center" name="modificaParlato">
											<option disabled selected>Livello</option>
											<option value="A1">A1</option>
											<option value="A2">A2</option>
											<option value="B1">B1</option>
											<option value="B2">B2</option>
											<option value="C1">C1</option>
											<option value="C2">C2</option>
										</form:select>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
						<button type="submit" class="btn btn-success">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ===================================================================================================== -->

	<!-- =================================================================================== -->
	<!-- === MODAL CANCELLA COMPETENZA LINGUISTICA === -->
	<div class="modal fade" id="eliminaCompetenzaLinguistica" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaCompetenzaLinguistica"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form
					action="/ProgettoHR/EliminaCompetenzaLinguistica/${businessUnit}/${id}"
					method="POST">

					<div class="modal-header">
						<h5 class="modal-title">Eliminazione della competenza
							linguistica:</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<input style="visibility: hidden;"
							name="removeCompetenzaLinguistica"
							id="removeCompetenzaLinguisticaId" />
						<p>Sei sicuro di voler cancellare la competenza linguistica
							selezionata?</p>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-success">Sì</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- =================================================================================== -->
	<!-- ----------------------------------------------------------------------------------- -->

	<!-- ------------------------------------------------------------------------------------------------- -->
	<!-- === GRUPPO DI MODAL CHE MODIFICANO,AGGIUNGONO E CANCELLANO LA TABELLA QUALIFICATION MEETING === -->
	<!-- ------------------------------------------------------------------------------------------------- -->

	<!-- ================================================================================================================================================================================================= -->
	<!-- === MODAL MODIFICA QUALIFICATION MEETING === -->
	<div class="modal fade" id="modificaQualificationMeeting" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaQualificationMeeting"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica il qualification meeting:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="qualificationMeeting"
					onsubmit="return validateForm('idSubmitModificaQM', 'clienteQualificationMeeting', 'dataPresentatoQualificationMeeting', 'riferimentoGaraQualificationMeeting', 'dataColloquioQualificationMeeting', 'feedbackQualificationMeeting');"
					action="/ProgettoHR/ModificaQualificationMeeting/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row d-flex flex-column">
								<div class="col">
									<div class="form-group">
										<form:input path="id" type="hidden" class="form-control"
											id="idQualificationMeeting" name="idQualificationMeeting"
											value=""></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Cliente:</label>
										<form:input id="clienteQualificationMeeting" type="text"
											class="form-control" path="cliente" name="cliente"
											required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Data di presentazione:</label>
										<form:input id="dataPresentatoQualificationMeeting"
											type="date" pattern="yyyy-MM-dd" class="form-control"
											path="dataPresentato" name="dataPresentato"
											required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Riferimento gara:</label>
										<form:input type="text" class="form-control"
											id="riferimentoGaraQualificationMeeting"
											path="riferimentoGara" name="riferimentoGara"
											required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Data colloquio:</label>
										<form:input type="date" pattern="yyyy-MM-dd"
											class="form-control" id="dataColloquioQualificationMeeting"
											path="dataColloquio" name="commenti" required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Feedback:</label>
										<form:textarea class="form-control" maxlength="1000" rows="6"
											style="resize: none;" id="feedbackQualificationMeeting"
											path="feedback" name="commenti" required="required"></form:textarea>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="reset" class="btn btn-danger btn-block">Annulla
							modifiche</button>
						<button type="submit" id="idSubmitModificaQM"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ================================================================================================================================================================================================= -->

	<!-- ============================================================================================================================================================================= -->
	<!-- MODAL AGGIUNTA QUALIFICATION MEETING -->
	<div class="modal fade" id="aggiungiQualificationMeeting" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiQualificationmeeting"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi un qualification meeting:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="qualificationMeeting"
					onsubmit="return validateForm('idSubmitAggiungiQM', 'idClienteQM', 'idDataPresentazioneQM', 'idRiferimentoGaraQM', 'idDataColloquioQM', 'idCommentiQM');"
					action="/ProgettoHR/AggiungiQualificationMeeting/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row d-flex flex-column">
								<div class="col">
									<div class="form-group">
										<label>Cliente:</label>
										<form:input type="text" class="form-control" id="idClienteQM"
											path="cliente" name="costoOrario"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Data di presentazione:</label>
										<form:input type="date" pattern="yyyy-MM-dd"
											class="form-control" id="idDataPresentazioneQM"
											path="dataPresentato" name="costoGiornaliero"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Riferimento gara:</label>
										<form:input type="text" class="form-control"
											id="idRiferimentoGaraQM" path="riferimentoGara"
											name="commenti"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Data colloquio:</label>
										<form:input type="date" pattern="yyyy-MM-dd"
											class="form-control" id="idDataColloquioQM"
											path="dataColloquio" name="commenti"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Feedback:</label>
										<form:textarea maxlength="1000" rows="6" style="resize: none;"
											class="form-control" id="idCommentiQM" path="feedback"
											name="commenti"></form:textarea>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger btn-block"
							data-dismiss="modal">Chiudi</button>
						<button type="submit" id="idSubmitAggiungiQM"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ============================================================================================================================================================================= -->

	<!-- =================================================================================== -->
	<!-- === MODAL CANCELLA QUALIFICATION MEETING === -->
	<div class="modal fade" id="eliminaQualificationMeeting" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaQualificationMeeting"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Elimina il qualification meeting:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form
					action="/ProgettoHR/EliminaQualificationMeeting/${businessUnit}/${id}"
					method="POST">
					<div class="modal-body">
						<p>Sei sicuro di voler cancellare il qualification meeting
							selezionato?</p>
						<input style="visibility: hidden;" name="qualification"
							id="qualification" />
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-success">Sì</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- =================================================================================== -->
	<!-- ----------------------------------------------------------------------------------- -->


	<!-- ------------------------------------------------------------------------------------------------- -->
	<!-- === GRUPPO DI MODAL CHE MODIFICANO,AGGIUNGONO E CANCELLANO LA TABELLA FEEDBACK === -->
	<!-- ------------------------------------------------------------------------------------------------- -->

	<!-- ====================================================================================================================== -->
	<!-- === MODAL AGGIUNTA FEEDBACK === -->
	<div class="modal fade" id="aggiungiFeedback" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiFeedback"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi un feedback:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="feedback"
					onsubmit="return validateForm('idSubmitAggiungiFeedback', 'idDataFeedback', 'idCommentoFeedback')"
					action="/ProgettoHR/AggiungiFeedback/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row d-flex flex-column">
								<div class="col">
									<div class="form-group">
										<label>Tipo:</label>
										<form:input readOnly="true" path="tipo.tipo" type="text"
											class="form-control" id="tipoAggiungiFeedback"
											name="tipoFeedback" value=""></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Data:</label>
										<form:input path="data" type="date" pattern="yyyy-MM-dd"
											class="form-control" id="idDataFeedback" name="data"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Feedback:</label>
										<form:textarea path="commento" maxlength="1000" rows="6"
											style="resize: none;" class="form-control"
											id="idCommentoFeedback" name="feedback"></form:textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btn-block"
							data-dismiss="modal">Chiudi</button>
						<button type="submit" id="idSubmitAggiungiFeedback"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- ====================================================================================================================== -->

	<!-- ============================================================================================================ -->
	<!-- === MODAL MODIFICA FEEDBACK === -->
	<div class="modal fade" id="modificaFeedback" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaFeedback"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Modifica il feedback:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form:form method="POST" modelAttribute="feedback"
					onsubmit="return validateForm('idSubmitModificaFeedback', 'dataFeedback', 'commentoFeedback')"
					action="/ProgettoHR/ModificaFeedback/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row d-flex flex-column">
								<div class="col">
									<div class="form-group">
										<form:input path="id" type="hidden" class="form-control"
											id="idFeedback" name="idFeedback" value=""></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Tipo:</label>
										<form:select id="tipoModificaFeedback"
											class="form-control text-center" name="tipoFeedback"
											path="tipo.tipo">

											<c:forEach var="tipo" items="${tipoFeedbackList}">
												<option value="${tipo.tipo}">${tipo.tipo}</option>
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Data:</label>
										<form:input id="dataFeedback" path="data" type="date"
											pattern="yyyy-MM-dd" class="form-control" name="data"
											required="required"></form:input>
									</div>
								</div>
								<div class="col">
									<div class="form-group">
										<label>Feedback:</label>
										<form:textarea id="commentoFeedback" path="commento"
											maxlength="1000" rows="6" style="resize: none;"
											class="form-control" name="feedback" required="required"></form:textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-danger btn-block">Chiudi</button>
						<button type="submit" id="idSubmitModificaFeedback"
							class="btn btn-primary btn-block">Salva</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<!-- =============================================================================================================== -->

	<!-- =================================================================================== -->
	<!-- === MODAL CANCELLA FEEDBACK === -->
	<div class="modal fade" id="eliminaFeedback" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaFeedback"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Elimina il feedback:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/ProgettoHR/EliminaFeedback/${businessUnit}/${id}"
					method="POST">
					<div class="modal-body">
						<p>Sei sicuro di voler cancellare il feedback selezionato?</p>
						<input style="visibility: hidden;" name="removeFeedback" id="removeFeedback"/>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-success">Sì</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- ==================================================================================== -->
	<!-- ------------------------------------------------------------------------------------ -->

	<!-- ------------------------------------------------------------------------------------------------- -->
	<!-- === GRUPPO DI MODAL CHE AGGIUNGONO E CANCELLANO LA TABELLA ALLEGATI === -->
	<!-- ------------------------------------------------------------------------------------------------- -->

	<!-- ============================================================================================ -->
	<!-- === MODAL AGGIUNGI ALLEGATO === -->
	<div class="modal fade" id="aggiungiAllegato" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiAllegato"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Aggiungi un allegato:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form method="post"
					action="/ProgettoHR/doUpload/${businessUnit}/${mostraCandidato.id}"
					enctype="multipart/form-data" onsubmit="return validateFileForm()">
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col">
									<label>Pick file:</label> <input type="file" name="fileUpload"
										id="fileUpload" size="50" required="required" />
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary btn-block">Salva</button>
						<button type="button" class="btn btn-danger btn-block"
							data-dismiss="modal">Chiudi</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- =============================================================================================== -->

	<!-- ================================================================================================== -->
	<!-- MODAL CANCELLA ALLEGATO -->
	<div class="modal fade" id="eliminaAllegato" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaAllegato"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5>Elimina l'allegato:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form
					action="/ProgettoHR/delete/${businessUnit}/${mostraCandidato.id}"
					method="GET">
					<div class="modal-body">
						<p>Sei sicuro di voler cancellare l'allegato selezionato?</p>
						<div style="visibility: hidden;">
							<input name="idAllegato" id="Allegato" />
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-success">Sì</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- ================================================================================================== -->
	<!-- -------------------------------------------------------------------------------------------------- -->

	<!-- ===================================================================== -->
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
	<!-- ===================================================================== -->

	<!-- ================================================================================================================================================================================== -->
	<script type="text/javascript">
	
		function changeStato( stato, feedback, categoriaProtetta, qualificationMeeting, allegati, costi, economics, titoloStudio, competenzaLinguistica) {
			if(document.getElementById("btn-stato")!= null){
			if (stato === "Nuovo inserito") {
				document.getElementById("btn-stato").className = "btn btn-secondary dropdown-toggle";
				document.getElementById("btn-stato").innerHTML = "Nuovo inserito";
			} else if (stato === "Da contattare") {
				document.getElementById("btn-stato").className = "btn btn-warning dropdown-toggle";
				document.getElementById("btn-stato").innerHTML = "Da contattare";
			} else if (stato === "Scartato") {
				document.getElementById("btn-stato").className = "btn btn-danger dropdown-toggle";
				document.getElementById("btn-stato").innerHTML = "Scartato";
			} else if (stato === "Attivo") {
				document.getElementById("btn-stato").className = "btn btn-success dropdown-toggle";
				document.getElementById("btn-stato").innerHTML = "Attivo";
			} else if (stato === "Selezionato") {
				document.getElementById("btn-stato").className = "btn btn-primary dropdown-toggle";
				document.getElementById("btn-stato").innerHTML = "Selezionato";
			}
		}
			removeFeedbackTable(feedback);
			removeAllegatiTable(allegati);
			removeCostiTable(costi);
			removeEconomicsTable(economics);
			removeQualificationMeetingTable(qualificationMeeting);
			removeTitoloStudioTable(titoloStudio);
			removeCompetenzaLinguisticaTable(competenzaLinguistica);
			checkCategoriaProtetta(categoriaProtetta);

		}

		function removeFeedbackTable(feedback) {
			if (feedback === "[]") {
				var myobj = document.getElementById("feedbackTable");
				if(myobj != null)
				myobj.remove();
			}
		}
		
		function removeTitoloStudioTable(titoloStudio) {
			if (titoloStudio === "[]") {
				var myobj = document.getElementById("titoliTable");
				if(myobj != null)
				myobj.remove();
			}
		}
		
		function removeCompetenzaLinguisticaTable(competenzaLinguistica) {
			if (competenzaLinguistica === "[]") {
				var myobj = document.getElementById("competenzeLinguisticheTable");
				if(myobj != null)
				myobj.remove();
			}
		}

		function removeQualificationMeetingTable(qualificationMeeting) {
			if (qualificationMeeting === "[]") {
				var myobj = document
						.getElementById("qualificationMeetingTable");
				if(myobj != null)
				myobj.remove();
			}
		}

		function removeAllegatiTable(allegati) {
			if (allegati === "[]") {
				var myobj = document.getElementById("allegatiTable");
				if(myobj != null)
				myobj.remove();
			}
		}

		function removeCostiTable(costi) {
			if (costi === "") {
				var myobj = document.getElementById("costiTable");
				if(myobj != null)
				myobj.remove();
			}
		}

		function removeEconomicsTable(economics) {
			if (economics === "") {
				var myobj = document.getElementById("economicsTable");
				if(myobj != null)
				myobj.remove();
			}
		}

		function checkCategoriaProtetta(categoriaProtetta) {
			if(document.getElementById("categoriaProtetta") != null){
			if (categoriaProtetta === "true") {
				document.getElementById("categoriaProtetta").innerHTML = "Si";
			} else {
				document.getElementById("categoriaProtetta").innerHTML = "No";
			}
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
			commento = commento.replace("&apos", "'");
			document.getElementById("idFeedback").value = id;
			document.getElementById("tipoModificaFeedback").value = tipo;
			document.getElementById("dataFeedback").value = data;
			document.getElementById("commentoFeedback").value = commento;
		}
		
		function impostaParametriEliminaFeedback(id) {
			document.getElementById("removeFeedback").value = id;
		}
		
		function impostaParametriAllegati(id) {
			document.getElementById("Allegato").value = id;
		}
		
		// GESTIONE TITOLO DI STUDIO
		function impostaParametriTitoloStudio(id, titolo){
			document.getElementById("modificaTitoloStudioId").value = id;
			document.getElementById("idModificaTitoloStudio").value = titolo;
		}
		
		function impostaParametriEliminaTitoloStudio(id){
			let newId = parseInt(id);
			document.getElementById("titoloStudioRemove").value = newId;
		}
		
		
		//GESTIONE COMPETENZA LINGUISTICA
		function hideOrDisplayLevels(madrelingua, letto, scritto, parlato){
			if(document.getElementById(madrelingua).checked){
				document.getElementById(letto).disabled = true;
				document.getElementById(scritto).disabled = true;
				document.getElementById(parlato).disabled = true;
			}
			else{
				document.getElementById(letto).disabled = false;
				document.getElementById(scritto).disabled = false;
				document.getElementById(parlato).disabled = false;
				
			}
		}
			
		
		function impostaParametriEliminaCompetenzaLinguistica(id){
			document.getElementById("removeCompetenzaLinguisticaId").value = id;
		}
		
		
		function impostaParametriModificaCompetenzaLinguistica(id, lingua, madrelingua, letto, scritto, parlato){
			document.getElementById("idModificaCompetenzaLinguistica").value = id;
			document.getElementById("linguaModificaCompetenzaLinguistica").value = lingua;
			
			if(madrelingua == "true"){
				document.getElementById("madrelinguaModificaCompetenzaLinguistica").checked = true;
				hideOrDisplayLevels("madrelinguaModificaCompetenzaLinguistica", "idModificaLetto", "idModificaScritto", "idModificaParlato");
				document.getElementById("idModificaLetto").value = "Livello";
				document.getElementById("idModificaScritto").value = "Livello";
				document.getElementById("idModificaParlato").value = "Livello";
			}
			
			else{
				document.getElementById("madrelinguaModificaCompetenzaLinguistica").checked = false;
				hideOrDisplayLevels("madrelinguaModificaCompetenzaLinguistica", "idModificaLetto", "idModificaScritto", "idModificaParlato");
				document.getElementById("idModificaLetto").value = letto;
				document.getElementById("idModificaScritto").value = scritto;
				document.getElementById("idModificaParlato").value = parlato;
			}
		}
		
		
		function impostaParametriQualificationMeeting(id, cliente,
				dataPresentato, riferimentoGara, dataColloquio, feedback) {
			cliente = cliente.replace("&apos", "'");
			riferimentoGara = riferimentoGara.replace("&apos", "'");
			feedback = feedback.replace("&apos", "'");
			document.getElementById("idQualificationMeeting").value = id;
			document.getElementById("clienteQualificationMeeting").value = cliente;
			document.getElementById("dataPresentatoQualificationMeeting").value = dataPresentato;
			document.getElementById("riferimentoGaraQualificationMeeting").value = riferimentoGara;
			document.getElementById("dataColloquioQualificationMeeting").value = dataColloquio;
			document.getElementById("feedbackQualificationMeeting").value = feedback;
		}
		
		function impostaParametriEliminaQualificationMeeting(id){
			document.getElementById("qualification").value = id;
		}
		
		
		function buildString(string) {
			return string.replace("[", "").replace("]", "").split(", ");
		}
		
	
		
		// gestione MODAL DI MODIFICA AREA COMPETENZA
		function stampaAreaCompetenzaSelezionata(areaCompetenzaList) {
			
			var areeCompetenzaEsistenti = document.getElementById("areaCompetenzeCandidato").children;
			if(areeCompetenzaEsistenti != null){   
				for(var i=0; i<areeCompetenzaEsistenti.length; i++){    
					var input = areeCompetenzaEsistenti[i].children[0].children[0];
					if(input.value === document.getElementById("areaCompetenzaInput").value){  
						$('#errorModal').modal('toggle');   
						document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
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
			
			
			tagInput.classList.add("form-control");
			
			tagDiv.classList.add("form-row");
			var ColDiv1 = document.createElement("div");
				ColDiv1.classList.add("col-11");
			var ColDiv2 = document.createElement("div");
				ColDiv2.classList.add("col-1");
												
			tagInput.name = "areaCompetenza";
			tagInput.readOnly = true;		
			
			tagInput.style.backgroundColor = "#a7d8bb";
			
			tagDivButton.classList.add("btn");
			tagDivButton.style.margin = "0px 0px 8px 0px";
			tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
			
			tagDivButton.onclick = function(){				              	              	          				
				tagDiv.remove();
			};
			
			ColDiv1.appendChild(tagInput)
			tagDiv.appendChild(ColDiv1);
			ColDiv2.appendChild(tagDivButton)
			tagDiv.appendChild(ColDiv2);
			
			document.getElementById("areaCompetenzeCandidato").appendChild(tagDiv);
			document.getElementById("areaCompetenzaInput").value = "";
			document.getElementById("areaCompetenzaInput").focus();
			return;
				}
			}
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Area Competenza inserita non esistente"		
		}
		
		// gestione MODAL DI MODIFICA MANSIONE
		function stampaMansioneSelezionata(mansioneList) {
			
			//controllo che non sia già stato inserito il valore selezionato
			//il controllo viene fatto esplorando il DOM, in particolare il div che contiente gli input dei valori inseriti (qualora ci fossero)
			var mansioniEsistenti = document.getElementById("mansioniCandidato").children;
			if(mansioniEsistenti != null){   
				for(var i=0; i<mansioniEsistenti.length; i++){    
					var input = mansioniEsistenti[i].children[0].children[0];
					if(input.value === document.getElementById("mansioneInput").value){  
						$('#errorModal').modal('toggle');   
						document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
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
			
			tagInput.classList.add("form-control");
			
			tagDiv.classList.add("form-row");
			var ColDiv1 = document.createElement("div");
				ColDiv1.classList.add("col-11");
			var ColDiv2 = document.createElement("div");
				ColDiv2.classList.add("col-1");
			
			
			tagInput.name = "mansione";
			tagInput.readOnly = true;
			
			tagInput.style.backgroundColor = "#a7d8bb";
			
			//var mansioneDaCercare = document.getElementById("mansioneInput").value;
			tagDivButton.classList.add("btn");
			tagDivButton.style.margin = "0px 0px 8px 0px";
			tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
			
			tagDivButton.onclick = function(){				              	              	          				
				tagDiv.remove();
			};
			
			ColDiv1.appendChild(tagInput)
			tagDiv.appendChild(ColDiv1);
			ColDiv2.appendChild(tagDivButton)
			tagDiv.appendChild(ColDiv2);
			
			
			document.getElementById("mansioniCandidato").appendChild(tagDiv);
			document.getElementById("mansioneInput").value = "";
			document.getElementById("mansioneInput").focus();
			return;
				}
			}
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Mansione inserita non esistente"
		}
		
		// gestione MODAL MODIFICA SPECIALIZZAZIONE
		function stampaSpecializzazioneSelezionata(specializzazioneList) {
			
			var specializzazioniEsistenti = document.getElementById("specializzazioniCandidato").children;
			if(specializzazioniEsistenti != null){   
				for(var i=0; i<specializzazioniEsistenti.length; i++){    
					var input = specializzazioniEsistenti[i].children[0].children[0];
					input = input.value;
					input = input.split(" ");
					if(input[0] === document.getElementById("specializzazioneInput").value){  
						$('#errorModal').modal('toggle');   
						document.getElementById("errorModalBody").innerHTML = "Valore già inserito";  
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
			
			
			tagInput.classList.add("form-control");
			
			tagDiv.classList.add("form-row");
			var ColDiv1 = document.createElement("div");
				ColDiv1.classList.add("col-11");
			var ColDiv2 = document.createElement("div");
				ColDiv2.classList.add("col-1");
												
			tagInput.name = "specializzazione";
			tagInput.readOnly = true;
			
			tagInput.style.backgroundColor = "#a7d8bb";
			
			tagDivButton.classList.add("btn");
			tagDivButton.style.margin = "0px 0px 8px 0px";
			tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
			
			tagDivButton.onclick = function(){				              	              	          				
				tagDiv.remove();
			};
			
			ColDiv1.appendChild(tagInput)
			tagDiv.appendChild(ColDiv1);
			ColDiv2.appendChild(tagDivButton)
			tagDiv.appendChild(ColDiv2);
			
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
					var input = campiEsistenti[i].children[0].children[0];
					if(input.value === campo){ 
						campiEsistenti[i].remove();
						return;              
              		}           
				} 			
			}
		}
		
		function validateFileForm(){
			var uploadField = document.getElementById("fileUpload");

			    if(uploadField.files[0].size > 4194304){
			    	$('#errorModal').modal('toggle');
					document.getElementById("errorModalBody").innerHTML = "Dimensione del file troppo grande."
					return false;
			    }
			    
			    return true;
	
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
		
		
		function validateAnagraficaForm(){
			
			if(document.getElementById("idNome").value == "" || document.getElementById("idCognome").value == "" || document.getElementById("idTelefono").value == "" || document.getElementById("idEmail").value == "" || document.getElementById("idDataNascita").value ==""){
				return false;
			}
					
			if(document.getElementById("idTelefono").value.length != 10 || isNaN(document.getElementById("idTelefono").value)){
				$('#errorModal').modal('toggle');
				document.getElementById("errorModalBody").innerHTML = "Telefono deve essere composto da 10 cifre"
				return false;
			}
			
			if(document.getElementById("idCodiceFiscale").value != "" && document.getElementById("idCodiceFiscale").value.length != 16){
				$('#errorModal').modal('toggle');
				document.getElementById("errorModalBody").innerHTML = "Codice Fiscale deve essere composto da 16 lettere/cifre"
				return false;
			}
			
			if(!validateEmail()){
				return false
			}
			
			document.getElementById("idSubmitModificaAnagrafica").disabled = "true"; 
			return true;
		}
		
		
		function validateEconomicsForm(){
			if(document.getElementById("idInquadramento").value == "" || document.getElementById("idRAL").value == "" || document.getElementById("idBenefit").value == "" || document.getElementById("idPreavviso").value == "" || document.getElementById("idDesiderata").value == ""){
				return false;
			}
			
			if(document.getElementById("idRAL").value.length > 9 || isNaN(document.getElementById("idRAL").value)){
				$('#errorModal').modal('toggle');
				$('#modalMansione').modal('dispose');   
				 
					document.getElementById("errorModalBody").innerHTML = "Errore inserimento campo RAL"
					return false;
			 }
			 if(document.getElementById("idDesiderata").value.length > 9 || isNaN(document.getElementById("idDesiderata").value)){
				 $('#modalMansione').modal('toggle'); 
				 $('#errorModal').modal('toggle');
					document.getElementById("errorModalBody").innerHTML = "Errore inserimento campo DESIDERATA"
					return false;
			 }
			 
			 document.getElementById("idSubmitAggiungiEconomics").disabled = "true"; 
				return true;
			
		}
		
		
		
		function validateCostoForm(idSubmit, idCostoOrario, idCostoGiornaliero){
			
			 if(document.getElementById(idCostoOrario).value == "" || document.getElementById(idCostoGiornaliero).value == ""){
				 return false;
			 }
			 
			 if(document.getElementById(idCostoOrario).value.length > 13){
				 $('#errorModal').modal('toggle');
					document.getElementById("errorModalBody").innerHTML = "Errore inserimento campo COSTO ORARIO"
					return false;
			 }
			 if(document.getElementById(idCostoGiornaliero).value.length > 13){
				 $('#errorModal').modal('toggle');
					document.getElementById("errorModalBody").innerHTML = "Errore inserimento campo COSTO GIORNALIERO"
					return false;
			 }
			 
			 document.getElementById(idSubmit).disabled = "true";
				return true;
		}
		
		function validateCompetenzaLinguisticaForm(linguaInput){
			let livelli = document.getElementById("competenzaLinguisticaBodyTable").children;
			for(let i=0; i<livelli.length; i++){
				let lingua = livelli[i].children[0].innerText;
				if(lingua.includes(document.getElementById(linguaInput).value)){
					 $('#errorModal').modal('toggle');
						document.getElementById("errorModalBody").innerHTML = "Lingua già inserita"
					return false;
				}
			}
			return true;
		}
		
		
		
		function validateEmail(){
			var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
			if(document.getElementById("idEmail").value.match(mailformat))
			 {
			    return true
			 }
			$('#errorModal').modal('toggle');
			document.getElementById("errorModalBody").innerHTML = "Email non inserito in modo corretto"
			return false
		}
		function openMenu() {
			  document.getElementById("sidebar").style.width = "500px";
			  document.getElementById("header").style.marginLeft = "250px";
			}

		function closeMenu() {	
			  document.getElementById("sidebar").style.width = "0";			 
			  document.getElementById("header").style.marginLeft = "0";
			  
			}
	</script>

	<!-- Popper.JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<!-- Font Awesome JS -->
	<script defer
		src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>

	<script defer
		src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>
</body>

</html>