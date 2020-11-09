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

<title>Candidato dettaglio</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
/* MEDIA PER SCHERMO DESKTOP GRANDE */
html, body {
	height: 100%;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

.customButton {
	min-width: 34px;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

/* NAVBAR */
.navbar {
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

/* ICONA LOGOUT */
.svg-inline--fa.fa-w-16 {
	margin-left: 5px;
	margin-top: 5px;
	overflow: hidden;
	vertical-align: middle;
	width: 25px;
	height: 25px;
}

.navbar-nav .nav-link {
	height: 50px;
	width: 50px;
	border-radius: 50%;
	background-color: #7fc8f8;
	border-radius: 50%;
}

.navbar .navbar-brand .logo {
	width: auto;
	height: 70px;
}

/* SIDEBAR */
.container1 {
	margin-top: 20px;
	display: flex;
	flex-direction: rows;
	justify-content: flex-start;
}

#sidebar {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 0px 5px 5px 0px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
	background: #5aa9e6;
	color: #fff;
	border-collapse: collapse;
}

#sidebar .sidebar-header {
	text-align: center;
	padding: 15px;
	background: #7fc8f8;
}

#sidebar ul.components {
	padding: 10px 0px 0px 0px;
}

#sidebar ul p {
	color: #fff;
	padding: 10px;
}

#sidebar ul li a {
	margin: 5px 0px;
	padding: 10px 10px 10px 10px;
	font-size: 1.1em;
	display: block;
}

#sidebar ul li a:hover {
	color: #000000;
	background: #fff;
}

#sidebar ul li.active>a, a[aria-expanded="true"] {
	color: #fff;
	background: #7fc8f8;
}

a[data-toggle="collapse"] {
	position: relative;
}

#frecciaSidebar::after {
	display: block;
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
}

ul ul a {
	font-size: 0.9em !important;
	padding-left: 30px !important;
	background: #cae9ff;
}

