<%@page import="entities.Hotel"%>
<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

<script>
        function refreshCities() {
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "/HotelController", true);
            xhttp.send();
        }

        window.onload = function () {
            refreshCities();
        };

        function validateForm() {
            var nom = document.getElementsByName("nom")[0].value;
            var adresse = document.getElementsByName("adresse")[0].value;
            var numero = document.getElementsByName("numero")[0].value;
            var valider = document.getElementsByName("valider")[0].value;
            var ville = document.getElementsByName("ville")[0].value;
            var id = document.getElementsByName("id")[0].value;

            if (nom.trim() === '' && adresse.trim() === '' && numero.trim() === '' && ville.trim() === '') {
                alert("Les champs ne peut pas être vide.");
                return false;
            }

            if (valider === "Modifier") {
                console.log(id);
                window.location.href = "HotelController?op=update&id=" + id
                    + "&nom=" + nom + "&adresse=" + adresse + "&ville=" + ville + "&numero=" + numero;
                ;
                return false;
            } else if (valider === "Ajouter") {
                return true;
            }
            return false;
        }

        function updateCity(id, nom, adresse, numero, ville) {
            document.getElementsByName("nom")[0].value = nom;
            document.getElementsByName("id")[0].value = id;
            document.getElementsByName("adresse")[0].value = adresse;
            document.getElementsByName("numero")[0].value = numero;
            document.getElementsByName("ville")[0].value = ville;
            document.getElementsByName("valider")[0].value = "Modifier";
        }
        
        function confirmDelete(id) {
            Swal.fire({
                title: 'Confirmation de suppression',
                text: 'Êtes-vous sûr de vouloir supprimer cette ville ?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Oui, supprimer',
                cancelButtonText: 'Annuler'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'HotelController?op=delete&id=' + id;
                }
            })
        }

    </script>
<style type="text/css">
  .navbar {
            background-color: #FF69B4; /* Couleur bleue pour la navbar */
        }

        .navbar-brand,
        .navbar-nav .nav-link {
            color: #ffffff; /* Couleur du texte blanc pour les liens et le texte de la navbar */
        }

        .navbar-brand:hover,
        .navbar-nav .nav-link:hover {
            color: #ffffff; /* Couleur du texte blanc pour les liens et le texte de la navbar au survol */
        }
@media ( min-width : 991.98px) {
	main {
		padding-left: 240px;
	}
}

/* Sidebar */
.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	padding: 58px 0 0; /* Height of navbar */
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 5%), 0 2px 10px 0 rgb(0 0 0/ 5%);
	width: 300px;
	z-index: 600;
}

@media ( max-width : 991.98px) {
	.sidebar {
		width: 100%;
	}
}

.sidebar .active {
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 16%), 0 2px 10px 0 rgb(0 0 0/ 12%);
}

.sidebar-sticky {
	position: relative;
	top: 0;
	height: calc(100vh - 48px);
	padding-top: 0.5rem;
	overflow-x: hidden;
	overflow-y: auto;
	/* Scrollable contents if viewport is shorter than content. */
}
 .btn-custom {
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .btn-primary {
            background: linear-gradient(to right, #ff66b2, #800080); /* Dégradé de rose à mauve */
            color: #fff;
        }

        .btn-danger {
            background: linear-gradient(to right, #ff3333, #ff0000); /* Dégradé de rose à rouge */
            color: #fff;
        }

        .btn-warning {
            background: linear-gradient(to right, #ffcc00, #ff6600); /* Dégradé de jaune à orange */
            color: #fff;
        }

        .btn-outline-custom {
            color: #fff;
            background: linear-gradient(to right, #ff66b2, #800080); /* Dégradé de rose à mauve */
            border: 2px solid #ff66b2;
            transition: all 0.3s;
        }

        .btn-outline-custom:hover {
            color: #ff66b2;
            background-color: #fff;
        }
</style>
</head>
<body>


	<main style="margin-top: 58px;">
	<nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="HotelController">Gestion Hotels</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="VilleController">Gestion Villes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="HotelVilleController">Liste des Hotels par ville</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
		<div class="container border mt-4 py-4">
	 
    </br></br>
		
			<form action="HotelController?op=add" class="mb-4"
				onsubmit="return validateForm()" method="post">
				<div class="row mb-3">
					<div class="col">
					<label>Nom d'hotel:</label>
						<input type="text" class="form-control" 
							name="nom" value=""> <input type="text" name="id"
							value="" hidden />
					</div>
					<label>Adresse d'hotel:</label>
					<div class="col">
						<input type="text" class="form-control"
							 name="adresse" value="">
					</div>
				</div>
				<label>Numero de telephone d'hotel:</label>
				<div class="row mb-3">
					<div class="col">
						<input type="text" class="form-control"
							 name="numero" value="">
					</div>
					<div class="col">
					
						<select class="form-select" aria-label="Default select example"
							name="ville">
							<option selected value="">Sélectionner une ville</option>

							<c:forEach items="${villes}" var="v">
								<option value="${v.id}">${v.nom}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="row justify-content-end">
					<div class="col">
						<input type="submit" class="btn btn-primary" value="Ajouter"
							name="valider" />
					</div>
				</div>
			</form>

			<h1 class="text-center mb-3">Liste des hotels</h1>

			<table class="table table-striped">
				<thead>
					<tr>
						
						<th scope="col">Nom</th>
						<th scope="col">Adresse</th>
						
						<th scope="col">Ville</th>
						<th scope="col">Supprimer</th>
						<th scope="col">Modifier</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${hotels}" var="v">
						<tr>
							
							<td>${v.nom}</td>
							<td>${v.adresse}</td>
							
							<td>${v.ville.nom}</td>
							
							<td><button type="button"  class="btn btn-outline-danger btn-outline-custom"
									onclick="confirmDelete('${v.id}')">Supprimer</button></td>
							<td><button type="button"  class="btn btn-outline-warning btn-outline-custom"
									onclick="updateCity('${v.id}', '${v.nom}', '${v.adresse}', '${v.telephone}', '${v.ville.id}')">Modifier</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>
