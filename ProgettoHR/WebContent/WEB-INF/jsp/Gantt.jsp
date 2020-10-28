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
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>


<style>
@import
	"https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

body, html, #container {
	height: 100%;
}
/* MEDIA PER SCHERMO DESKTOP GRANDE */
body {
	font-family: 'Poppins', sans-serif;
	background: #fafafa;
	transition: 0.5s;
}

#aSidebar, #aSidebar:hover, #aSidebar:focus {
	color: inherit;
	text-decoration: none;
	transition: all 0.3s;
}

.dark-mode {
	background-color: black;
	color: white;
	transition: 0.5s;
}

/* PALLINI STATO CANDIDATO */
.dot {
	height: 25px;
	width: 25px;
	border-radius: 50%;
	display: inline-block;
	margin-top: 5px;
}

/* NAVBAR */
.navbar {
	background: #5aa9e6;
	border: none;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-nav .nav-link {
	height: 50px;
	width: 50px;
	background-color: #7fc8f8;
	border-radius: 50%;
}

.navbar .navbar-brand .logo {
	width: auto;
	height: 70px;
}

#iconaLogout {
	width: 25px;
	height: 48px;
}

/* SIDEBAR */
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

.tabellaHome {
	width: 100%;
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

#fineButton {
	visibility: hidden;
}

#colonnaNavbar{
padding: 0;
}

#colonnaSidebar{
padding-left: 0;

}
#chart_div{
overflow-x: scroll;
overflow-y:hidden;
  height:150px;
  margin:20px;
display:none;
}
@media screen and (max-width: 855px) {
	body {
		
	}
	#colonnaTable {
		
	}
	[class*="col-"] {
		width: 100%;
	}
}
</style>

</head>

