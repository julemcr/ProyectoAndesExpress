<!-- jQuery -->
    <script src="../../public/js/lib/jquery/jquery-3.7.1.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="../../public/plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../public/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- bs-custom-file-input -->
    <script src="../../public/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
    <!-- Select2 -->
    <script src="../../public/plugins/select2/dist/js/select2.min.js"></script>
    <!-- ChartJS -->
    <script src="../../public/plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="../../public/plugins/sparklines/sparkline.js"></script>
    <!-- JQVMap -->
    <script src="../../public/plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="../../public/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="../../public/plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- MomentJS -->
    <script src="../../public/plugins/moment/moment.min.js"></script>
    <script src="../../public/plugins/moment/locales.min.js"></script>
    <!-- daterangepicker -->
    <script src="../../public/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- fullCalendar 2.2.5 -->
    <script src="../../public/plugins/fullcalendar/main.js"></script>
    <script src="../../public/plugins/fullcalendar/locales/es.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->

    <script src="../../public/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="../../public/plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="../../public/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../public/js/adminlte.js"></script>
    <!-- SweetAlert2 -->
    <script src="../../public/plugins/sweetalert2/dist/sweetalert2.all.min.js"></script>
    <!-- xlsx.js -->
    <script src="../../public/plugins/xlsx/jszip.js"></script>
    <script src="../../public/plugins/xlsx/xlsx.js"></script>

    <!-- DataTables -->
    <script src="../../public/plugins/datatables2/datatables.min.js"></script>
    <!-- <script src="../../public/plugins/datatables/datatables.min.js"></script>
    <script src="../../public/plugins/datatables/Buttons-1.7.0/js/dataTables.buttons.min.js"></script> -->

    <!-- Toastr -->
    <script src="../../public/plugins/toastr/toastr.min.js"></script>
    <!-- Bootbox -->
    <script src="../../public/plugins/bootbox/bootbox.all.min.js"></script>
    <!-- date-range-picker -->
    <script src="../../public/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap color picker -->

    <script src="../../public/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Bootstrap Switch -->

    <script src="../../public/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <!-- BS-Stepper -->
    <script src="../../public/plugins/bs-stepper/js/bs-stepper.min.js"></script>

    <!-- Dropzone -->
    <!-- <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script> -->
    <script src="../../public/plugins/dropzone/dropzone.js"></script>

    <!-- FancyBox -->
    <script src="../../public/plugins/fancybox/dist/fancybox/fancybox.umd.js"></script>

    <!-- bootstrap color picker -->
    <script src="../../public/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>

    <!-- <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script> -->
    <script>
        /// TODO: Abrir menus y dar estilo actiado al modulo del menu izquierdo
        var nomview = window.location.pathname.split('/')
        var url = window.location.href;
        var pathname = window.location.pathname;

        $("input[data-bootstrap-switch]").each(function(){
            $(this).bootstrapSwitch('state', $(this).prop('checked'));
        })

        $(`#${nomview[3]}`).addClass("active")
        //console.log(nomview,Padrelink,Ppadrelink)
        if(nomview[4] == null || nomview[4] == ""){}else{
            var Padrelink = document.getElementById(nomview[3]).parentNode.parentNode.parentNode;
            var Ppadrelink = document.getElementById(nomview[3]).parentNode.parentNode.parentNode.parentNode.parentNode;
            Padrelink.classList.add("menu-is-opening", "menu-open");
            Ppadrelink.classList.add("menu-is-opening", "menu-open");
        }

        window.addEventListener("DOMContentLoaded", () => {
            $(document).resize();
            // console.log('sistema cargado 100%')
            if(nomview[3] != 'Login'){
                //GetTipoCambioSunat()
                // ValidarSession()
                // ActualizarUrlUltimaSession(url)
            }            
            
            if (!$(".modal.in").length) {
                $(".modal-dialog").css({
                    top: 0,
                    left: 0,
                });
            }

            $(".modal-dialog").draggable({
                cursor: "move",
                handle: ".dragable_touch",
            });
        });

        // TODO: Captura evento del click en cualquier parte del DOM
        window.addEventListener("click", () => {
            //$(document).resize();
            if(nomview[3] != 'Login'){
                //GetTipoCambioSunat()
                //ValidarSession()
            }
        });
        
        function ActivarDesactivarLoader(activar,mensaje) {
            if(activar){
                if(mensaje === '' || mensaje === null){
                    $("#textpreloader").html('').hide()
                }else{
                    $("#textpreloader").html(mensaje).show()
                }
                $(".preloader ").css({"height": "100%"});
                $(".preloader ").show()
                $(".iconloader").show()
                $(".animation__shake").show()
            }else{
                $("#textpreloader").html('').hide()
                $(".preloader ").fadeOut()
                $(".iconloader").fadeOut()
                $(".animation__shake").fadeOut()
                $(".preloader ").css({"height": "0px"});
            }
        }

        Fancybox.bind("[data-fancybox]", {}); //ACTIVAR TODOS LOS FANCYBOX IAMGENES TIPO GALERIA

        // Función para obtener el nombre del mes
        function obtenerNombreMes(numeroMes) {
            var meses = ["ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"];
            return meses[numeroMes];
        }

        function obtenerNumeroMes(numeroMes) {
            numeroMes = numeroMes + 1
            return numeroMes.toString().padStart(2, '0');
        }

        // Función para obtener el número de días del mes
        function obtenerNumDiasMes(numeroMes, año) {
            return new Date(año, numeroMes + 1, 0).getDate();
        }

        $(document).on('select2:open', (e) => {
            document.querySelector('.select2-search__field').focus();
        });
    </script>
    
    <?php require_once("../MainFooter/footer.php") ?>