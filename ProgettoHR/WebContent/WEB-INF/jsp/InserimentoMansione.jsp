<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

</head>
<meta charset="ISO-8859-1">
<title>Inserimento Mansione</title>
</head>
<body>
	<div>
		<nav class="navbar navbar-dark bg-primary " style="opacity: 0.8; box-shadow: 10px 10px 5px grey;">
			<h1>
				<span class="navbar-text bg-primary text-white"> 
					<a href="/ProgettoHR/Home"><img
					alt="logo" src="/ProgettoHR/img/Erre_technology_group_NEW.png"
					
			class="col-4"></a>
				</span>
				
			</h1>

		</nav>
	</div>
	<div align="center" class="container-fluid ">
		<div class="row p-2 justify-content-md-center">
			<div class="col-auto p-2 border rounded">
				<h1>Inserimento Mansione</h1>
				<form:form modelAttribute="mansione" action="/ProgettoHR/MansioniSave" method="POST">
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<div class="form-group">
								<div class="row w-100 p-0 mb-2 justify-content-md-start">Mansione:</div>
								<form:input path="mansione" type="text" class="form-control" id="nome" name="nome"></form:input>
							</div>
						</div>
					</div>
					<div class="row w-100 p-2 justify-content-md-start">
						<div class="col w-100 p-0 justify-content-md-start">
							<button type="submit" class="btn btn-primary btn-block">Salva</button>
							<a href="/ProgettoHR/Home" class="btn btn-primary btn-block">Torna alla home</a>
							<button type="reset" class="btn btn-danger btn-block">Cancella</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>