<footer class="main-footer">
  <div class="float-right d-none d-sm-block">
    <b>Version</b> 1.0.0
  </div>

  <strong>Copyright © <?php echo date('Y'); ?> 
    <a href="https://www.lubriseng.com.pe/" target="_blank">
      <?php    

        if(isset($_SESSION['vgEmpresa'] )){
          echo  $_SESSION['vgEmpresa'];
        }else{
          echo 'Julem Cabanillas Ramirez';
        }
      ?>
    </a>.
  </strong> Todos los derechos reservados.
  <!-- <strong>Copyright © <?php echo date('Y'); ?> <a href="#">Julem Cabanillas</a>.</strong> Todos los derechos reservados. -->
</footer>