/* TABELLA ANAGRAFICA */
.tabellaAnagrafica {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaAnagrafica .head {
	background-color: #8cc8ef;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.tabellaAnagrafica .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaAnagrafica .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaAnagrafica .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaAnagrafica .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaAnagrafica .footer {
	background-color: #8cc8ef;
}

.tabellaAnagrafica th {
	padding: 8px;
}

.tabellaAnagrafica td {
	font-size: 14px;
	padding: 4px;
}
/* TABELLA BUSINESS */
.tabellaBusiness {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaBusiness .head {
	background-color: #a7d3a6;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.tabellaBusiness .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaBusiness .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaBusiness .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaBusiness .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaBusiness .footer {
	background-color: #a7d3a6;
}

.tabellaBusiness th {
	padding: 8px;
}

.tabellaBusiness td {
	font-size: 14px;
	padding: 4px;
}

#bottoneBusiness {
	background-color: #a7d3a6;
}
/* TABELLA ECONOMICS */
.tabellaEconomics {
	margin-top: 25px;
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaEconomics .head {
	background-color: #ffd670;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.tabellaEconomics .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaEconomics .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaEconomics .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaEconomics .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaEconomics .footer {
	background-color: #ffd670;
}

.tabellaEconomics th {
	padding: 8px;
}

.tabellaEconomics td {
	font-size: 14px;
	padding: 4px;
}
/* TABELLA COSTI */
.tabellaCosti {
	margin-top: 25px;
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaCosti .head {
	background-color: #ff686b;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.tabellaCosti .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaCosti .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaCosti .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaCosti .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaCosti .footer {
	background-color: #ff686b;
}

.tabellaCosti th {
	padding: 8px;
}

.tabellaCosti td {
	font-size: 14px;
	padding: 4px;
}

/* TABELLA TITOLI */
.tabellaTitoli {
	margin-top: 25px;
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaTitoli .head {
	background-color: #004fff;
	color: white;
	font-weight: bold;
}

.tabellaTitoli .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaTitoli .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaTitoli .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaTitoli .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaTitoli .footer {
	background-color: #004fff;
}

.tabellaTitoli th {
	padding: 8px;
}

.tabellaTitoli td {
	font-size: 14px;
	padding: 4px;
}

/* TABELLA COMPETENZE LINGUISTICHE*/
.tabellaCompetenzeLinguistiche {
	margin-top: 25px;
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaCompetenzeLinguistiche .head {
	background-color: black;
	color: white;
	font-weight: bold;
}

.tabellaCompetenzeLinguistiche .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaCompetenzeLinguistiche .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaCompetenzeLinguistiche .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaCompetenzeLinguistiche .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaCompetenzeLinguistiche .footer {
	background-color: black;
}

.tabellaCompetenzeLinguistiche th {
	padding: 8px;
}

.tabellaCompetenzeLinguistiche td {
	font-size: 14px;
	padding: 4px;
}

/* TABELLA FEEDBACK */
.tabellaFeedback {
	margin-top: 25px;
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaFeedback .head {
	background-color: #d0b8ac;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.tabellaFeedback .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaFeedback .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaFeedback .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaFeedback .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaFeedback .footer {
	background-color: #d0b8ac;
}

.tabellaFeedback th {
	padding: 8px;
}

.tabellaFeedback td {
	font-size: 14px;
	padding: 4px;
}

#bottoneFeedback {
	background-color: #d0b8ac;
}
/* TABELLA QUALIFICATION MEETING */
.tabellaQualification {
	margin-bottom: 25px;
	margin-top: 25px;
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
	margin-top: 25px;
}

.tabellaQualification .head {
	background-color: #f2a359;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.tabellaQualification .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaQualification .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaQualification .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaQualification .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaQualification .footer {
	background-color: #f2a359;
}

.tabellaQualification th {
	padding: 8px;
}

.tabellaQualification td {
	font-size: 14px;
	padding: 4px;
}

#bottoneQualification {
	background-color: #f2a359;
}

/* TABELLA ALLEGATI */
.tabellaAllegati {
	margin-bottom: 25px;
	margin-top: 25px;
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaAllegati .head {
	background-color: #cfd4dd;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.tabellaAllegati .head th h3 {
	line-height: 50px;
	margin: 0;
}

.tabellaAllegati .body tr {
	border-bottom: 1px solid #dddddd;
	text-align: left;
}

.tabellaAllegati .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaAllegati .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaAllegati .footer {
	background-color: #cfd4dd;
}

.tabellaAllegati th {
	padding: 8px;
}

.tabellaAllegati td {
	font-size: 14px;
	padding: 4px;
}

#bottone-salva-allegato {
	background-color: #a7d3a6;
}

#bottone-cancella-allegato {
	background-color: #ee6055;
}
</style>

</head>

<body
	onload="changeStato('${mostraCandidato.stato.descrizione}', '${mostraFeedback}', '${mostraCandidato.categoriaProtetta}', '${mostraCandidato.qm}', '${mostraCandidato.file}', '${mostraCandidato.costo}', '${mostraCandidato.economics}')">
	<c:set var="singlequote" value="'" />
	<c:set var="backslash" value="&apos" />
	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-xl ">
		<div class="container-fluid">

			<!-- LOGO -->
			<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
				<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
			</a>

			<!-- LOGOUT -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="/ProgettoHR/Logout"><i class="fas fa-sign-out-alt"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid container1 p-0">
		<!-- COLONNA BARRA LATERALE -->
		<div class="col-auto p-0 ">
			<!-- BARRA LATERALE -->
			<nav id="sidebar">
				<div class="sidebar-header">
					<h3>Candidato</h3>
				</div>

				<ul class="list-unstyled components">

					<c:if
						test='${fn:contains(funzionalita, "aggiunta qualification meeting")}'>
						<li><a href="" data-toggle="modal"
							data-target="#qualificationMeetingModal" type="button"><i
								class="fas fa-plus"></i> Qualification meeting</a></li>
					</c:if>

					<c:if test='${fn:contains(funzionalita, "aggiunta economics")}'>
						<li><a href="" data-toggle="modal"
							data-target="#modificaEconomicsModal" type="button"><i
								class="fas fa-plus"></i> Economics</a></li>
					</c:if>

					<li><c:if
							test='${fn:contains(funzionalita, "aggiunta costi")}'>
							<a href="" data-toggle="modal" data-target="#modificaCostiModal"
								type="button"><i class="fas fa-plus"></i> Costi</a>
						</c:if></li>
					<li><c:if
							test='${fn:contains(funzionalita, "aggiunta titolo di studio")}'>
							<a href="" data-toggle="modal" data-target="#aggiungiTitoloModal"
								type="button"><i class="fas fa-plus"></i> Titolo di studio</a>
						</c:if></li>
					<li><c:if
							test='${fn:contains(funzionalita, "aggiunta competenza linguistica")}'>
							<a href="" data-toggle="modal"
								data-target="#modificaCompetenzaLinguisticaModal" type="button"><i
								class="fas fa-plus"></i> Competenza linguistica</a>
						</c:if></li>

					<c:if test='${fn:contains(funzionalita, "aggiunta feedback")}'>
						<li class="active"><a href="#homeSubmenu" id="frecciaSidebar"
							data-toggle="collapse" aria-expanded="false"
							class="dropdown-toggle">Feedback</a>
							<ul class="collapse list-unstyled" id="homeSubmenu">
								<li><a onclick="impostaTipoFeedback('Colloquio HR')"
									class="dropdown-item" href="" type="button" data-toggle="modal"
									data-target="#feedbackModal"><i class="fas fa-plus"></i>
										Colloquio HR </a> <a
									onclick="impostaTipoFeedback('Colloquio Tecnico')"
									type="button" data-toggle="modal" data-target="#feedbackModal"
									class="dropdown-item" href=""><i class="fas fa-plus"></i>
										Colloquio tecnico </a> <a class="dropdown-item" href=""
									onclick="impostaTipoFeedback('Mail')" type="button"
									data-toggle="modal" data-target="#feedbackModal"><i
										class="fas fa-plus"></i> E-mail </a> <a class="dropdown-item"
									href="" onclick="impostaTipoFeedback('Social')" type="button"
									data-toggle="modal" data-target="#feedbackModal"><i
										class="fas fa-plus"></i> Social network </a> <a
									class="dropdown-item" href=""
									onclick="impostaTipoFeedback('Telefonata')" type="button"
									data-toggle="modal" data-target="#feedbackModal"><i
										class="fas fa-plus"></i> Telefonata </a></li>
							</ul></li>
					</c:if>

					<c:if test='${fn:contains(funzionalita, "aggiunta allegati")}'>
						<li><a href="" data-toggle="modal"
							data-target="#allegatiModal" type="button" class="text-center">Allegati
								<i class="fas fa-folder-open"></i>
						</a></li>
					</c:if>
					<li><a id="aSidebar" href="/ProgettoHR/Filter/${businessUnit}"
						type="button" class="text-center">Filtri</a></li>
				</ul>

			</nav>
		</div>

		<!-- Colonna principale che contiene tutte le altre-->
		<div class="col-10">
			<!-- Row principale che tiene tutte le collone-->
			<div class="row">
				<!-- COLONNA 1-->
				<div class="col-6">

					<!-- Tabella ANAGRAFICA -->
					<table class="tabellaAnagrafica">

						<thead class="head">
							<tr>
								<th><h3>ANAGRAFICA</h3></th>
								<th colspan=2><c:if
										test='${fn:contains(funzionalita, "modifica anagrafica")}'>
										<!-- Bottone modifica anagrafica -->
										<button type="button" data-toggle="modal"
											data-target="#modificaAnagraficaModal"
											class="btn p-2 float-right">
											<i class="fas fa-cog m-0"></i>
										</button>
									</c:if></th>
							</tr>
						</thead>

						<tbody class="body">


							<c:if test='${fn:contains(funzionalita, "modifica anagrafica")}'>
								<tr>

									<th scope="col">Stato</th>
									<td scope="col">

										<button type="button" class="btn" id="menuStato"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"></button>
										<div class="dropdown-menu">
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
								<th scope="col">Residenza
								<th>
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


					<!-- tabella ECONOMICS -->
					<c:if test='${fn:contains(funzionalita, "visualizza economics")}'>
						<table id="economicsTable" class="tabellaEconomics">
							<thead class="head">
								<tr>
									<th><h3>ECONOMICS</h3></th>
									<th colspan=2><c:if
											test='${fn:contains(funzionalita, "modifica economics")}'>
											<!-- Bottone modifica economics-->
											<button type="button" data-toggle="modal"
												data-target="#modificaEconomicsModal"
												class="btn p-2 float-right">
												<i class="fas fa-cog m-0"></i>
											</button>
										</c:if></th>

								</tr>
							</thead>

							<tbody>

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
					</c:if>
				</div>


				<!-- COLONNA 2 -->
				<div class="col-6">
					<!-- tabella BUSINESS-->
					<c:if
						test='${fn:contains(funzionalita, "visualizza profilo professionale")}'>
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
												id="bottoneBusiness" data-target="#modificaBusinessUnit"
												class="btn p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
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
												data-target="#modificaAreaCompetenza" id="bottoneBusiness"
												class="btn p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
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
												data-target="#modificaMansione" id="bottoneBusiness"
												class="btn p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
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
												data-target="#modificaSeniority" id="bottoneBusiness"
												class="btn p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
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
												data-target="#modificaSpecializzazione" id="bottoneBusiness"
												class="btn p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
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
												id="bottoneBusiness" class="btn p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
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
					</c:if>

					<!--tabella COSTI -->
					<c:if test='${fn:contains(funzionalita, "visualizza costi")}'>
						<table id="costiTable" class="tabellaCosti">

							<thead class="head">
								<tr>
									<th><h3>COSTI</h3></th>
									<th colspan=2><c:if
											test='${fn:contains(funzionalita, "modifica costi")}'>
											<!-- Bottone modifica costi-->
											<button type="button" data-toggle="modal"
												data-target="#modificaCostiModal"
												class="btn p-2 float-right">
												<i class="fas fa-cog m-0"></i>
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
					</c:if>


					<!-- Tabella TITOLI DI STUDIO-->
					<table id="titoliTable" class="tabellaTitoli">

						<thead class="head">
							<tr>
								<th colspan=2><h3>TITOLI DI STUDIO</h3></th>
							</tr>
							<tr>
								<th colspan="2">Titolo studio</th>
							</tr>
						</thead>
						<tbody class="body">
							<c:forEach var="titolo" items="${mostraCandidato.titoloStudio}">
								<tr>
									<td>${titolo.titoloStudio}</td>
									<td><c:if
											test='${fn:contains(funzionalita, "modifica titolo di studio")}'>
											<button
												onclick="impostaParametriTitoloStudio('${titolo.titoloStudio}')"
												type="button" data-toggle="modal" id="btn-titolo-studio"
												data-target="#modificaTitoloModal"
												class="btn customButton p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
											</button>
											  <button
												onclick="impostaParametriEliminaTitoloStudio('${titolo.id}')"
												type="button" data-toggle="modal" id="btn-titolo-studio"
												data-target="#eliminaTitoloStudioModal"
												class="btn customButton p-1 mr-1 float-right">
												<i class="fas fa-trash m-0"></i>
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

					<!-- Tabella COMPETENZE LINGUISTICHE-->
					<table id="competenzeLinguisticheTable"
						class="tabellaCompetenzeLinguistiche">

						<thead class="head">
							<tr>
								<th><h3>COMPETENZE LINGUISTICHE</h3></th>
								<th colspan=4><c:if
										test='${fn:contains(funzionalita, "modifica costi")}'>
										<!-- Bottone modifica titoli-->
										<button type="button" data-toggle="modal"
											data-target="#modificaCompetenzeLinguisticheModal"
											class="btn p-2 float-right">
											<i class="fas fa-cog m-0"></i>
										</button>
									</c:if></th>
							</tr>
							<tr>
								<th>Lingua</th>
								<th>Letto</th>
								<th>Scritto</th>
								<th>Parlato</th>
							</tr>
						</thead>
						<tbody class="body">
							<tr>
								<th scope="col">Madre lingua</th>
								<td scope="col"></td>
							</tr>
							<tr>
								<th scope="col">Lingua</th>
								<td scope="col"></td>
							</tr>

						</tbody>

						<tfoot class="footer">
							<tr>
								<td colspan=4></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>

			<div class="row">
				<!-- COLONNA 3 -->
				<div class="col-auto">
					<!-- Tabella FEEDBACK -->
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
									<c:set var="commentoXSS" value="${fn:escapeXml(feed.commento)}"></c:set>
									<td>${commentoXSS}</td>
									<td><c:if
											test='${fn:contains(funzionalita, "modifica feedback")}'>
											<button
												onclick="impostaParametriFeedback('${feed.id}', '${feed.tipo.tipo}', '${feed.data}', '${commento}')"
												type="button" data-toggle="modal" id="bottoneFeedback"
												data-target="#modificaFeedbackModal"
												class="btn customButton p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
											</button>
											<button
												onclick="impostaParametriEliminaFeedback('${feed.id}')"
												type="button" data-toggle="modal" id="bottoneFeedback"
												data-target="#eliminaFeedbackModal"
												class="btn customButton p-1 mr-1 float-right">
												<i class="fas fa-trash m-0"></i>
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

					<!-- tabella QUALIFICATION MEETING-->
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
												onclick="impostaParametriQualificationMeeting('${qualificationMeeting.id}','${cliente}','${qualificationMeeting.dataPresentato}','${riferimentoGara}','${qualificationMeeting.dataColloquio}','${feedback}')"
												type="button" data-toggle="modal" id="bottoneQualification"
												data-target="#modificaQualificationMeetingModal"
												class="btn customButton p-1 float-right">
												<i class="fas fa-cogs m-0"></i>
											</button>
											<button
												onclick="impostaParametriEliminaQualificationMeeting('${qualificationMeeting.id}')"
												type="button" data-toggle="modal" id="bottoneQualification"
												data-target="#eliminaQualificationMeetingModal"
												class="btn customButton p-1 mr-1 float-right">
												<i class="fas fa-trash m-0"></i>
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

					<!-- Tabella ALLEGATI -->
					<c:if test='${fn:contains(funzionalita, "visualizza allegati")}'>
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
											class="btn btn-block" id="bottone-salva-allegato">Scarica</a></td>
										<td>
											<button onclick="impostaParametriAllegati(${allegato.id})"
												type="button" class="btn btn-block"
												id="bottone-cancella-allegato" data-toggle="modal"
												data-target="#deleteModal">Cancella</button>
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
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL CANCELLA ALLEGATI -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					Sei sicuro di voler cancellare l'allegato selezionato?
					<form
						action="/ProgettoHR/delete/${businessUnit}/${mostraCandidato.id}"
						method="GET">
						<div style="visibility: hidden;">
							<input name="idAllegato" id="Allegato" />
						</div>
						<div class="modal-body"></div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">si</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">no</button>

						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL MODIFICA ANAGRAFICA -->
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
							onsubmit="return validateAnagraficaForm();"
							action="/ProgettoHR/ModificaAnagrafica/${businessUnit}/${mostraCandidato.id}">


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Nome:</div>
								<form:input type="text" class="form-control" id="idNome"
									name="nome" path="nome" value="${mostraCandidato.nome}"
									required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Cognome:</div>
								<form:input type="text" class="form-control" id="idCognome"
									name="cognome" path="cognome"
									value="${mostraCandidato.cognome}" required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Data
									di nascita:</div>
								<input type="date" pattern="yyyy-MM-dd" class="form-control"
									id="idDataNascita" name="dataDiNascita"
									value="${mostraCandidato.dataNascita}"></input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Telefono:</div>
								<form:input type="text" class="form-control" id="idTelefono"
									name="telefono" path="telefono" placeholder="123-456-7890"
									value="${mostraCandidato.telefono}" required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">E-mail:</div>
								<form:input type="text" class="form-control" id="idEmail"
									size="30" name="email" path="email"
									value="${mostraCandidato.email}" required="required"></form:input>
							</div>


							<div class="form-group">
								<div class="row w-100 p-0 m-0 justify-content-md-start">Codice
									Fiscale:</div>
								<form:input type="text" class="form-control" maxlength="16"
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
									<button type="submit" id="idSubmitModificaAnagrafica"
										class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Annulla
										Modifiche</button>
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
					action="/ProgettoHR/ModificaBusinessUnit/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="form-row justify-content-center">

							<div class="form-group col-auto">
								<h5 class="text-center">Scegli:</h5>
								<select id="inputState" class="form-control text-center"
									name="businessUnit">
									<option disabled selected>Business unit</option>
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
					action="/ProgettoHR/ModificaSeniority/${businessUnit}/${mostraCandidato.id}">
					<div class="modal-body">
						<div class="form-row justify-content-center">

							<div class="form-group col-auto">
								<h5 class="text-center">Scegli:</h5>
								<select id="senioritySelezionata"
									class="form-control text-center" name="seniority">
									<option disabled selected>Seniority</option>
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

				<!-- FORM DEL MODAL BODY -->
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
					action="/ProgettoHR/ModificaDataInserimentoAzienda/${businessUnit}/${mostraCandidato.id}">
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

	<!--MODAL MODIFICA ECONOMICS-->
	<div class="modal fade" id="modificaEconomicsModal" tabindex="-1"
		role="dialog" aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Aggiungi/Modifica
						economics</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="mostraCandidato"
							onsubmit="return validateEconomicsForm()"
							action="/ProgettoHR/AggiungiModificaEconomics/${businessUnit}/${mostraCandidato.id}">


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
											maxlength="9" name="RAL" path="economics.ral"
											value="${economics.ral}" required="required"></form:input>
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
											name="desiderata" path="economics.desiderata" maxlength="9"
											value="${economics.desiderata}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitAggiungiEconomics"
										class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Annulla
										modifiche</button>
								</div>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!--  MODAL MODIFICA COSTI-->
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
							onsubmit="return validateCostoForm('idSubmitAggiungiCosto', 'idCostoOrario', 'idCostoGiornaliero')"
							action="/ProgettoHR/AggiungiModificaCosto/${businessUnit}/${mostraCandidato.id}">


							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Costo
											orario:</div>
										<form:input type="number" step="0.01" class="form-control"
											id="idCostoOrario" name="costoOrario" path="costo.orario"
											value="${costo.orario}" required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Costo
											giornaliero:</div>
										<form:input type="number" step="0.01" class="form-control"
											id="idCostoGiornaliero" name="costoGiornaliero"
											path="costo.giornaliero" value="${costo.giornaliero}"
											required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Commenti:</div>
										<form:textarea class="form-control" maxlength="1000" rows="6"
											style="resize: none;" id="idCommentiCosto" name="commenti"
											path="costo.commento" value="${costo.commento}"></form:textarea>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitAggiungiCosto"
										class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Annulla
										modifiche</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  MODAL AGGIUNGI TITOLI DI STUDIO-->
	<div class="modal fade" id="aggiungiTitoloModal" tabindex="-1"
		role="dialog" aria-labelledby="aggiungiModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="aggiungiModalLabel">Aggiungi
						titolo di studio</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="titoloStudio"
							action="/ProgettoHR/AggiungiTitoloStudio/${businessUnit}/${mostraCandidato.id}">

							<form:input type="text" class="form-control" id="idTitoloStudio"
								name="titoloStudio" path="titoloStudio"
								value="" required="required"></form:input>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitAggiungiCosto"
										class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Annulla
										modifiche</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!--  MODAL MODIFICA TITOLI DI STUDIO-->
	<div class="modal fade" id="modificaTitoloModal" tabindex="-1"
		role="dialog" aria-labelledby="modificaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modificaModalLabel">Modifica
						titolo di studio</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form:form method="POST" modelAttribute="titoloStudio"
							action="/ProgettoHR/ModificaTitoloStudio/${businessUnit}/${mostraCandidato.id}">

							<form:input type="text" class="form-control" id="idModificaTitoloStudio"
								name="modificaTitoloStudio" path="titoloStudio"
								value="${titoloStudio.titoloStudio}" required="required"></form:input>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitAggiungiCosto"
										class="btn btn-primary btn-block">Salva</button>
									<button type="reset" class="btn btn-danger btn-block">Annulla
										modifiche</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!-- MODAL CANCELLA TITOLO STUDIO -->
	<div class="modal fade" id="eliminaTitoloStudioModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/EliminaTitoloStudio/${businessUnit}/${id}"
					method="POST">

					<div class="modal-header">
						Sei sicuro di voler cancellare il titolo di studio selezionato? <input
							style="visibility: hidden;" name="titoloStudioIdRemove" id="titoloStudioRemove" />
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success"
							style="background-color: green;">sì</button>
						<button type="button" class="btn btn-danger"
							style="background-color: red;" data-dismiss="modal">no</button>
					</div>

				</form>
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
							action="/ProgettoHR/ModificaQualificationMeeting/${businessUnit}/${mostraCandidato.id}">

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
											class="form-control" path="cliente" name="cliente"
											required="required"></form:input>
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
											path="dataPresentato" name="dataPresentato"
											required="required"></form:input>
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
											path="riferimentoGara" name="riferimentoGara"
											required="required"></form:input>
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
										<form:textarea class="form-control" maxlength="1000" rows="6"
											style="resize: none;" id="feedbackQualificationMeeting"
											path="feedback" name="commenti" required="required"></form:textarea>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitModificaQM"
										class="btn btn-primary btn-block">Modifica</button>
									<button type="reset" class="btn btn-danger btn-block">Annulla
										modifiche</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL CANCELLA QUALIFICATION MEETING -->
	<div class="modal fade" id="eliminaQualificationMeetingModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form
					action="/ProgettoHR/EliminaQualificationMeeting/${businessUnit}/${id}"
					method="POST">

					<div class="modal-header">
						Sei sicuro di voler cancellare il Qualification meeting
						selezionato? <input style="visibility: hidden;"
							name="qualification" id="qualification" />
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success"
							style="background-color: green;">sì</button>
						<button type="button" class="btn btn-danger"
							style="background-color: red;" data-dismiss="modal">no</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- MODAL CANCELLA FEEDBACK -->
	<div class="modal fade" id="eliminaFeedbackModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/EliminaFeedback/${businessUnit}/${id}"
					method="POST">

					<div class="modal-header">
						Sei sicuro di voler cancellare il feedback selezionato? <input
							style="visibility: hidden;" name="feedback" id="feedback" />
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success"
							style="background-color: green;">sì</button>
						<button type="button" class="btn btn-danger"
							style="background-color: red;" data-dismiss="modal">no</button>
					</div>

				</form>
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
							action="/ProgettoHR/ModificaFeedback/${businessUnit}/${mostraCandidato.id}">

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
										<form:select id="tipoModificaFeedback"
											class="form-control text-center" name="tipoFeedback"
											path="tipo.tipo">

											<c:forEach var="tipo" items="${tipoFeedbackList}">
												<option value="${tipo.tipo}">${tipo.tipo}</option>
											</c:forEach>
										</form:select>
									</div>
								</div>
							</div>

							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Data:</div>
										<form:input id="dataFeedback" path="data" type="date"
											pattern="yyyy-MM-dd" class="form-control" name="data"
											required="required"></form:input>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<div class="form-group">
										<div class="row w-100 p-0 m-0 justify-content-md-start">Feedback:</div>
										<form:textarea id="commentoFeedback" path="commento"
											maxlength="1000" rows="6" style="resize: none;"
											class="form-control" name="feedback" required="required"></form:textarea>
									</div>
								</div>
							</div>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" id="idSubmitModificaFeedback"
										class="btn btn-primary btn-block">Salva</button>
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
							action="/ProgettoHR/doUpload/${businessUnit}/${mostraCandidato.id}"
							enctype="multipart/form-data"
							onsubmit="return validateFileForm()">
							<table>
								<tr>
									<td>Pick file:</td>
									<td><input type="file" name="fileUpload" id="fileUpload"
										size="50" required="required" /></td>
								</tr>

							</table>
							<div class="row w-100 p-2 m-0 justify-content-md-start">
								<div class="col w-100 p-0 justify-content-md-start">
									<button type="submit" class="btn btn-primary btn-block">Aggiungi
										Allegati</button>

								</div>
							</div>
						</form>
					</div>
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
							action="/ProgettoHR/AggiungiFeedback/${businessUnit}/${mostraCandidato.id}">
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
										<form:textarea path="commento" maxlength="1000" rows="6"
											style="resize: none;" class="form-control"
											id="idCommentoFeedback" name="feedback"></form:textarea>
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
							action="/ProgettoHR/AggiungiQualificationMeeting/${businessUnit}/${mostraCandidato.id}">

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
										<form:textarea maxlength="1000" rows="6" style="resize: none;"
											class="form-control" id="idCommentiQM" path="feedback"
											name="commenti"></form:textarea>
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
			if(document.getElementById("menuStato")!= null){
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
			document.getElementById("feedback").value = id;
		}
		
		function impostaParametriAllegati(id) {
			document.getElementById("Allegato").value = id;
		
		}
		
		function impostaParametriTitoloStudio(titolo){
			document.getElementById("idModificaTitoloStudio").value = titolo;
		}
		
		function impostaParametriEliminaTitoloStudio(id){
			let newId = parseInt(id);
			document.getElementById("titoloStudioRemove").value = newId;
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