<body>
	<div id="container" class="container-fluid">
		<div class="row">
			<div class="col" id="colonnaNavbar">
				<!-- NAVBAR -->
				<nav class="navbar">

					<!-- LOGO -->
					<a class="navbar-brand" href="/ProgettoHR/Home/${businessUnit}">
						<img class="logo" src="/ProgettoHR/img/erretechnologygroup.png">
					</a>

					<div id="navbarResponsive">
						<ul class="navbar-nav ml-auto">

							<li class="nav-item">
								<form action="/ProgettoHR/Logout">
									<button type="submit" class="btn nav-link p-0">
										<i id="iconaLogout" class="fas fa-sign-out-alt"></i>
									</button>
								</form>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</div>

		<!-- COLONNA BARRA LATERALE -->
		<div id="colonnaBarraLaterale" class="row  mt-4">
			<div id="colonnaSidebar"  class="col-2">
				<!-- BARRA LATERALE -->
				<div id="sidebar" >
					<div class="sidebar-header">
						<h3>Gantt</h3>
					</div>

					<ul class="list-unstyled components">
						<li><a id="aSidebar" href="/ProgettoHR/Home/${businessUnit}"
							type="button"><i class="fas fa-home"></i> Torna alla Home</a></li>
					</ul>

				</div>
			</div>
			<div id="colonnaForm" class="col-2">
				<!--Gantt -->

				<form>
					<!--  <div class="form-group">
						<label for="exampleFormControlInput1">id task</label> <input
							type="text" class="form-control" id="idTask">
					</div>-->
					<div class="form-group">
						<label for="exampleFormControlInput1">nome task</label> <input
							type="text" class="form-control" id="nomeTask">
					</div>
					<div id="divNomeCandidato" class="form-group mb-3">
						<label>Nome candidato:</label>
							<div class="form-group">
							
									<input type="button" id="nomeCandidato" class="btn btn-primary"
										value="scegli candidato" data-toggle="modal"
										data-target="#candModal">

								

						</div>
					</div>

					<div class="form-group">
						<label for="exampleFormControlInput2">data inizio</label> <input
							type="date" class="form-control" id="initialDate">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput3">data fine</label> <input
							type="date" class="form-control" id="endDate">
					</div>

					<div class="form-group">
						<button class="btn btn-primary" type="reset"
							onClick="return validate();" id="aggiungiButton">aggiungi</button>

					</div>
					<!--  	<div class="form-group">
						<input type="button" class="btn btn-primary" value="fine"
							onClick="endGantt()" id="fineButton">

					</div>-->
				</form>
			</div>
			<div class="col-auto" id="colTabellaGantt">
				<div class="row p-2" id="divCandidatoTemp"></div>

				<div class="row">
					<div class="col-auto">
						<input type="button" class="btn btn-primary" value="fine"
							onClick="endGantt()" id="fineButton">
					</div>
				</div>
				<div>
					<div class="col p0" id="chart_div"></div>
				</div>
			</div>


		</div>

	</div>
	<!-- modal candidato -->
	<div class="modal fade" id="candModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="candidatoModalLabel">Seleziona
						candidato</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="candModal">
					<table class="tabellaHome">

						<thead class="head">
							<tr>

								<th scope="col">Business unit</th>
								<th scope="col">Nome</th>
								<th scope="col">Cognome</th>
								<th scope="col">Area Competenza</th>
								<th scope="col">Mansione</th>
								<th scope="col">Costo Giornaliero</th>
								<th scope="col">seleziona</th>
							</tr>
						</thead>

						<tbody class="body">
							<c:forEach var="cand" items="${list}">
								<tr>
									<td>${cand.business.business}</td>
									<td>${cand.nome}</td>
									<td>${cand.cognome}</td>

									<td><c:forEach var="area" items="${cand.area}">
														
															${area.area}
													</c:forEach></td>

									<td><c:forEach var="mansione" items="${cand.mansione}">
													
															${mansione.mansione}
													</c:forEach></td>

									<td>${cand.costo.giornaliero}</td>


									<td><button type="button" class="btn btn-success"
											onclick="addCandidato(${cand.costo.giornaliero}, '${cand.nome}')">
											<i class="fas fa-plus"></i>
										</button></td>

								</tr>

							</c:forEach>
						</tbody>

					</table>
				</div>
				<div class="modal-footer">
					<button type="reset" id="bottone-cancella-specializzazione"
						class="btn btn-danger" data-dismiss="modal">Chiudi</button>
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
					<h5 class="modal-title" id="errorModalLabel">Errore</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="errorModalBody"></div>
				<div class="modal-footer">
					<button type="reset" id="bottone-cancella-specializzazione"
						class="btn btn-danger" data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
	var countCandidatiGant=0;
	
		google.charts.load('current', {
			'packages' : [ 'timeline' ]
		});
		//google.charts.setOnLoadCallback(drawChart);

		function daysToMilliseconds(days) {
			return days * 24 * 60 * 60 * 1000;
		}

		function drawChart(arrayGantt) {

			var data = new google.visualization.DataTable();

			data.addColumn({type: 'string', id: 'Task Name'})
			data.addColumn({type: 'string', id: 'Name'})
			data.addColumn({type: 'date', id: 'Start Date'})			
			data.addColumn({type: 'date', id: 'End Date'})

			data.addRows(arrayGantt);


			var chart = new google.visualization.Timeline(document
					.getElementById('chart_div'));

			
			/*  google.visualization.events.addListener(chart, 'ready', function () {
				  var c = document.getElementById("myCanvas");
				  var ctx = c.getContext("2d");
				  var img = document.getElementById("chart_div");
				  ctx.drawImage(img, 10, 10);
				});*/
			  
				document.getElementById("chart_div").style.display = "block";
				document.getElementById("colonnaForm").style.display = "none";

			chart.draw(data, {
				 width: 1200
			});
				
			
		}
		
		function addCandidato(costo, nome) {
		var divNomeCandidato= document.getElementById("divNomeCandidato");
		var tagDiv = document.createElement("div");		
		var tagInput = document.createElement("input");
		var tagDivButton = document.createElement("span");
		tagInput.value = nome;
		tagInput.classList.add("form-control");
		
		tagDiv.classList.add("form-row");
		tagDiv.id="CandidatoTemporaneoGantt";
		
		var ColDiv1 = document.createElement("div");
			ColDiv1.classList.add("col-11");
			
		var ColDiv2 = document.createElement("div");
			ColDiv2.classList.add("col-1");
			tagInput.name = "candidato";
			tagInput.id="candidatoNameInput"
			tagInput.readOnly = true;
			
			tagDivButton.classList.add("btn");
			tagDivButton.style.margin = "0px 0px 8px 0px";
			tagDivButton.innerHTML = '<i id="iconaMeno" class="fa fa-minus"></i>';
			
			
			ColDiv1.appendChild(tagInput)
			tagDiv.appendChild(ColDiv1);
			
			ColDiv2.appendChild(tagDivButton)
			tagDiv.appendChild(ColDiv2);
			
			document.getElementById("divNomeCandidato").appendChild(tagDiv);
			
			

			var tagDivHidden = document.createElement("div");		
			var tagInputHidden = document.createElement("input");
			
			tagInputHidden.value = costo;
			
			tagInputHidden.classList.add("form-control");
			
			
			tagDivHidden.classList.add("form-row");
			var ColDiv1Hidden = document.createElement("div");
				ColDiv1Hidden.classList.add("col-11");

				tagInputHidden.name = "costo";
				tagInputHidden.id="costoInput"
				tagInputHidden.readOnly = true;
				
			
				
				
				ColDiv1Hidden.appendChild(tagInputHidden)
				tagDivHidden.appendChild(ColDiv1Hidden);
				tagDivHidden.style.display="none";
				
				document.getElementById("CandidatoTemporaneoGantt").appendChild(tagDivHidden);
				
			
				tagDivButton.onclick = function(){				              	              	          				
					tagDiv.remove();
					tagDivHidden.remove();
					document.getElementById("nomeCandidato").disabled=false;

				};
				document.getElementById("nomeCandidato").disabled=true;
				$('#candModal').modal('toggle');
				
				
		}
		
		
		function aggiungiCandidato() {
		//	var idTask=document.getElementById("idTask").value
			var nomeTask=document.getElementById("nomeTask").value
			var candidatoNameInput=document.getElementById("candidatoNameInput").value
			var costoInput=document.getElementById("costoInput").value
			var initialDate=document.getElementById("initialDate").value
			var endDate=document.getElementById("endDate").value
			
			var tagDiv = document.createElement("div");
			tagDiv.id="candidatoGantt"+countCandidatiGant;
			
			
			/*var divIdTask = document.createElement("div");
			divIdTask.id="idTask"+countCandidatiGant;
			divIdTask.innerHTML =idTask;*/
			
			//creo tabella
			
			if (document.getElementById("tabellaCandidatiGantt")===null){
				
				//	var rowTable=document.createElement("div");
					//rowTable.setAttribute("id", "rowTable");
					//rowTable.setAttribute("class", "row p-2");
		  			//document.getElementById("divCandidatoTemp").appendChild(rowTable);
				
					var tabella = document.createElement("table");
		  			tabella.setAttribute("id", "tabellaCandidatiGantt");
		  			tabella.setAttribute("class", "tabellaHome");
		  			document.getElementById("divCandidatoTemp").appendChild(tabella);
		
		  			
		  			var thead= document.createElement("thead");
		  			thead.setAttribute("id", "myHeadTable");
		  			thead.setAttribute("class", "head");
		  			document.getElementById("tabellaCandidatiGantt").appendChild(thead);
		
		  			var trCol = document.createElement("tr");
		  			trCol.setAttribute("id", "trCol");
		  			document.getElementById("myHeadTable").appendChild(trCol);
		  			
		  			var thNomeTask = document.createElement("th");
		  			thNomeTask.setAttribute("id", "thNomeTask");
		  			document.getElementById("trCol").appendChild(thNomeTask);
		  			var textNode=document.createTextNode("Nome Task");
		  			document.getElementById("thNomeTask").appendChild(textNode)
		  			
		  			var thCandidatoName = document.createElement("th");
		  			thCandidatoName.setAttribute("id", "thCandidatoName");
		  			document.getElementById("trCol").appendChild(thCandidatoName);		
		  			var textNode=document.createTextNode("Nome candidato");
		  			document.getElementById("thCandidatoName").appendChild(textNode)
		  			
		  			var thInitialDate = document.createElement("th");
		  			thInitialDate.setAttribute("id", "thInitialDate");
		  			document.getElementById("trCol").appendChild(thInitialDate);
		  			var textNode=document.createTextNode("initial Date");
		  			document.getElementById("thInitialDate").appendChild(textNode)
		  			
		  			var thEndDate = document.createElement("th");
		  			thEndDate.setAttribute("id", "thEndDate");
		  			document.getElementById("trCol").appendChild(thEndDate);
		  			var textNode=document.createTextNode("end Date");
		  			document.getElementById("thEndDate").appendChild(textNode)
		  			
		  			var thPrice = document.createElement("th");
		  			thPrice.setAttribute("id", "thPrice");
		  			document.getElementById("trCol").appendChild(thPrice);
		  			var textNode=document.createTextNode("price");
		  			document.getElementById("thPrice").appendChild(textNode)
		  			
		  			var thRemove = document.createElement("th");
		  			thRemove.setAttribute("id", "thRemove");
		  			document.getElementById("trCol").appendChild(thRemove);
		  			var textNode=document.createTextNode("rimuovi");
		  			document.getElementById("thRemove").appendChild(textNode)
		  			
		  			var tbody= document.createElement("tbody");
		  			tbody.setAttribute("id", "myBodyTable");
		  			tbody.setAttribute("class", "body");
		  			document.getElementById("tabellaCandidatiGantt").appendChild(tbody);
  			
			}
  			//------------------------------------------------------------------------------------
  			
  			
  			var trRow = document.createElement("tr");
  			trRow.setAttribute("id", "trRow"+countCandidatiGant);
  			document.getElementById("myBodyTable").appendChild(trRow);
  			
  			var tdNomeTask = document.createElement("td");
  			tdNomeTask.setAttribute("id", "tdNomeTask"+countCandidatiGant);
  			var textNodeNomeTask = document.createTextNode(nomeTask);
  			tdNomeTask.appendChild(textNodeNomeTask);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdNomeTask);
  			
  			var tdCandidatoName = document.createElement("td");
  			tdCandidatoName.setAttribute("id", "tdCandidatoName"+countCandidatiGant);
  			var textNodeCandidatoName = document.createTextNode(candidatoNameInput);
  			tdCandidatoName.appendChild(textNodeCandidatoName);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdCandidatoName);
  			
  			var tdInitialDate = document.createElement("td");
  			tdInitialDate.setAttribute("id", "tdInitialDate"+countCandidatiGant);
  			var textNodeInitialDate = document.createTextNode(initialDate);
  			tdInitialDate.appendChild(textNodeInitialDate);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdInitialDate);
  			
  			var tdEndDate = document.createElement("td");
  			tdEndDate.setAttribute("id", "tdEndDate"+countCandidatiGant);
  			var textNodeEndDate = document.createTextNode(endDate);
  			tdEndDate.appendChild(textNodeEndDate);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdEndDate);
  			
  			var tdPrice = document.createElement("td");
  			tdPrice.setAttribute("id", "tdPrice"+countCandidatiGant);
  			var textNodetdPrice = document.createTextNode(costoInput);
  			tdPrice.appendChild(textNodetdPrice);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdPrice);
  			
  			
			var tagDivButton = document.createElement("span");
			tagDivButton.classList.add("btn");
			tagDivButton.style.margin = "0px 0px 8px 0px";
			tagDivButton.innerHTML = '<i class="fa fa-minus"></i>';
			tagDivButton.id="menoButtonTable"+countCandidatiGant;
			
			document.getElementById("trRow"+countCandidatiGant).appendChild(tagDivButton);

			var x=document.getElementById("divCandidatoTemp").childElementCount;
			if (x>0) {
				document.getElementById("fineButton").style.visibility="visible";
			}
			
			document.getElementById("CandidatoTemporaneoGantt").remove();
			countCandidatiGant++;
			
			tagDivButton.onclick = function(){		
				//countCandidatiGant--;
				
				trRow.remove();
				
				x=document.getElementById("myBodyTable").childElementCount;
				
				
				if (x<1) {
					document.getElementById("fineButton").style.visibility="hidden";
					
					document.getElementById("tabellaCandidatiGantt").remove();
					
				}
				
			};
		}
		
		
		function endGantt(){
			var arrayListCandidatiGantt = [];
			var arrayCandidatoGantt;
			var costoTotale=0;
			var diffDays=0;


			for (var i = 0; i < countCandidatiGant; i++) {
				
					if (document.getElementById("tdNomeTask"+i)!=null){
				
							var date1=new Date(document.getElementById("tdInitialDate"+i).innerHTML);
							var date2=new Date(document.getElementById("tdEndDate"+i).innerHTML);
							
							arrayCandidatoGantt=[
								//document.getElementById("idTask"+i).innerHTML, 
								document.getElementById("tdNomeTask"+i).innerHTML, 
								document.getElementById("tdCandidatoName"+i).innerHTML,
								date1,
								date2,
								//document.getElementById("tdPrice"+i).innerHTML
								];
							
							
							arrayListCandidatiGantt.push(arrayCandidatoGantt.valueOf());
							
							//arrayCandidatoGantt.splice(0, arrayCandidatoGantt.length);
							var diffTime = Math.abs(date2 - date1);
							var tempDiffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
							diffDays= diffDays+tempDiffDays;
							var costForDays=tempDiffDays*parseInt(document.getElementById("tdPrice"+i).innerHTML)
							costoTotale=costoTotale+costForDays;
							
							var menoButtonTable=document.getElementById("menoButtonTable"+i);
							menoButtonTable.parentNode.removeChild(menoButtonTable);
							//document.getElementById("menoButtonTable"+i).style.visibility="hidden";
					
					if (document.getElementById("thRemove")!=null){
					
							thRemove.parentNode.removeChild(thRemove);
							}
					}
			}

			
			drawChart(arrayListCandidatiGantt);
			
			
	  			
	  			
				printTotalCost(costoTotale, diffDays);
				document.getElementById("fineButton").style.display="none";
			
			
		}
		
		function printTotalCost(costoTotale, diffDays){
			
				var rowTableTotal=document.createElement("div");
				rowTableTotal.setAttribute("id", "rowTableTotal");
				rowTableTotal.setAttribute("class", "row p-2");
	  			document.getElementById("colTabellaGantt").appendChild(rowTableTotal);

				
				var tabella = document.createElement("table");
	  			tabella.setAttribute("id", "tabellaTotale");
	  			tabella.setAttribute("class", "tabellaHome");
	  			document.getElementById("rowTableTotal").appendChild(tabella);
	  			document.getElementById("tabellaTotale").style.width="50%";
	  			
	  			var thead= document.createElement("thead");
	  			thead.setAttribute("id", "theadTotale");
	  			thead.setAttribute("class", "head");
	  			document.getElementById("tabellaTotale").appendChild(thead);

	  			var trCol = document.createElement("tr");
	  			trCol.setAttribute("id", "trColTotale");
	  			document.getElementById("theadTotale").appendChild(trCol);
	  			
	  			var thPrezzoTotale = document.createElement("th");
	  			thPrezzoTotale.setAttribute("id", "thTotale");
	  			document.getElementById("trColTotale").appendChild(thPrezzoTotale);
	  			var textNode=document.createTextNode("Prezzo Totale");
	  			document.getElementById("thTotale").appendChild(textNode)
	  			
	  			var thGiorniTotali = document.createElement("th");
	  			thGiorniTotali.setAttribute("id", "thGiorniTotali");
	  			document.getElementById("trColTotale").appendChild(thGiorniTotali);
	  			var textNode=document.createTextNode("Giorni Totali");
	  			document.getElementById("thGiorniTotali").appendChild(textNode)
	  			
	  			var tbody= document.createElement("tbody");
				tbody.setAttribute("id", "tbodyTotale");
				tbody.setAttribute("class", "body");
				document.getElementById("tabellaTotale").appendChild(tbody);
			
				var trRow = document.createElement("tr");
				trRow.setAttribute("id", "trRowTotale");
				document.getElementById("tbodyTotale").appendChild(trRow);
			
	  			var tdPrezzoTotale = document.createElement("td");
	  			tdPrezzoTotale.setAttribute("id", "tdTotale");
	  			var textNodePrezzoTotale = document.createTextNode(costoTotale);
	  			tdPrezzoTotale.appendChild(textNodePrezzoTotale);
	  			document.getElementById("trRowTotale").appendChild(tdPrezzoTotale);
	  			
	  			var tdGiorniTotali = document.createElement("td");
	  			tdGiorniTotali.setAttribute("id", "tdGiorniTotali");
	  			var textNodeGiorniTotali = document.createTextNode(diffDays);
	  			tdGiorniTotali.appendChild(textNodeGiorniTotali);
	  			document.getElementById("trRowTotale").appendChild(tdGiorniTotali);
		}
		
		function validate(){
			
			var	nomeTaskValue = document.getElementById("nomeTask").value;
			var nomeCandidatoValue = document.getElementById("candidatoNameInput");
			var initialDateValue = document.getElementById("initialDate").value;
			var endDateValue = document.getElementById("endDate").value;
			if (nomeTaskValue !== "" &&
				nomeCandidatoValue!== null &&
				initialDateValue !== "" &&
				endDateValue !== ""
				){
				aggiungiCandidato();
				document.getElementById("nomeCandidato").disabled=false;
				return true;
				  }
			else{
				$('#errorModal').modal('toggle');   
				document.getElementById("errorModalBody").innerHTML ="compila tutti i campi e scegli il candidato";  
				return false;
			}
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