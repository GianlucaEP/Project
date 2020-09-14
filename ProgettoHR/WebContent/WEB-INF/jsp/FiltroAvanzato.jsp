<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Home</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
/* Body e html generale*/
html, body {
	height: 100%;
}

.dark-mode {
	background-color: black;
	color: white;
	transition: 0.5s;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
	transition: 0.5s;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

/* Pallini dello stato del candidato*/
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
	margin-top: 5px;
}

/* Navbar */
.navbar {
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
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

/* Barra Laterale */
.container1 {
	width: 100%;
	margin-top: 20px;
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
	padding-top: 20px;
	padding-bottom: 10px;
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

.dropdown-toggle::after {
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

#zeroRecord {
	text-align: center;
}
/* Tabella Home */
.tabellaHome {
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaHome .head {
	background-color: #5aa9e6;
	color: #ffffff;
	text-align: center;
	font-weight: bold;
}

.tabellaHome .body tr {
	text-align: center;
	border-bottom: 1px solid #dddddd;
}

.tabellaHome .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaHome .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaHome th {
	padding: 8px;
}

.tabellaHome td {
	font-size: 14px;
	padding: 4px;
}
</style>

</head>
<body
	onload="getMansione('${mansioneList}', '${specializzazioneList}', '${areaCompetenzaList}')">

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-xl ">
		<div class="container-fluid">

			<!-- LOGO -->
			<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
				<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
			</a>



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
					<h3>Filtreria</h3>
				</div>


				<form autocomplete="off" method="POST"
					action="/ProgettoHR/Filter/advanced/${businessUnit}"
					onsubmit="controlloMappa()">
					<div class="form-row" id="divForm">

						<div class="col-3">
							<label for="nome">nome</label> <input id="nome" name="nome"
								type="text" class="form-control" placeholder=" nome">
						</div>
						<div class="col-3">
							<label>cognome</label> <input id="cognome" name="cognome"
								type="text" class="form-control" placeholder="cognome">
						</div>
						<div class="col-1">
							<label>anno di nascita</label> <input id="anno" maxlength="4"
								name="anno" class="form-control" type="text" placeholder="anno">
						</div>
						<div class="col-2">
							<label>num telefono</label> <input id="telefono" name="telefono"
								class="form-control" type="text" placeholder="num telefono">
						</div>

						<div class="col-3">
							<label>email</label> <input id="email" name="email"
								class="form-control" type="text" placeholder="email">
						</div>
					</div>


					<div class="form-row" id="divForm">
						<div class="col-2">
							<label>business Unit</label> <select id="selectBusiness"
								name="business" class=" form-control custom-select">
								<option selected></option>
								<c:forEach var="bus" items="${businessList}">
									<option value="${bus.business}">${bus.business}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-2">
							<label>seniority</label> <select id=selectSeniority
								name="seniority" class="custom-select  form-control">
								<option selected></option>
								<c:forEach var="sen" items="${seniorityList}">
									<option value="${sen.seniority}">${sen.seniority}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-2">
							<label>provenienza</label> <input id="provenienza"
								name="provenienza" class="form-control" type="text"
								placeholder="provenienza">
						</div>


					</div>
					<div class="form-row" id="divForm">
						<div class="col-2">

							<div id="areeCompetenzaDiv">
								<label>area di competenza</label>
								
									<input autocomplete="off" placeholder="aggiungi"
										list="areeCompetenzeDisponibili" id="areaCompetenzaInput"
										class="form-control">
									<datalist id="areeCompetenzeDisponibili">
										<c:forEach var="area" items="${areaCompetenzaList}">
											<option value="${area}"></option>
										</c:forEach>
									</datalist>



									<div
										onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
										class="btn">
										<i class="fas fa-plus"></i>
									</div>
							
							</div>
						</div>
						<div class="col-2">

							<div id="mansioneDiv">
								<label>mansione</label>
								
									<input autocomplete="off" placeholder="aggiungi"
										list="mansioniDisponibili" id="mansioneInput"
										class="form-control">
									<datalist id="mansioniDisponibili">
										<c:forEach var="mans" items="${mansioneList}">
											<option value="${mans}"></option>
										</c:forEach>
									</datalist>



									<div onclick="stampaMansioneSelezionata('${mansioneList}')"
										class="btn">
										<i class="fas fa-plus"></i>
									</div>
								
							</div>
						</div>
						<div class="col-2">

							<div id="specializzazioneDiv">
								<label>specializzazione</label>
								
									<input autocomplete="off" placeholder="aggiungi"
										list="specializzazioniDisponibili" id="specializzazioneInput"
										class="form-control">
									<datalist id="specializzazioniDisponibili">
										<c:forEach var="specializzazione"
											items="${specializzazioneList}">
											<option value="${specializzazione}"></option>
										</c:forEach>
									</datalist>
								</div>
								<div
									onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
									class="btn">
									<i class="fas fa-plus"></i>
								</div>
							
						</div>
					</div>

					<div class="form-row" id="divForm">
						<div class="col-2">
							<label>costo unitario all'ora</label> Da <input
								id="costoMinInput" name="costoMin" class="form-control"
								style="border-color: transparent;" type="text"
								placeholder="costo minimo"> A<input id="costoMaxInput"
								name="costoMax" class="form-control"
								style="border-color: transparent;" type="text"
								placeholder="costo massimo">
						</div>
						<div class="col-2">

							<div id="specializzazioneDiv" >

							
									Dal <input type="date" id="dataInserimentoInputFrom"
										name="dataInserimentoFrom" class="form-control"
										style="border-color: transparent;"> Al <input
										type="date" id="dataInserimentoInputTo"
										name="dataInserimentoTo" class="form-control"
										style="border-color: transparent;">

									<!--  <input
									id="anniEsperienzaInput" class="form-control"
									style="border-color: transparent;" type="number"
									placeholder="anni esperienza">-->


								</div>

							</div>
						</div>

					
				</form>
			</nav>
		</div>
	</div>




	<!-- COLONNA CON FILTRO -->
	<div style="margin-top: 110px;" class="container-fluid ">
		<div class="row" id="divForm">
			<form autocomplete="off" method="POST"
				action="/ProgettoHR/Filter/advanced/${businessUnit}"
				onsubmit="controlloMappa()">
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse1"
							aria-expanded="false" aria-controls="collapse1">
							<i class="fa fa-plus" aria-hidden="true"></i> Nome <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse1" class="collapse" aria-labelledby="heading10">
						<div class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="nome" name="nome" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder=" nome">

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse2"
							aria-expanded="false" aria-controls="collapse2">
							<i class="fa fa-plus" aria-hidden="true"></i> Cognome <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse2" class="collapse" aria-labelledby="heading10">
						<div class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="cognome" name="cognome" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="cognome">

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse3"
							aria-expanded="false" aria-controls="collapse3">
							<i class="fa fa-plus" aria-hidden="true"></i> Anno di nascita <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse3" class="collapse" aria-labelledby="heading10">
						<div class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="anno" maxlength="4" name="anno" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="anno">

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse4"
							aria-expanded="false" aria-controls="collapse4">
							<i class="fa fa-plus" aria-hidden="true"></i> Telefono <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse4" class="collapse" aria-labelledby="heading10">
						<div class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="telefono" name="telefono" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="cognome">

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse5"
							aria-expanded="false" aria-controls="collapse5">
							<i class="fa fa-plus" aria-hidden="true"></i> Email <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse5" class="collapse" aria-labelledby="heading10">
						<div class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="email" name="email" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="email">

							</div>

						</div>
					</div>
				</div>


				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse6"
							aria-expanded="false" aria-controls="collapse6">
							<i class="fa fa-plus" aria-hidden="true"></i> Business Unit: <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse6" class="collapse" aria-labelledby="heading10">
						<div class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<select id="selectBusiness" name="business"
									class="custom-select mb-3">
									<option selected></option>
									<c:forEach var="bus" items="${businessList}">
										<option value="${bus.business}">${bus.business}</option>
									</c:forEach>
								</select>

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse7"
							aria-expanded="false" aria-controls="collapse7">
							<i class="fa fa-plus" aria-hidden="true"></i> Seniority: <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse7" class="collapse" aria-labelledby="heading10">
						<div class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<select id=selectSeniority name="seniority"
									class="custom-select mb-3">
									<option selected></option>
									<c:forEach var="sen" items="${seniorityList}">
										<option value="${sen.seniority}">${sen.seniority}</option>
									</c:forEach>
								</select>

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse8"
							aria-expanded="false" aria-controls="collapse8">
							<i class="fa fa-plus" aria-hidden="true"></i> Provenienza <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse8" class="collapse" aria-labelledby="heading10">
						<div class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="provenienza" name="provenienza" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="provenienza">

							</div>

						</div>
					</div>
				</div>




				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse9"
							aria-expanded="false" aria-controls="collapse9">
							<i class="fa fa-plus" aria-hidden="true"></i> Area Competenza <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse9" class="collapse" aria-labelledby="heading10">
						<div id="areaCompetenzaDiv" class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="areaCompetenzaInput" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder=" area competenza">

								<div
									onclick="stampaAreaCompetenzaSelezionata('${areaCompetenzaList}')"
									class="btn">
									<i class="fas fa-arrow-circle-down"></i>
								</div>

							</div>

						</div>
					</div>
				</div>


				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse10"
							aria-expanded="false" aria-controls="collapse10">
							<i class="fa fa-plus" aria-hidden="true"></i> Mansione <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse10" class="collapse" aria-labelledby="heading11">
						<div id="mansioneDiv" class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="mansioneInput" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="mansione">

								<div onclick="stampaMansioneSelezionata('${mansioneList}')"
									class="btn">
									<i class="fas fa-arrow-circle-down"></i>
								</div>


							</div>

						</div>
					</div>
				</div>


				<div class="card" style="border-color: transparent;">
					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse11"
							aria-expanded="false" aria-controls="collapse11">
							<i class="fa fa-plus" aria-hidden="true"></i> Specializzazione <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse11" class="collapse" aria-labelledby="heading12">
						<div id="specializzazioneDiv" class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="specializzazioneInput" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="specializzazione">
								<!--  <input
									id="anniEsperienzaInput" class="form-control"
									style="border-color: transparent;" type="number"
									placeholder="anni esperienza">-->

								<div
									onclick="stampaSpecializzazioneSelezionata('${specializzazioneList}')"
									class="btn">
									<i class="fas fa-arrow-circle-down"></i>
								</div>

							</div>

						</div>
					</div>
				</div>

				<div class="card" style="border-color: transparent;">
					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse12"
							aria-expanded="false" aria-controls="collapse12">
							<i class="fa fa-plus" aria-hidden="true"></i> Costo orario <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse12" class="collapse" aria-labelledby="heading12">
						<div id="specializzazioneDiv" class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="costoMinInput" name="costoMin" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="costo minimo"> <input id="costoMaxInput"
									name="costoMax" class="form-control"
									style="border-color: transparent;" type="text"
									placeholder="costo massimo">
								<!--  <input
									id="anniEsperienzaInput" class="form-control"
									style="border-color: transparent;" type="number"
									placeholder="anni esperienza">-->


							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">
					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse13"
							aria-expanded="false" aria-controls="collapse13">
							<i class="fa fa-plus" aria-hidden="true"></i> Inserimento Azienda
							<i class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse13" class="collapse" aria-labelledby="heading12">
						<div id="specializzazioneDiv" class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								Dal <input type="date" id="dataInserimentoInputFrom"
									name="dataInserimentoFrom" class="form-control"
									style="border-color: transparent;"> Al <input
									type="date" id="dataInserimentoInputTo"
									name="dataInserimentoTo" class="form-control"
									style="border-color: transparent;">

								<!--  <input
									id="anniEsperienzaInput" class="form-control"
									style="border-color: transparent;" type="number"
									placeholder="anni esperienza">-->


							</div>

						</div>
					</div>
				</div>

				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block form-control collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse15"
							aria-expanded="false" aria-controls="collapse15">
							<i class="fa fa-plus" aria-hidden="true"></i> Categoria protetta
							<i class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse15" class="collapse" aria-labelledby="heading10">
						<div id="areaCompetenzaDiv" class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">

								<select class="custom-select mb-3" id="categoriaProtettaSelect"
									name="categoriaProtetta" style="float: rigth;">
									<option selected value=""></option>
									<option value="on">si</option>
									<option value="off">no</option>
								</select>

							</div>

						</div>
					</div>
				</div>




				<div class="row w-100 p-2 justify-content-md-start">
					<div class="col w-100 p-0 justify-content-md-start">
						<button type="submit" class="btn btn-primary btn-block">Salva</button>
						<!--  <button type="reset" class="btn btn-danger btn-block">Cancella</button>-->
					</div>
				</div>
			</form>


			<div class="col-10">

				<button type="button" id="exportButton" class="btn btn-primary "
					style="border-color: transparent;">Esporta Risultati</button>
				<table id="risultatiTable" class="table table-bordered text-center ">
					<!-- Testa della tabella -->
					<thead class="thead-dark">
						<tr>
							<th class="noExport" scope="col">Stato</th>
							<th scope="col">Business unit</th>
							<th scope="col">Nome</th>
							<th scope="col">Cognome</th>
							<th scope="col">Area Competenza</th>
							<th scope="col">Mansione</th>
							<th scope="col">Seniority</th>
							<th scope="col">Specializzazione</th>
							<th scope="col">Inserimento Azienda</th>
							<th scope="col">costo orario</th>
							<th class="noExport" scope="col"></th>
						</tr>
					</thead>
					<!-- Corpo della tabella -->
					<tbody>
						<c:forEach var="cand" items="${list}">
							<tr>
								<td class="noExport"><c:choose>
										<c:when test="${ cand.stato.descrizione == 'Attivo'}">
											<span id="dot" data-toggle="tooltip" data-placement="top"
												title="Attivo" class="dot bg-success"></span>
										</c:when>
										<c:when test="${ cand.stato.descrizione == 'Selezionato'}">
											<span id="dot" data-toggle="tooltip" data-placement="top"
												title="Selezionato" class="dot bg-primary"></span>
										</c:when>
										<c:when test="${ cand.stato.descrizione == 'Da contattare'}">
											<span id="dot" data-toggle="tooltip" data-placement="top"
												title="Da contattare" class="dot bg-warning"></span>
										</c:when>
										<c:when test="${ cand.stato.descrizione == 'Scartato'}">
											<span id="dot" data-toggle="tooltip" data-placement="top"
												title="Scartato" class="dot bg-danger"></span>
										</c:when>
										<c:otherwise>
											<span id="dot" data-toggle="tooltip" data-placement="top"
												title="Nuovo inserito" class="dot bg-secondary"></span>
										</c:otherwise>
									</c:choose></td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
									${cand.business.business}</td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
									${cand.nome}</td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
									${cand.cognome}</td>

								<td><c:forEach var="area" items="${cand.area}">
										<div
											onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
											${area.area}</div>
									</c:forEach></td>

								<td><c:forEach var="mansione" items="${cand.mansione}">
										<div
											onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
											${mansione.mansione}</div>
									</c:forEach></td>

								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
									${cand.seniority.seniority}</td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
									<c:forEach var="specializzazione"
										items="${cand.candidatoSpecializzazione}">
										<div>${specializzazione.specializzazione.specializzazione}
											&nbsp ${specializzazione.anni} anni esperienza</div>
									</c:forEach>
								</td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
									${cand.inserimentoAzienda}</td>

								<td
									onclick="window.location = '/ProgettoHR/Candidato/${cand.id}'">
									${cand.costo.orario} &#8364; /H</td>

								<td class="noExport" data-toggle="modal"
									data-target="#EliminaModal"><i class="fas fa-trash-alt"></i></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	areaCnt = 0;
	mansioneCnt = 0;
	specializzazioneCnt = 0;

function controlloMappa() {
	  var inputFormArray = document.getElementsByTagName("input");
	  
	  for (var i = 0; i < inputFormArray.length; i++) {
		  if (inputFormArray[i].value===""){
			  	inputFormArray[i].name="";
		  }
	}
	  if (document.getElementById("selectSeniority").value === ""){
		  document.getElementById("selectSeniority").name="" 
	  }
	  if (document.getElementById("selectBusiness").value === ""){
		  document.getElementById("selectBusiness").name="" 
	  }
	  if (document.getElementById("categoriaProtettaSelect").value === ""){
		  document.getElementById("categoriaProtettaSelect").name="" 
	  }
	
}
	function stampaAreaCompetenzaSelezionata(areaCompetenzaList) {
	
				for(area of buildString(areaCompetenzaList)){
			if(document.getElementById("areaCompetenzaInput").value === area){
				var tagInput = document.createElement("input");
				tagInput.value = document.getElementById("areaCompetenzaInput").value;
				
				areaName = "area" + areaCnt;
				areaCnt++;
				
				tagInput.name = areaName;
				tagInput.readOnly = true;
				
				document.getElementById("areaCompetenzaDiv").appendChild(tagInput);
				document.getElementById("areaCompetenzaInput").value = "";
				document.getElementById("areaCompetenzaInput").focus();
				return;
			}	
		}
		alert("Area competenza scelta non esistente");
		
		
		

	}
	

	function stampaMansioneSelezionata(mansioneList) {
		
		for(mansione of buildString(mansioneList)){
			if(document.getElementById("mansioneInput").value === mansione){
		
		var tagInput = document.createElement("input");
		tagInput.value = document.getElementById("mansioneInput").value;
		
		mansioneName = "mansione" + mansioneCnt;
		mansioneCnt++;
		
		tagInput.name = mansioneName;
		tagInput.readOnly = true;
		
		document.getElementById("mansioneDiv").appendChild(tagInput);
		document.getElementById("mansioneInput").value = "";
		document.getElementById("mansioneInput").focus();
		return;
			}
		}
		alert("Mansione scelta non esistente");
	}
	

	function stampaSpecializzazioneSelezionata(specializzazioneList) {
		
		for(specializzazione of buildString(specializzazioneList)){
			if(document.getElementById("specializzazioneInput").value === specializzazione){
				
			
				var tagInput = document.createElement("input");
				tagInput.value = document.getElementById("specializzazioneInput").value;// + " " + document.getElementById("anniEsperienzaInput").value;

				specializzazioneName = "specializzazione" + specializzazioneCnt;
				specializzazioneCnt++;
				
				tagInput.name = specializzazioneName;
				tagInput.readOnly = true;
				
				document.getElementById("specializzazioneDiv").appendChild(tagInput);
				document.getElementById("specializzazioneInput").value = "";
				document.getElementById("specializzazioneInput").focus();
				return;
			}
		}
		alert("Specializzazione scelta non esistente");
		
	}

	function autocomplete(inp, arr) {
		/*the autocomplete function takes two arguments,
		the text field element and an array of possible autocompleted values:*/
		var currentFocus;
		/*execute a function when someone writes in the text field:*/
		inp
				.addEventListener(
						"input",
						function(e) {
							var a, b, i, val = this.value;
							/*close any already open lists of autocompleted values*/
							closeAllLists();
							if (!val) {
								return false;
							}
							currentFocus = -1;
							/*create a DIV element that will contain the items (values):*/
							a = document.createElement("DIV");
							a.setAttribute("id", this.id
									+ "autocomplete-list");
							a.setAttribute("class", "autocomplete-items");
							/*append the DIV element as a child of the autocomplete container:*/
							this.parentNode.appendChild(a);
							/*for each item in the array...*/
							for (i = 0; i < arr.length; i++) {
								/*check if the item starts with the same letters as the text field value:*/
								if (arr[i].substr(0, val.length)
										.toUpperCase() == val.toUpperCase()) {
									/*create a DIV element for each matching element:*/
									b = document.createElement("DIV");
									/*make the matching letters bold:*/
									b.innerHTML = "<strong>"
											+ arr[i].substr(0, val.length)
											+ "</strong>";
									b.innerHTML += arr[i]
											.substr(val.length);
									/*insert a input field that will hold the current array item's value:*/
									b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
									/*execute a function when someone clicks on the item value (DIV element):*/
									b
											.addEventListener(
													"click",
													function(e) {
														/*insert the value for the autocomplete text field:*/
														inp.value = this
																.getElementsByTagName("input")[0].value;
														/*close the list of autocompleted values,
														(or any other open lists of autocompleted values:*/
														closeAllLists();
													});
									a.appendChild(b);
								}
							}
						});
		/*execute a function presses a key on the keyboard:*/
		inp.addEventListener("keydown", function(e) {
			var x = document.getElementById(this.id + "autocomplete-list");
			if (x)
				x = x.getElementsByTagName("div");
			if (e.keyCode == 40) {
				/*If the arrow DOWN key is pressed,
				increase the currentFocus variable:*/
				currentFocus++;
				/*and and make the current item more visible:*/
				addActive(x);
			} else if (e.keyCode == 38) { //up
				/*If the arrow UP key is pressed,
				decrease the currentFocus variable:*/
				currentFocus--;
				/*and and make the current item more visible:*/
				addActive(x);
			} else if (e.keyCode == 13) {
				/*If the ENTER key is pressed, prevent the form from being submitted,*/
				e.preventDefault();
				if (currentFocus > -1) {
					/*and simulate a click on the "active" item:*/
					if (x)
						x[currentFocus].click();
				}
			}
		});
		function addActive(x) {
			/*a function to classify an item as "active":*/
			if (!x)
				return false;
			/*start by removing the "active" class on all items:*/
			removeActive(x);
			if (currentFocus >= x.length)
				currentFocus = 0;
			if (currentFocus < 0)
				currentFocus = (x.length - 1);
			/*add class "autocomplete-active":*/
			x[currentFocus].classList.add("autocomplete-active");
		}
		function removeActive(x) {
			/*a function to remove the "active" class from all autocomplete items:*/
			for (var i = 0; i < x.length; i++) {
				x[i].classList.remove("autocomplete-active");
			}
		}
		function closeAllLists(elmnt) {
			/*close all autocomplete lists in the document,
			except the one passed as an argument:*/
			var x = document.getElementsByClassName("autocomplete-items");
			for (var i = 0; i < x.length; i++) {
				if (elmnt != x[i] && elmnt != inp) {
					x[i].parentNode.removeChild(x[i]);
				}
			}
		}
		/*execute a function when someone clicks in the document:*/
		document.addEventListener("click", function(e) {
			closeAllLists(e.target);
		});
	}

	function buildString(string) {
		return string.replace("[", "").replace("]", "").split(", ");
	}

	function getMansione(listMansione, specializzazioneList,
			areaCompetenzaList) {
		var mansioneString = buildString(listMansione);
		var specializzazioneString = buildString(specializzazioneList);
		var areaCompetenzaString = buildString(areaCompetenzaList);
		autocomplete(document.getElementById("mansioneInput"),
				mansioneString);
		autocomplete(document.getElementById("specializzazioneInput"),
				specializzazioneString);
		autocomplete(document.getElementById("areaCompetenzaInput"),
				areaCompetenzaString);
	}
	</script>




	<script>
		function aggiungiNome() {

			nome = document.getElementById("inputNome").value;
			document.getElementById("aggiuntaNome").innerHTML = nome;
		}
	</script>

	<script> 
  
 $(document).ready(function () { 
	 $("#exportButton").click(function(){
    $("#risultatiTable").table2excel({ 
    	exclude: ".noExport",
        filename: "Risultati.xls" 
    }); 
 }); 
 });
  
</script>

</body>

</html>