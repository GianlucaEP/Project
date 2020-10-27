<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Welcome</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- CSS Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;1,200&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<style>
html, body, header {
	height: 100%;
}

img {
	height: 50%;
	width: 50%;
	transition: 0.5s;
}

img:hover {
	width: 68%;
	opacity: 1;
	transition: 0.5s;
}

#colonna-telco {
	background-color: #490a09;
	transition: 0.5s;
}

#colonna-ict {
	background-color: #145667;
	transition: 0.5s;
	border-right: 1px solid white;
	border-left: 1px solid white;
}

#colonna-ingegneria {
	background-color: #945805;
	transition: 0.5s;
}
</style>

</head>
<body>
	<header>
		<div class="container-fluid h-100">
			<div class="row h-100">
				<!-- Telco -->
				<div id="colonna-telco" class="col">
					<div class="row h-100 align-items-center">
						<div class="col text-center">
							<a href="/ProgettoHR/Home/Telco"><img
								onmouseover="changeColorBg('#7f1210', 'colonna-telco')"
								onmouseleave="changeColorBg('#490a09', 'colonna-telco')"
								src="/ProgettoHR/img/errelab.png"></a>
						</div>
					</div>
				</div>

				<!-- ICT -->
				<div id="colonna-ict" class="col">
					<div class="row h-100 align-items-center">
						<div class="col text-center">
							<a href="/ProgettoHR/Home/ICT"><img
								onmouseover="changeColorBg('#1e8199', 'colonna-ict')"
								onmouseleave="changeColorBg('#145667', 'colonna-ict')"
								src="/ProgettoHR/img/errepro.png"></a>
						</div>
					</div>
				</div>

				<!-- Ingegneria -->
				<div id="colonna-ingegneria" class="col">
					<div class="row h-100 align-items-center">
						<div class="col text-center">
							<a href="/ProgettoHR/Home/Engineering"><img
								onmouseover="changeColorBg('#f69309', 'colonna-ingegneria')"
								onmouseleave="changeColorBg('#945805', 'colonna-ingegneria')"
								id="techImg" src="/ProgettoHR/img/erretechnologygroup.png"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<script type="text/javascript">
		function changeColorBg(color, id) {
			document.getElementById(id).style.background = color
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
</body>
</html>