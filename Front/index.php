<?php
require_once("config/conexion.php");
if (isset($_SESSION["CodEmpleado"]) AND isset($_SESSION["vgcodEmpresa"]) AND isset($_SESSION["vgCodCaja"])) {
    header('Location: view/Home');
}else{
    header('Location: view/Login');
}
?>