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
	
<title>Business Unit</title>

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
		background-image: url("/ProgettoHR/img/msa.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center center;
		background-attachment: fixed;
	}
	
	header {
		height: 100%;
	}
	
	span {
		letter-spacing: 5px;
	}
	
	#zeroRecord {
		text-align: center;
		letter-spacing: 5px;
		margin: 10px;
		color: white;
	}

	#btn-nav {
		border: 1px solid white;
		border-radius: 5px;
		height: 45px;
		background-color: white;
	}

	#btn-logout, #btn-home, #btn-add {
		border-radius: 5px;
		color: black;
		outline: 0;
		transition: 0.5s;
		color: black;
	}
	
	#btn-logout:hover, #btn-home:hover {
		box-shadow: 1px 1px 2px black;
		transition: 0.5s;
		color: black;
	}

	#btn-add:hover {
		box-shadow: 1px 1px 2px #00b894;
		transition: 0.5s;
		color: black;
	}
	
	/* TABELLA BUSINESS */
	.tabellaBusiness {
		width: 50%;
		border-radius: 5px;
		overflow: hidden;
		border-collapse: collapse;
		margin-left: auto;
		margin-right: auto;
		font-size: 0.9em;
	}
	
	.tabellBusiness .head {
		background-color: whitesmoke;
		color: black;
		letter-spacing: 5px;
		border-bottom: 2px solid black;
	}
	
	.tabellaBusiness .body {
		background-color: white;
	}
	
	.tabellaBusiness .body tr {
		border-bottom: 2px solid whitesmoke;
		color: black;
		letter-spacing: 3px;
		transition: 0.5s;
	}
	
	.tabellaBusiness th {
		padding: 8px;
	}
	
	.tabellaBusiness td {
		font-size: 14px;
		padding: 4px;
	}
	
	.tabellaBusiness .footer {
		backround-color: whitesmoke;
	}
	
	.m-content, .m-content-elimina, .m-content-modifica {
		background-color: transparent;
		border: none;
	}
	
	.m-header, .m-header-elimina, .m-header-modifica {
		background-color: white;
		border-radius: 20px 20px 0px 0px;
	}
	
	.m-body {
		padding: 20px;
		margin-top: 2px;
		border: 1px solid #d3d3d3;
		border-radius: 0px 0px 20px 20px;
		border: 1px solid #d3d3d3;
		border-radius: 0px 0px 20px 20px;
		background-color: white;
	}
	
	.m-body-elimina, .m-body-modifica {
		padding: 20px;
		margin-top: 2px;
		margin-bottom: 2px;
		border: 1px solid white;
		background-color: white;
		color: black;
		letter-spacing: 3px;
		border: 1px solid white
	}

	.m-input, .m-input-modifica, .m-input-aggiungi {
		border: 1px solid black;
		border-radius: 20px;
		box-shadow: none !important;
		outline: 0;
		transition: 0.5s;
	}
	
	.m-input-aggiungi:focus {
		border: 1px solid #00b894;
	}

	.m-input-modifica:focus {
		border: 1px solid #74b9ff;
	}
	
	.m-footer-elimina, .m-footer-modifica {
		border-radius: 0px 0px 20px 20px;
		background-color: white;
	}

	.btn-aggiungi {
		border-radius: 20px;
		color: black;
		transition: 0.5s;
		box-shadow: 1px 1px 2px #00b894;
		outline: 0;
	}
	
	.btn-aggiungi:hover {
		background: #00b894;
		color: white;
		box-shadow: none !important;
		outline: 0;
	}
	
	//
	.btn-salva {
		border: 1px solid white;
		border-radius: 20px;
		background: white;
		color: black;
		transition: 0.5s;
		box-shadow: none !important;
		outline: 0;
	}
	//
	
	.btn-si, .btn-modifica {
		border: 1px solid #00b894;
		background: #00b894;
		border-radius: 15px;
		box-shadow: none !important;
		outline: 0;
		color: white;
	}
	
	.btn-si:hover, .btn-modifica:hover {
		color: white;
	}
	
	.btn-no, .btn-annulla {
		color: #d63031;
		transition: 0.5s;
		border-radius: 15px;
	}
	
	.btn-no:hover, .btn-annulla:hover {
		box-shadow: 1px 1px 2px #ff7675;
		transition: 0.5s;
		color: #d63031;
	}
	
	.btn-elimina-business {
		transition: 0.5s;
	}
	
	.btn-elimina-business:hover {
		box-shadow: 1px 1px 2px #d63031;
		color: #d63031;
		border-radius: 5px;
		transition: 0.5s;
	}
	
	.btn-modifica-business {
		background: #74b9ff;
		color: white;
		border-radius: 5px;
		transition: 0.5s;
	}
	
	.btn-modifica-business :hover {
		color: white;
		background: #0984e3;
		transition: 0.5s;
	}
	
</style>
	
