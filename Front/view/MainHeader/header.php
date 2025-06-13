<?php 
    // TODO: VALIDAR MENU Y PERSMISO DE USUSARIO
    // $tienepermiso = false;

    // $rutaactual = basename(getcwd());

    // if(!isset($_SESSION['permisos'])){
    //     header('Location: '.Conectar::ruta().'Logout/logout.php');
    //     die();
    // }else{
    //     foreach ($_SESSION['permisos'] as $permiso) {
    //         if ($permiso['MenuIdentificador'] == $rutaactual) {
    //             $tienepermiso = true;
    //         }
    //     }
    // }

  
?>




<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-dark success border-bottom-0">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <span class="nav-link" id="tcambiolabel">Bienvenido - USUARIO DEMO</span>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="fas fa-user-cog"></i>
                <!-- <span class="badge badge-warning navbar-badge">15</span> -->
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">

                <!-- CODEMPLEADO/CODUSUARIO CREADO POR SESSION -->
                <input type="hidden" name="CodUsuario" id="CodUsuario" value="1">
                <input type="hidden" name="CodEmpleado" id="CodEmpleado" value="1">
                <input type="hidden" name="NomEmpleado" id="NomEmpleado" value="Usuario DEMO">

                <div class="dropdown-divider"></div>
                <!-- <a href="#" class="dropdown-item">
                    <i class="fas fa-address-card"></i> Perfil
                </a> -->
                <div class="dropdown-divider"></div>
                <a href="../Logout/logout.php" class="dropdown-item dropdown-footer"><i class="fas fa-sign-out-alt"></i> Cerrar Sessión</a>
            </div>
        </li>
    </ul>
</nav>
<!-- /.navbar -->