
<!DOCTYPE html>
<html>

<head lang="es">
  <?php
  require_once("../MainHead/head.php");  
  ?>
    <title>Login</title>
</head>

<body class="hold-transition login-page bg-login">

  <div class="login-box">
    <div class="login-logo">
      <a href="../Home/" class="h6">
        <!-- <b id="diaactual"></b> -->
        <!-- <img src="../../public/img/logo-1.png" alt="Logo Empresa" class="img-fluid" id="logoempresa"> -->
      </a>
    </div>
    <!-- /.login-logo -->
    <div class="card card-outline card-primary">
      <div class="card-header text-center">
        <a href="../Login/" class="h3">SISTEMA ESTACIONAMIENTO</a>
      </div>
      <div class="card-body">
        <p class="login-box-msg">Iniciar Sesión</p>
        <form id="login_form">
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Usuario" id="cod_user" name="cod_user" value="demo" required>
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-user"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Password" id="clave_acceso" name="clave_acceso" value="123" required>
            <div class="input-group-append">
              <button type="button" class="input-group-text" id="btnmostrarocultarpass">
                <span class="fas fa-eye" id="iconinputpass"></span>
              </button>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-sign-in-alt"></i> Acceder</button>
              <hr>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <?php require_once("../MainJs/mainjs.php") ?>
  <script src="login.js"></script>
</body>
</html>