</head>
<body>
	<header>
		<c:set var="singlequote" value="'"/>
		<c:set var="backslash" value="&apos"/>
		
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<div class="row w-100">
					<div id=btn-nav class="d-flex flex-row">
						<div class="col-auto align-self-center">
							<button class="btn"
								onclick="location.href = '/ProgettoHR/Home/${businessUnit}';"
								id="btn-home">
								<i class="fas fa-home"></i>
							</button>
						</div>
						<div class="col-auto align-self-center">
							<button data-toggle="modal" data-target="#aggiungiBusiness"
								class="btn float-right" id="btn-add">
								<i class="fas fa-plus"></i>
							</button>
						</div>
						<div class="col-auto align-self-center">
							<button onclick="location.href = '/ProgettoHR/Logout';"
								class="btn float-right" id="btn-logout">
								<i class="fas fa-sign-out-alt"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</nav>
		
		<div class="container">
			<div class="row align-items-center">
				<div class="col mb-5 align-self-center">
					<c:if test="${empty businessList}">
						<h2 id="zeroRecord">Nessuna business unit ancora inserita</h2>
					</c:if>
					<c:if test="${not empty businessList}">
						
						<div class="table-responsive">
							<table class="tabellaBusiness">
							
								<thead class="head">
									<tr>
										<th><h3>BUSINESS UNIT</h3></th>
										<th scope="col"></th>
									</tr>
								</thead>
								
								<tbody class="body">
									<c:forEach var="business" items="${businessList}">
										<tr>
											<c:set var="businessReplaced"
												value="${fn:replace(business.business, singlequote, backslash)}"></c:set>
											<c:set var="businessXSS" value="${fn:escapeXml(business.business)}"></c:set>
											<td>${businessXSS}</td> 
											
											<td>
												<button class="btn btn-modifica-business"
													data-toggle="modal"
													onclick="impostaParametriBusiness('${businessReplaced}')"
													data-target="#modificaBusiness">
													<i class="fas fa-pencil-alt"></i>
												</button>
												<button class="btn btn-elimina-business"
													data-toggle="modal"
													onclick="impostaParametriBusinessEliminazione('${business.business}')"
													data-target="#eliminaBusiness">
													<i class="fas fa-trash"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								
								<tfoot class="footer">
									<tr>
										<td colspan="2"></td>
									</tr>
								</tfoot>
							
							</table>
						</div>
						
					</c:if>
				</div>
			</div>
		</div>
	</header>
	
	<!-- MODAL AGGIUNTA BUSINESS UNIT -->
	<div class="modal fade" id="aggiungiBusiness" tabindex="-1"
		role="dialog" aria-labelledby="modalAggiungiBusiness" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content m-content">
				
				<div class="modal-header m-header">
					<span class="modal-title">Inserisci una nuova
						<span style="color: #004fff;">business unit</span>:
					</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>
				
				<form:form modelAttribute="business" id="formBusiness" method="POST"
					action="/ProgettoHR/BusinessSaveDaBusiness/${businessUnit}"
					onsubmit="return validate('Business', '${businessList}' );">
					<div class="modal-body m-body">
						<div class="container-fluid">
							<div class="row">
								<div class="col-10">
									<form:input path="business" type="text"
										class="form-control m-input-aggiungi" maxlenght="45"
										id="business" autocomplete="off"></form:input>
								</div>
								<div class="col-2">
									<button class="btn btn-aggiungi" type="submit">
										<i class="fas fa-plus"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</form:form>
				
			</div>
		</div>
	</div>
	
	<!-- MODAL MODIFICA BUSINESS UNIT -->
	<div class="modal fade" id="modificaBusiness" tabindex="-1"
		role="dialog" aria-labelledby="modalModificaBusiness" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content m-content-modifica">
				<form action="/ProgettoHR/AggiornaBusiness/${businessUnit}"
					method="POST">

					<div class="modal-header m-header-modifica">
						<span class="modal-title">Modifica la <span
							style="color: #004fff;">business unit</span>:
						</span>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="btn-close-modal">&times;</span>
						</button>
					</div>

					<div class="modal-body m-body-modifica">
						<input type="text" class="form-control m-input-modifica"
							name="newBusiness" id="newBusiness"> <input
							style="visibility: hidden;" name="oldBusiness" id="oldBusiness" />
					</div>

					<div class="modal-footer m-footer-modifica">
						<button type="button" class="btn btn-annulla" data-dismiss="modal">Annulla</button>
						<button type="submit" class="btn btn-modifica">Modifica</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- MODAL CANCELLA BUSINESS UNIT -->
	<div class="modal fade" id="eliminaBusiness" tabindex="-1"
		role="dialog" aria-labelledby="modalEliminaBusiness" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-centered" role="document">
			<div class="modal-content m-content-elimina">

				<div class="modal-header m-header-elimina">
					<span class="modal-title">Cancella la <span
						style="color: #004fff;">business unit</span>:
					</span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="btn-close-modal">&times;</span>
					</button>
				</div>

				<form action="/ProgettoHR/EliminaBusiness/${businessUnit}"
					method="POST">

					<div class="modal-body m-body-elimina">
						<p id="p-elimina-business"></p>
						<input style="visibility: hidden;" name="eliminaBusiness"
							id="elimina-business" />
					</div>

					<div class="modal-footer m-footer-elimina">
						<button type="button" class="btn btn-no" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-si">Sì</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	
		function impostaParametriBusiness(id) {
			id = id.replace("&apos", "'");
			document.getElementById("oldBusiness").value = id;
			document.getElementById("newBusiness").value = id;
		}
		
		function impostaParametriBusinessEliminazione(business) {
			document.getElementById("elimina-business").value = business;
			document.getElementById("p-elimina-business").innerHTML = "Sei sicuro di voler cancellare la business unit "
			+ business + "?";
		}
		
		function validate(tipo, lista) {
			var business = document.getElementById("business").value;
			var list = document.getElementById("formBusiness");
			var control = true;

			if (business === "") {

				var tagDiv = document.createElement("div");
				tagDiv.style = "color:red; font-size: small;"
				var textnode = document.createTextNode("Inserisci Business")
				tagDiv.appendChild(textnode)
				document.getElementById("business").appendChild(tagDiv);
				control = false;

				return control;
			}

			control = insertionMessage(tipo, 'business', lista);

			return control;
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