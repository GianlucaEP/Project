<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<!--Link CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="icon" href="/favicon-32x32.png" type="image/png" />

<style>
html, body {
	height: 100%;
}

.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
}
</style>

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
<title>Filtro avanzato</title>

</head>

<body
	onload="getMansione('${mansioneList}', '${specializzazioneList}', '${areaCompetenzaList}')">

	<!-- Navbar -->
	<div class="container-fluid">
		<div class="row w-100">
			<nav class="navbar navbar-light fixed-top bg-primary w-100 "
				style="opacity: 0.9;">

				<!-- Logo -->
				<nav class="navbar">
					<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
						<img src="/ProgettoHR/img/Erre_technology_group_NEW.png"
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

	<!-- COLONNA CON FILTRO -->
	<div style="margin-top: 110px;" class="container-fluid ">
		<div class="row">
			<form autocomplete="off" method="POST"
				action="/ProgettoHR//Filter/advanced/${businessUnit}">
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse1"
							aria-expanded="false" aria-controls="collapse1">
							<i class="fa fa-plus" aria-hidden="true"></i> Nome <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse1" class="collapse" aria-labelledby="heading10">
						<div  class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="nome" name="nome" class="text-left"
									style="border-color: transparent;" type="text"
									placeholder=" nome">

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse2"
							aria-expanded="false" aria-controls="collapse2">
							<i class="fa fa-plus" aria-hidden="true"></i> Cognome <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse2" class="collapse" aria-labelledby="heading10">
						<div  class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="cognome" name="cognome" class="text-left"
									style="border-color: transparent;" type="text"
									placeholder="cognome">

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse3"
							aria-expanded="false" aria-controls="collapse3">
							<i class="fa fa-plus" aria-hidden="true"></i> Anno di nascita <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse3" class="collapse" aria-labelledby="heading10">
						<div  class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<!--  <input id="anno" name="anno" class="text-left"
									style="border-color: transparent;" type="text"
									placeholder="anno">-->

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse4"
							aria-expanded="false" aria-controls="collapse4">
							<i class="fa fa-plus" aria-hidden="true"></i> Telefono <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse4" class="collapse" aria-labelledby="heading10">
						<div  class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="telefono" name="telefono" class="text-left"
									style="border-color: transparent;" type="text"
									placeholder="cognome">

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse5"
							aria-expanded="false" aria-controls="collapse5">
							<i class="fa fa-plus" aria-hidden="true"></i> Email <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse5" class="collapse" aria-labelledby="heading10">
						<div  class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="email" name="email" class="text-left"
									style="border-color: transparent;" type="text"
									placeholder="email">

							</div>

						</div>
					</div>
				</div>


				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse6"
							aria-expanded="false" aria-controls="collapse6">
							<i class="fa fa-plus" aria-hidden="true"></i> Business Unit: <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse6" class="collapse" aria-labelledby="heading10">
						<div  class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<select name="business" class="custom-select mb-3">
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
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse7"
							aria-expanded="false" aria-controls="collapse7">
							<i class="fa fa-plus" aria-hidden="true"></i> Seniority: <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse7" class="collapse" aria-labelledby="heading10">
						<div  class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
							<!--  <select name="seniority" class="custom-select mb-3">
									<option selected></option>
									<c:forEach var="sen" items="${seniorityList}">
										<option value="${sen.seniority}">${sen.seniority}</option>
									</c:forEach>
								</select>-->	

							</div>

						</div>
					</div>
				</div>
				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse8"
							aria-expanded="false" aria-controls="collapse8">
							<i class="fa fa-plus" aria-hidden="true"></i> Provenienza <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse8" class="collapse" aria-labelledby="heading10">
						<div  class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input id="provenienza" name="provenienza" class="text-left"
									style="border-color: transparent;" type="text"
									placeholder="provenienza">

							</div>

						</div>
					</div>
				</div>




				<div class="card" style="border-color: transparent;">

					<h2 class="">
						<button class="btn btn-block text-left collapsed"
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
								<input id="areaCompetenzaInput" class="text-left"
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
						<button class="btn btn-block text-left collapsed"
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
								<input id="mansioneInput" class="text-left"
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
						<button class="btn btn-block text-left collapsed"
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
								<input id="specializzazioneInput" class="text-left"
									style="border-color: transparent;" type="text"
									placeholder="specializzazione"> <input
									id="anniEsperienzaInput" class="text-left"
									style="border-color: transparent;" type="number"
									placeholder="anni esperienza">

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
						<button class="btn btn-block text-left collapsed"
							style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
							type="button" data-toggle="collapse" data-target="#collapse12"
							aria-expanded="false" aria-controls="collapse12">
							<i class="fa fa-plus" aria-hidden="true"></i> Categoria protetta <i
								class="fas fa-briefcase float-right pt-1"></i>
						</button>
					</h2>

					<div id="collapse12" class="collapse" aria-labelledby="heading10">
						<div id="areaCompetenzaDiv" class="card-body">

							<div class="autocomplete" style="border-bottom-style: ridge;">
								<input type="checkbox" class="form-check form-check-inline"
									id="categoriaProtetta" name="categoriaProtetta"
									style="float: rigth;"></input> Categoria Protetta
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

			<!--    <div class="col-2 pl-0" style="background-color: #ffffff;">
				<form autocomplete="off" action="/FiltroAvanzato_jsp.html"
					style="box-shadow: 0px 0px 2px black; border-bottom-style: ridge; border-color: rgb(37, 137, 204);">

					NOME
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading1">
							<h2>

								<button class="btn btn-block text-left"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse1"
									aria-expanded="true" aria-controls="collapse1">
									<i class="fa fa-plus" aria-hidden="true"></i> Nome <i
										class="fas fa-user-circle float-right pt-1"></i>
								</button>

							</h2>
						</div>
						<div id="collapse1" class="collapse show"
							aria-labelledby="heading1">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">

									<input id="inputNome" class="text-left"
										style="border-color: transparent;" type="text"
										name="nomeCandidato" placeholder=" nome candidato">
									<button class="btn" onclick="aggiungiNome()">
										<i class="fas fa-arrow-circle-down"></i>
									</button>

								</div>

								<div id="aggiuntaNome"></div>
							</div>
						</div>
					</div>


					COGNOME
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading2">
							<h2>

								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse2"
									aria-expanded="false" aria-controls="collapse2">
									<i class="fa fa-plus" aria-hidden="true"></i> Cognome <i
										class="fas fa-user-circle float-right pt-1"></i>
								</button>

							</h2>
						</div>
						<div id="collapse2" class="collapse" aria-labelledby="heading2">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">

									<input id="inputCognome" class="text-left"
										style="border-color: transparent;" type="text"
										name="cognomeCandidato" placeholder=" cognome candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>

								</div>

							</div>
						</div>
					</div>

				DATA DI NASCITA
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading3">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse3"
									aria-expanded="false" aria-controls="collapse3">
									<i class="fa fa-plus" aria-hidden="true"></i> Data nascita <i
										class="far fa-calendar-alt float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse3" class="collapse" aria-labelledby="heading3">
							<div class="card-body">

								<div style="border-bottom-style: ridge;">
									<input type="date" style="border-color: transparent;"
										pattern="yyyy-MM-dd" class="form-control text-center"
										id="inputNascita" path="dataPresentato" name="dataCandidato">
								</div>

							</div>
						</div>
					</div>

					 TELEFONO 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading4">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse4"
									aria-expanded="false" aria-controls="collapse4">
									<i class="fa fa-plus" aria-hidden="true"></i> Telefono <i
										class="fas fa-phone float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse4" class="collapse" aria-labelledby="heading4">
							<div class="card-body">

								<div style="border-bottom-style: ridge;">
									<input type="tel" style="border-color: transparent;"
										id="inputTelefono" name="telefonoCandidato"
										pattern="[0-9]{3}[0-9]{3}[0-9]{4}" placeholder="nnn/nnn/nnnn">
									<button onclick="telefono()" class="btn" type="submit">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>
							</div>
						</div>
					</div>

				 E-MAIL 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading5">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse5"
									aria-expanded="false" aria-controls="collapse5">
									<i class="fa fa-plus" aria-hidden="true"></i> E-mail <i
										class="fas fa-envelope float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse5" class="collapse" aria-labelledby="heading5">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputE-mail" class="text-left"
										style="border-color: transparent;" type="text"
										name="e-mailCandidato" placeholder=" e-mail candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					PROVENIENZA CANDIDATURA 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading6">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse6"
									aria-expanded="false" aria-controls="collapse6">
									<i class="fa fa-plus" aria-hidden="true"></i> Provenienza <i
										class="fas fa-network-wired float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse6" class="collapse" aria-labelledby="heading6">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputProvenienza" class="text-left"
										style="border-color: transparent;" type="text"
										name="provenienzaCandidato"
										placeholder=" provenienza candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

				 CATEGORIA PROTETTA 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading7">
							<h2>

								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse7"
									aria-expanded="false" aria-controls="collapse7">
									<i class="fa fa-plus" aria-hidden="true"></i> Categoria
									protetta
								</button>

							</h2>

						</div>

						<div id="collapse7" class="collapse" aria-labelledby="heading7">
							<div class="card-body">

								<div style="border-bottom-style: ridge;">

									<div class="custom-control custom-checkbox text-center">
										<input type="checkbox" class="custom-control-input"
											id="categoriaProtettaCandidato" unchecked> <label
											class="custom-control-label" for="categoriaProtettaCandidato">Categoria
											protetta</label>
									</div>

								</div>
							</div>
						</div>
					</div>


					 BUSINESS UNIT 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading8">
							<h2>

								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse8"
									aria-expanded="false" aria-controls="collapse8">
									<i class="fa fa-plus" aria-hidden="true"></i> Business unit
								</button>

							</h2>
						</div>
						<div id="collapse8" class="collapse" aria-labelledby="heading8">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputBusinessUnit" class="text-left"
										style="border-color: transparent;" type="text"
										name="businessUnitCandidato"
										placeholder=" business unit candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					 AREA DI COMPETENZA 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading9">
							<h2>
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse9"
									aria-expanded="false" aria-controls="collapse9">
									<i class="fa fa-plus" aria-hidden="true"></i> Area competenza <i
										class="fas fa-briefcase float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse9" class="collapse" aria-labelledby="heading9">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputArea" class="text-left"
										style="border-color: transparent;" type="text"
										name="areaCandidato" placeholder=" area competenza candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					 MANSIONE 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading10">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse10"
									aria-expanded="false" aria-controls="collapse10">
									<i class="fa fa-plus" aria-hidden="true"></i> Mansione <i
										class="fas fa-briefcase float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse10" class="collapse" aria-labelledby="heading10">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="myInput" class="text-left"
										style="border-color: transparent;" type="text"
										name="mansioneCandidato" placeholder=" mansione candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					 SENIORITY 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading11">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse11"
									aria-expanded="false" aria-controls="collapse11">
									<i class="fa fa-plus" aria-hidden="true"></i> Seniority <i
										class="fas fa-briefcase float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse11" class="collapse" aria-labelledby="heading11">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputSeniority" class="text-left"
										style="border-color: transparent;" type="text"
										name="seniorityCandidato" placeholder=" seniority candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					 SPECIALIZZAZIONE 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading12">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse12"
									aria-expanded="false" aria-controls="collapse12">
									<i class="fa fa-plus" aria-hidden="true"></i> Specializzazione
									<i class="fas fa-briefcase float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse12" class="collapse" aria-labelledby="heading12">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputSpecializzazione" class="text-left"
										style="border-color: transparent;" type="text"
										name="specializzazioneCandidato"
										placeholder=" specializzazione candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					 INSERIMENTO AZIENDA 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading13">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse13"
									aria-expanded="false" aria-controls="collapse13">
									<i class="fa fa-plus" aria-hidden="true"></i> Inserimento <i
										class="far fa-calendar-alt float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse13" class="collapse" aria-labelledby="heading13">
							<div class="card-body">

								<div style="border-bottom-style: ridge;">

									<input type="date" style="border-color: transparent;"
										pattern="yyyy-MM-dd" class="form-control text-center"
										id="inputInserimento" path="dataPresentato"
										name="inserimentoCandidato">

								</div>
							</div>
						</div>
					</div>

					 INQUADRAMENTO 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading14">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse14"
									aria-expanded="false" aria-controls="collapse14">
									<i class="fa fa-plus" aria-hidden="true"></i> Inquadramento
								</button>
							</h2>
						</div>
						<div id="collapse14" class="collapse" aria-labelledby="heading14">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputInquadramento" class="text-left"
										style="border-color: transparent;" type="text"
										name="inquadramentoCandidato"
										placeholder=" inquadramento candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					RAL 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading15">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse15"
									aria-expanded="false" aria-controls="collapse15">
									<i class="fa fa-plus" aria-hidden="true"></i> RAL <i
										class="fas fa-euro-sign float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse15" class="collapse" aria-labelledby="heading15">
							<div class="card-body">

								<div style="border-bottom-style: ridge;">
									<input style="border-color: transparent;" id="inputRAL"
										name="RALCandidato" placeholder=" RAL candidato">
									<button class="btn" type="submit">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>
							</div>
						</div>
					</div>

					 BENEFIT 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading16">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse16"
									aria-expanded="false" aria-controls="collapse16">
									<i class="fa fa-plus" aria-hidden="true"></i> Benefit
								</button>
							</h2>
						</div>
						<div id="collapse16" class="collapse" aria-labelledby="heading16">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputBenefit" class="text-left"
										style="border-color: transparent;" type="text"
										name="benefitCandidato" placeholder=" benefit candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					 PREAVVISO 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading17">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse17"
									aria-expanded="false" aria-controls="collapse17">
									<i class="fa fa-plus" aria-hidden="true"></i> Preavviso
								</button>
							</h2>
						</div>
						<div id="collapse17" class="collapse" aria-labelledby="heading17">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputPreavviso" class="text-left"
										style="border-color: transparent;" type="text"
										name="preavvisoCandidato" placeholder=" preavviso candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					DESIDERATA 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading18">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse18"
									aria-expanded="false" aria-controls="collapse18">
									<i class="fa fa-plus" aria-hidden="true"></i> Desiderata
								</button>
							</h2>
						</div>
						<div id="collapse18" class="collapse" aria-labelledby="heading18">
							<div class="card-body">

								<div class="autocomplete" style="border-bottom-style: ridge;">
									<input id="inputDesiderata" class="text-left"
										style="border-color: transparent;" type="text"
										name="desiderataCandidato" placeholder=" desiderata candidato">
									<button class="btn">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>

					 COSTO ORARIO 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading19">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse19"
									aria-expanded="false" aria-controls="collapse19">
									<i class="fa fa-plus" aria-hidden="true"></i> Costo orario <i
										class="fas fa-euro-sign float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse19" class="collapse" aria-labelledby="heading19">
							<div class="card-body">

								<div style="border-bottom-style: ridge;">
									<input style="border-color: transparent;" id="inputCostoOrario"
										name="costoOrarioCandidato"
										placeholder=" costo orario candidato">
									<button class="btn" type="submit">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>
							</div>
						</div>
					</div>

					 COSTO GIORNALIERO 
					<div class="card" style="border-color: transparent;">
						<div class="card-header" id="heading20">
							<h2 class="">
								<button class="btn btn-block text-left collapsed"
									style="border-radius: 0px 0px 0px 0px; box-shadow: 0px 0px 2px black;"
									type="button" data-toggle="collapse" data-target="#collapse20"
									aria-expanded="false" aria-controls="collapse20">
									<i class="fa fa-plus" aria-hidden="true"></i> Costo giornaliero
									<i class="fas fa-euro-sign float-right pt-1"></i>
								</button>
							</h2>
						</div>
						<div id="collapse20" class="collapse" aria-labelledby="heading20">
							<div class="card-body">

								<div style="border-bottom-style: ridge;">
									<input style="border-color: transparent;"
										id="inputCostoGiornaliero" name="costoGiornalieroCandidato"
										placeholder=" costo giornaliero candidato">
									<button class="btn" type="submit">
										<i class="fas fa-arrow-circle-down"></i>
									</button>
								</div>

							</div>
						</div>
					</div>
				</form>
			</div>-->
			<div class="col-10">

				<table class="table table-bordered text-center ">
					<!-- Testa della tabella -->
					<thead class="thead-dark">
						<tr>
							<th scope="col">Stato</th>
							<th scope="col">Business unit</th>
							<th scope="col">Nome</th>
							<th scope="col">Cognome</th>
							<th scope="col">Area Competenza</th>
							<th scope="col">Mansione</th>
							<th scope="col">Seniority</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<!-- Corpo della tabella -->
					<tbody>
						<c:forEach var="cand" items="${list}">
							<tr>
								<td><c:choose>
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
									onclick="window.location = '/ProgettoHR/Candidato/${businessUnit}/${cand.id}'">
									${cand.business.business}</td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${businessUnit}/${cand.id}'">
									${cand.nome}</td>
								<td
									onclick="window.location = '/ProgettoHR/Candidato/${businessUnit}/${cand.id}'">
									${cand.cognome}</td>

								<td><c:forEach var="area" items="${cand.area}">
										<span
											onclick="window.location = '/ProgettoHR/Candidato/${businessUnit}/${cand.id}'">
											${area.area}</span>
									</c:forEach></td>

								<td><c:forEach var="mansione" items="${cand.mansione}">
										<span
											onclick="window.location = '/ProgettoHR/Candidato/${businessUnit}/${cand.id}'">
											${mansione.mansione}</span>
									</c:forEach></td>

								<td
									onclick="window.location = '/ProgettoHR/Candidato/${businessUnit}/${cand.id}'">
									${cand.seniority.seniority}</td>
								<td data-toggle="modal" data-target="#EliminaModal"><i
									class="fas fa-trash-alt"></i></td>
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
				tagInput.value = document.getElementById("specializzazioneInput").value + " " + document.getElementById("anniEsperienzaInput").value;

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

</body>

</html>