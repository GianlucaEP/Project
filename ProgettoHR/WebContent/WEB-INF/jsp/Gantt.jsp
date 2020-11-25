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
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<style>
* {
	font-family: 'Poppins', sans-serif;
}

body, html {
	height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	background-attachment: fixed;
	background-image: url("/ProgettoHR/img/Home1.jpg");
}

#img-logo {
	position: relative;
	height: 80px;
	left: 230px;
	transition: left .5s;
}

#btn-nav {
	border: 1px solid white;
	border-radius: 5px;
	height: 45px;
	background-color: white;
}

#btn-logout, #btn-home {
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

.tabellaGantt {
	width: 100%;
	font-size: 0.9em;
	border-collapse: collapse;
	border-radius: 5px 5px 0px 0px;
	overflow: hidden;
}

.tabellaGantt .head {
	background-color: white;
	color: black;
	text-align: center;
	letter-spacing: 5px;
	border-bottom: 2px solid black;
}

.tabellaGantt .body {
	background-color: #f8f9fa;
}

.tabellaGantt  .body tr {
	text-align: center;
	border-bottom: 1px solid white;
	color: black;
	letter-spacing: 3px;
	transition: 0.5s;
}

.tabellaGantt  th {
	padding: 10px;
}

.tabellaGantt td {
	font-size: 14px;
	padding: 4px;
}

.tabellaGantt .footer {
	background-color: white;
}

#fineButton {
	visibility: hidden;
}

#colonnaForm {
	background: white;
	border-radius: 5px;
	padding: 20px;
}

#colonnaNavbar {
	padding: 0;
}

#colonnaSidebar {
	padding-left: 0;
}

#chart_div {
	overflow-x: scroll;
	overflow-y: hidden;
	height: 200px;
	display: none;
}

#modalTableCand {
	width: 90%;
	max-width: 1200px;
}

#candModal {
	overflow-x: auto;
}
</style>

</head>

