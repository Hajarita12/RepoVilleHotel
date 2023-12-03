<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Villes</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous">

    <!-- Custom Styles -->
    <style>
/* Styles spécifiques pour la boîte de dialogue de suppression (SweetAlert2) */
 

    
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
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container-form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .table-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table-container table {
            width: 100%;
        }

        .table-container th,
        .table-container td {
            text-align: center;
            padding: 15px;
        }

        .table-container th:first-child,
        .table-container td:first-child {
            text-align: left;
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

    <main class="container">
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

        <div class="container-form mb-4">
       
    </br></br>
            <form action="VilleController?op=add" method="post" onsubmit="return validateForm()">
                <div class="row mx-auto">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Nom de la ville" name="ville" value="">
                        <input type="text" name="id" value="" hidden />
                    </div>
                    <div class="col">
                        <input type="submit" class="btn btn-primary btn-custom" value="Ajouter" name="valider" />
                    </div>
                </div>
            </form>
        </div>

        <div class="table-container">
            <h1 class="text-center mb-3">Liste des villes</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Nom</th>
                        <th scope="col">Supprimer</th>
                        <th scope="col">Modifier</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${villes}" var="v">
                        <tr>
                            <td>${v.nom}</td>
                            <td><button type="button" class="btn btn-outline-danger btn-outline-custom"
                                    onclick="confirmDelete('${v.id}')">Supprimer</button></td>
                            <td><button type="button" class="btn btn-outline-warning btn-outline-custom"
                                    onclick="updateCity('${v.id}', '${v.nom}')">Modifier</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </main>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>

    <script>
        function refreshCities() {
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "/VilleController", true);
            xhttp.send();
        }

        window.onload = function () {
            refreshCities();
        };

        function validateForm() {
            var nom = document.getElementsByName("ville")[0].value;
            var valider = document.getElementsByName("valider")[0].value;
            var id = document.getElementsByName("id")[0].value;

            if (nom.trim() === '') {
                alert("Le champ Nom de ville ne peut pas être vide.");
                return false;
            }

            if (valider === "Modifier") {
                console.log(id);
                window.location.href = "VilleController?op=update&id=" + id
                    + "&ville=" + nom;
                ;
                return false;
            } else if (valider === "Ajouter") {
                return true;
            }
            return false;
        }

        function updateCity(id, nom) {
            document.getElementsByName("ville")[0].value = nom;
            document.getElementsByName("id")[0].value = id;
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
                window.location.href = 'VilleController?op=delete&id=' + id;
              }
            });
          }

    </script>

</body>

</html>
