<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <link rel="shortcut icon" href="images/favicon.png" type="">

  <title> Poliklinik Kartini</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/med_logo1.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/med_logo1.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/med_logo1.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/med_logo1.png">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/med_logo1.png">
    <meta name="theme-color" content="#ffffff">


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="assets/css/theme.css" rel="stylesheet" />

</head>

<body>
  <main class="main" id="top">

    <!-- header section strats -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
          <div class="container"><a class="navbar-brand" href="index.html"><img src="img/gallery/med_logo1crop.png" width="150" alt="logo" /></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
            <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
              <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base">
                <li class="nav-item px-2"><a class="nav-link" aria-current="page" href="index.php">Beranda</a></li>
                <li class="nav-item px-2"><a class="nav-link" href="index.php?page=login-dokter">Dokter</a></li>
                <li class="nav-item px-2"><a class="nav-link" href="index.php?page=register-pasien">Pasien</a></li>
                <li class="nav-item px-2"><a class="nav-link" href="index.php?page=login-admin">Admin </a></li>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
    <!-- slider section -->

    <!-- end slider section -->
  

  <!-- Halaman Beranda diletakkan di beranda.php -->

  <script src="vendors/@popperjs/popper.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.min.js"></script>
  <script src="vendors/is/is.min.js"></script>
  <script src="https://scripts.sirv.com/sirvjs/v3/sirv.js"></script>
  <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
  <script src="vendors/fontawesome/all.min.js"></script>
  <script src="assets/js/theme.js"></script>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fjalla+One&amp;family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100&amp;display=swap" rel="stylesheet">
</body>

<?php 
if (isset($_GET['page'])){
  if($_GET['page']=='login-admin'){
    include('login_admin.php');
  }
  else if($_GET['page']=='register-admin'){
    include('register_admin.php');
  }
  else if($_GET['page']=='login-dokter'){
    include('login_dokter.php');
  }
  else if($_GET['page']=='register-dokter'){
    include('register_dokter.php');
  }
  else if($_GET['page']=='register-pasien'){
    include('register_pasien.php');
  }
}
else {
  include('beranda.php');
}
?>
</html>