<body>

	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<div class="row w-100">
				<div id="btn-nav" class="d-flex flex-row">
					<div class="col-auto align-self-center">
						<button class="btn"
							onclick="location.href = '/ProgettoHR/Home/${businessUnit}';"
							id="btn-home">
							<i class="fas fa-home"></i>
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

	<div class="container-fluid">
		<div id="colonnaBarraLaterale" class="row">
			<div id="colonnaForm" class="col-2 mt-5 ml-3">
				<form>
					<div class="form-group">
						<label for="exampleFormControlInput1">Task:</label> <input
							type="text" class="form-control" id="nomeTask">
					</div>
					<div id="divNomeCandidato" class="form-group mb-3">
						<label>Candidato:</label>
						<div class="form-group">
							<input type="button" id="nomeCandidato" class="btn btn-primary"
								value="Scegli candidato" data-toggle="modal"
								data-target="#candModal">
						</div>
					</div>

					<div class="form-group">
						<label for="exampleFormControlInput2">Data d'inizio:</label> <input
							type="date" pattern="dd-MM-yyyy" class="form-control"
							id="initialDate">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput3">Data di fine:</label> <input
							type="date" pattern="dd-MM-yyyy" class="form-control"
							id="endDate">
					</div>

					<div class="form-group">
						<button class="btn btn-primary mt-3" type="reset"
							onClick="return validate();" id="aggiungiButton">Aggiungi</button>

					</div>
				</form>
			</div>

			<div class="col-8" id="colTabellaGantt">
				<div class="row" id="divCandidatoTemp"></div>

				<div class="row">
					<div class="col">
						<input type="button" class="btn btn-primary float-right mt-3" value="fine"
							onClick="endGantt()" id="fineButton">
					</div>
				</div>
				<div class="row">
					<div class="col m-3" id="chart_div"></div>
				</div>
			</div>
		</div>
	</div>


	<!-- modal candidato -->
	<div class="modal fade" id="candModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" id="modalTableCand" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="candidatoModalLabel">Seleziona un
						candidato:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body" id="candModal">
					<table class="tabellaGantt">
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


									<td><button id="aggiungi${cand.id}" type="button"
											class="btn btn-success"
											onclick="addCandidato(${cand.costo.giornaliero}, '${cand.nome}', '${cand.cognome}')">
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

	<!-- MODAL INVIO DATI -->
	<div class="modal fade" id="sendModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="errorModalLabel">Conferma</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="sendModalBody">
					Creare un Gantt con i dati inseriti?

					<form action="/ProgettoHR/ExcelGantt/${businessUnit}" method="POST">
						<div class="form-group" style="display: none">
							<input type="text" class="form-control" id="ganttData"
								name="data"> <input type="text" class="form-control"
								id="costData" name="costi"> <input type="text"
								class="form-control" id="daysData" name="days">
						</div>
						<button onclick="openLoadingModal()" id="inviaDati" type="submit"
							class="btn btn-primary">Invia</button>
					</form>


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

	<!-- MODAL CARICAMENTO -->
	<div class="modal fade" id="loadingModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="errorModalLabel">Gantt</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="errorModalBody">Download Excel
					Gantt in corso...</div>
				<div class="modal-footer">
					<button type="reset" id="bottone-cancella-specializzazione"
						class="btn btn-danger" data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
	function openLoadingModal(){
		$('#sendModal').modal('hide');
		$('#loadingModal').modal('show');
	}
	
	var countCandidatiGant=0;
	
		google.charts.load('current', {
			'packages' : [ 'timeline' ]
		});
		//google.charts.setOnLoadCallback(drawChart);

		function daysToMilliseconds(days) {
			return days * 24 * 60 * 60 * 1000;
		}

		function drawChart(arrayGantt, arrayGanttExcel, arrayCostiCandidato, diffDays) {

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
				document.getElementById("colTabellaGantt").className = "col-10";
				
			chart.draw(data, {
				 width: 1200
			});
			
			document.getElementById("ganttData").value = arrayGanttExcel;
			document.getElementById("costData").value = arrayCostiCandidato;
			document.getElementById("daysData").value = diffDays;
			
		}
		
		function addCandidato(costo, nome, cognome) {
		var divNomeCandidato= document.getElementById("divNomeCandidato");
		var tagDiv = document.createElement("div");		
		var tagInput = document.createElement("input");
		var tagDivButton = document.createElement("span");
		tagInput.value = nome + ' ' + cognome;
		tagInput.classList.add("form-control");
		
		tagDiv.classList.add("form-row");
		tagDiv.id="CandidatoTemporaneoGantt";
		
		var ColDiv1 = document.createElement("div");
			ColDiv1.classList.add("col-10");
			
		var ColDiv2 = document.createElement("div");
			ColDiv2.classList.add("col-2");
			tagInput.name = "candidato";
			tagInput.id="candidatoNameInput"
			tagInput.readOnly = true;
			
			tagDivButton.classList.add("btn");
			tagDivButton.style.margin = "0px 0px 10px 0px";
			tagDivButton.innerHTML = '<i id="iconaMeno" class="fa fa-minus"></i>';
			
			
			ColDiv1.appendChild(tagInput)
			tagDiv.appendChild(ColDiv1);
			
			ColDiv2.appendChild(tagDivButton)
			tagDiv.appendChild(ColDiv2);
			
			document.getElementById("divNomeCandidato").appendChild(tagDiv);
			
			

			var tagDivCosto = document.createElement("div");		
			var tagInputCosto = document.createElement("input");
			
			var tagInputRincaro = document.createElement("input");
		
			tagInputCosto.value = costo;
			
			
			tagInputCosto.classList.add("form-control");
			tagInputRincaro.classList.add("form-control");
			
			tagDivCosto.classList.add("form-row");

			var ColDiv1Costo = document.createElement("div");
			var ColDiv1Rincaro = document.createElement("div");
			
				ColDiv1Costo.classList.add("col-6");
				ColDiv1Rincaro.classList.add("col-6");

				tagInputCosto.name = "costo";
				tagInputCosto.id="costoInput"
				tagInputCosto.readOnly = true;
				
				tagInputRincaro.name = "rincaro";
				tagInputRincaro.id="rincaroInput"
				
				tagInputRincaro.setAttribute("type", "number");
				tagInputRincaro.setAttribute("max", "100");
				tagInputRincaro.setAttribute("min", "0");
				
				ColDiv1Costo.appendChild(tagInputCosto)
				tagDivCosto.appendChild(ColDiv1Costo);
				
				ColDiv1Rincaro.appendChild(tagInputRincaro)
				tagDivCosto.appendChild(ColDiv1Rincaro);
				
				document.getElementById("CandidatoTemporaneoGantt").appendChild(tagDivCosto);
			
				tagDivButton.onclick = function(){				              	              	          				
					tagDiv.remove();
					tagDivCosto.remove();
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
			var rincaroInput=document.getElementById("rincaroInput").value
			var prezzo=parseFloat(costoInput)+parseFloat((costoInput*(rincaroInput/100)).toFixed(2));
		
			var initialDateFormat=new Date(document.getElementById("initialDate").value)
			var endDateFormat=new Date(document.getElementById("endDate").value)
			var diffDays = 0;
			var diffTime = Math.abs(endDateFormat - initialDateFormat);
			var tempDiffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
			diffDays= diffDays+tempDiffDays;
			var parziale=(diffDays * prezzo).toFixed(2);
		
		
			
			
			var tagDiv = document.createElement("div");
			tagDiv.id="candidatoGantt"+countCandidatiGant;
			
			
			/*var divIdTask = document.createElement("div");
			divIdTask.id="idTask"+countCandidatiGant;
			divIdTask.innerHTML =idTask;*/
			
			//creo tabella
			//header tabella
			if (document.getElementById("tabellaCandidatiGantt")===null){
				
				//	var rowTable=document.createElement("div");
					//rowTable.setAttribute("id", "rowTable");
					//rowTable.setAttribute("class", "row p-2");
		  			//document.getElementById("divCandidatoTemp").appendChild(rowTable);
				
					var tabella = document.createElement("table");
		  			tabella.setAttribute("id", "tabellaCandidatiGantt");
		  			tabella.setAttribute("class", "tabellaGantt mt-5 ml-3");
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
		  			var textNode=document.createTextNode("Candidato");
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
		  			
		  			var thCost = document.createElement("th");
		  			thCost.setAttribute("id", "thCost");
		  			document.getElementById("trCol").appendChild(thCost);
		  			var textNode=document.createTextNode("cost");
		  			document.getElementById("thCost").appendChild(textNode);
		  			
		  			var thRincaro = document.createElement("th");
		  			thRincaro.setAttribute("id", "thRincaro");
		  			document.getElementById("trCol").appendChild(thRincaro);
		  			var textNode=document.createTextNode("rincaro");
		  			document.getElementById("thRincaro").appendChild(textNode);
		  			
		  			var thPrice = document.createElement("th");
		  			thPrice.setAttribute("id", "thPrice");
		  			document.getElementById("trCol").appendChild(thPrice);
		  			var textNode=document.createTextNode("price");
		  			document.getElementById("thPrice").appendChild(textNode);
		  			
		  			var thParziale = document.createElement("th");
		  			thParziale.setAttribute("id", "thParziale");
		  			document.getElementById("trCol").appendChild(thParziale);
		  			var textNode=document.createTextNode("parziale");
		  			document.getElementById("thParziale").appendChild(textNode)
		  			
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
  			
  			//body tabella
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
  			
  			var tdCost = document.createElement("td");
  			tdCost.setAttribute("id", "tdCost"+countCandidatiGant);
  			var textNodetdCost= document.createTextNode(costoInput);
  			tdCost.appendChild(textNodetdCost);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdCost);
  			
  			var tdRincaro = document.createElement("td");
  			tdRincaro.setAttribute("id", "tdRincaro"+countCandidatiGant);
  			var textNodetdRincaro= document.createTextNode(rincaroInput+"%");
  			tdRincaro.appendChild(textNodetdRincaro);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdRincaro);
  			
  			var tdPrice = document.createElement("td");
  			tdPrice.setAttribute("id", "tdPrice"+countCandidatiGant);
  			var textNodetdPrice = document.createTextNode(prezzo);
  			tdPrice.appendChild(textNodetdPrice);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdPrice);
  			
  			var tdParziale = document.createElement("td");
  			tdParziale.setAttribute("id", "tdParziale"+countCandidatiGant);
  			var textParziale = document.createTextNode(parziale);
  			tdParziale.appendChild(textParziale);
  			document.getElementById("trRow"+countCandidatiGant).appendChild(tdParziale);
  			
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
			var arrayListCandidatiGanttExcel=[];
			var arrayCandidatoGanttExcel;
			var arraListCostiCandidati=[];


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
							arrayCandidatoGanttExcel=[
								document.getElementById("tdNomeTask"+i).innerHTML, 
								document.getElementById("tdCandidatoName"+i).innerHTML,
								document.getElementById("tdInitialDate"+i).innerHTML,
								document.getElementById("tdEndDate"+i).innerHTML
							]
							arrayCostiCandidato=[
								document.getElementById("tdCost"+i).innerHTML, 
								document.getElementById("tdRincaro"+i).innerHTML,
								document.getElementById("tdPrice"+i).innerHTML,
								document.getElementById("tdParziale"+i).innerHTML
							]
							
							arrayListCandidatiGantt.push(arrayCandidatoGantt.valueOf());
							
							arrayListCandidatiGanttExcel.push(arrayCandidatoGanttExcel.valueOf());
							
							arraListCostiCandidati.push(arrayCostiCandidato.valueOf())
							
							//arrayCandidatoGantt.splice(0, arrayCandidatoGantt.length);
							var diffTime = Math.abs(date2 - date1);
							var tempDiffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
							diffDays= diffDays+tempDiffDays;
							var costForDays=tempDiffDays*parseFloat(document.getElementById("tdPrice"+i).innerHTML)
							costoTotale=parseFloat(costoTotale+costForDays);
							
							var menoButtonTable=document.getElementById("menoButtonTable"+i);
							menoButtonTable.parentNode.removeChild(menoButtonTable);
							//document.getElementById("menoButtonTable"+i).style.visibility="hidden";
					
					if (document.getElementById("thRemove")!=null){
					
							thRemove.parentNode.removeChild(thRemove);
							}
					}
			}

			
			drawChart(arrayListCandidatiGantt, arrayListCandidatiGanttExcel, arraListCostiCandidati, diffDays);
			
			
	  			
	  			
				printTotalCost(costoTotale, diffDays);
				document.getElementById("fineButton").style.display="none";
			
			
		}
		
		function printTotalCost(costoTotale, diffDays){
			
				var rowTableTotal=document.createElement("div");
				rowTableTotal.setAttribute("id", "rowTableTotal");
				rowTableTotal.setAttribute("class", "row p-2");
	  			document.getElementById("colTabellaGantt").appendChild(rowTableTotal);
	  			
	  			var colTableTotal=document.createElement("div");
				colTableTotal.setAttribute("id", "colTableTotal");
				colTableTotal.setAttribute("class", "col ml-3");
	  			document.getElementById("rowTableTotal").appendChild(colTableTotal);

				
				var tabella = document.createElement("table");
	  			tabella.setAttribute("id", "tabellaTotale");
	  			tabella.setAttribute("class", "tabellaHome");
	  			document.getElementById("colTableTotal").appendChild(tabella);
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
	  			
				var tagDivCol = document.createElement("div");		
				var tagInput = document.createElement("input");
				var tagInputModal = document.createElement("input");
				
				tagDivCol.classList.add("col", "text-right", "align-self-end");
				
				tagInput.setAttribute("type", "button");
				tagInput.classList.add("btn", "btn-primary", "ml-2");
				
				tagInputModal.setAttribute("type", "button");
				tagInputModal.setAttribute("data-toggle", "modal");
				tagInputModal.setAttribute("data-target", "#sendModal");
				tagInputModal.classList.add("btn", "btn-primary");
				
				tagInput.onclick = function() {
					location.reload();
				}
				tagInput.value="Nuovo Gantt";
				
				tagInputModal.value="Stampa";
				tagInputModal.id="stampaButton"
				
				tagDivCol.appendChild(tagInputModal);
				tagDivCol.appendChild(tagInput);
				
				document.getElementById("rowTableTotal").appendChild(tagDivCol);
		}
		
		function validate(){
			
			var	nomeTaskValue = document.getElementById("nomeTask").value;
			var nomeCandidatoValue = document.getElementById("candidatoNameInput").value;
			var rincaroValue =  document.getElementById("rincaroInput").value;
			var initialDateValue = document.getElementById("initialDate").value;
			var endDateValue = document.getElementById("endDate").value;
			if (nomeTaskValue !== "" &&
				nomeCandidatoValue!== null &&
				rincaroValue !== "" &&
				initialDateValue !== "" &&
				endDateValue !== ""
				){
				if(initialDateValue > endDateValue){
					$('#errorModal').modal('toggle');   
					document.getElementById("errorModalBody").innerHTML ="Attenzione! La data di inizio deve essere minore della data di fine.";  
					return false;
				}
				
				if(isNaN(rincaroValue)){
					$('#errorModal').modal('toggle');   
					document.getElementById("errorModalBody").innerHTML ="Attenzione! Il valore nel campo rincaro deve essere numerico.";  
					return false;
				}
				
				if(rincaroValue<0 || rincaroValue > 100){
					$('#errorModal').modal('toggle');   
					document.getElementById("errorModalBody").innerHTML ="Attenzione! Il valore nel campo rincaro deve compreso tra 0 e 100.";  
					return false;
				}
				aggiungiCandidato();
				document.getElementById("nomeCandidato").disabled=false;
				return true;
				  }
			else{
				$('#errorModal').modal('toggle');   
				document.getElementById("errorModalBody").innerHTML ="Attenzione! Compila tutti i campi e scegli il candidato.";  
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