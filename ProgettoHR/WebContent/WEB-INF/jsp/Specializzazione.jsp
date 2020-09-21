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
<title>Area competenza</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>


<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

/* Body e html generale*/
html, body {
	height: 100%;
}

body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
}

a, a:hover, a:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

/* Navbar */
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

.container {
	margin-top: 20px;
}

/* TABELLA AREE */
.tabellaSpecializzazione {
	width: 100%;
	border-collapse: collapse;
	font-size: 0.9em;
	border-radius: 5px 5px 5px 5px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	border-collapse: collapse;
}

.tabellaSpecializzazione .head {
	background-color: #5aa9e6;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

.tabellaSpecializzazione .body tr {
	text-align: left;
	border-bottom: 1px solid #dddddd;
}

.tabellaSpecializzazione .body tr:nth-of-type {
	background-color: #f3f3f3;
}

.tabellaSpecializzazione .body tr:nth-last-of-type {
	border-bottom: 2px solid #5aa9e6;
}

.tabellaSpecializzazione th {
	padding: 8px;
}

.tabellaSpecializzazione td {
	font-size: 14px;
	padding: 4px;
}

#bottoneModificaSpecializzazione {
	float: right;
	background-color: #5aa9e6;
	margin-left: 2px;
}

#bottoneEliminaSpecializzazione {
	float: right;
	background-color: #5aa9e6;
	margin-left: 2px;
}
</style>

</head>
<body>
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

	<div class="container">

		<div class="col">
			<!-- TABELLA CANDIDATO -->
			<c:choose>
				<c:when test="${empty specializzazioneList}">
					<h2 id="zeroRecord">La ricerca non ha prodotto alcun risultato</h2>
				</c:when>
				<c:otherwise>
					<table class="tabellaSpecializzazione">

						<thead class="head">
							<tr>
								<th><h3>SPECIALIZZAZIONE</h3></th>
								<th scope="col"></th>
							</tr>
						</thead>

						<tbody class="body">
							<c:forEach var="specializzazione" items="${specializzazioneList}">
								<tr>
									<td><span
										onclick="window.location = '/ProgettoHR/Specializzazione/${businessUnit}'">
											${specializzazione.specializzazione}</span></td>

									<td><button class="btn"
											id="bottoneEliminaSpecializzazione" data-toggle="modal"
											onclick="impostaParametriSpecializzazioneEliminazione('${specializzazione.specializzazione}')"
											data-target="#EliminaSpecializzazioneModal">
											<i class="fas fa-trash"></i>
										</button>
										<button class="btn" id="bottoneModificaSpecializzazione"
											data-toggle="modal"
											onclick="impostaParametriSpecializzazione('${specializzazione.specializzazione}')"
											data-target="#ModificaSpecializzazioneModal">
											<i class="fas fa-cogs"></i>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>

						<tfoot class="footer">
							<tr>
								<td></td>

							</tr>
						</tfoot>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<!-- MODAL MODIFICA MANSIONE -->
	<div class="modal fade" id="ModificaSpecializzazioneModal"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/AggiornaSpecializzazione/${businessUnit}"
					method="POST">

					<div class="modal-header">
						Aggiorna Specializzazione <input style="visibility: hidden;"
							name="oldSpecializzazione" id="oldSpecializzazione" />
					</div>

					<div class="modal-body">
						<input type="text" class="form-control" name="newSpecializzazione"
							id="newSpecializzazione">
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Aggiorna</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!-- MODAL CANCELLA SPECIALIZZAZIONE -->
	<div class="modal fade" id="EliminaSpecializzazioneModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="/ProgettoHR/EliminaSpecializzazione/${businessUnit}"
					method="POST">

					<div class="modal-header">
						Sei sicuro di voler cancellare la specializzazione selezionata? <input
							style="visibility: hidden;" name="specializzazione"
							id="specializzazione" />
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success">sì</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">no</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<script>
		function impostaParametriSpecializzazione(id) {
			document.getElementById("specializzazione").value = id;

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