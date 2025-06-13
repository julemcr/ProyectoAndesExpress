<!-- -->
  <!DOCTYPE html>
  <html>

  <head lang="es">
    <?php
    require_once("../MainHead/head.php")
    ?>
    <title>Inicio - Sistema </title>
  </head>

  <body class="sidebar-mini control-sidebar-slide-open layout-navbar-fixed layout-fixed sidebar-mini-xs sidebar-mini-md sidebar-collapse">

    <div class="wrapper">

      <?php require_once("../MainHeader/header.php") ?>

      <?php require_once("../MainNav/nav.php") ?>

      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
                <h1>Inicio</h1>
              </div>
              <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                  <li class="breadcrumb-item active">Inicio</li>
                </ol>
              </div>
            </div>
          </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-6">
              <div class="card shadow">
                <div class="card-header">
                  <h3 class="card-title"><i class="fa fa-users"></i> Listado de Clientes</h3>
                </div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-12">
                      <div class="row">
                        <div class="col-md-3">
                          <button type="button" class="btn btn-primary btn-block" id="btnNuevoCliente" data-toggle="modal" data-target="#ModalCliente"><i class="fa fa-plus"></i> Nuevo Cliente</button>
                        </div>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="table-responsive">
                        <table class="table table-striped table-bordered" id="tblClientes" style="width: 100%;">
                          <thead>
                            <tr>
                              <th scope="col"></th>
                              <th scope="col">#</th>
                              <th scope="col">Cliente</th>
                              <th scope="col">Tipo Doc.</th>
                              <th scope="col">Nro Doc.</th>
                              <th scope="col">Correo.</th>
                              <th scope="col">Telefono.</th>
                            </tr>
                          </thead>
                          <tbody>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card shadow">
                <div class="card-header">
                  <h3 class="card-title"><i class="fa fa-list"></i> Listado de Vehiculos Clientes</h3>
                </div>
                <div class="card-body">
                  <div class="col-12">
                    <div class="row">
                      <div class="col-md-3 align-self-end">
                        <button type="button" class="btn btn-info btn-block" id="btnNuevoVehiculo" data-toggle="modal" data-target="#ModalVehiculo"><i class="fa fa-plus"></i> Nuevo Vehiculo</button>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="table-responsive">
                      <table class="table table-striped table-bordered" id="tblvehiculos">
                        <thead>
                          <tr>
                            <th scope="col"></th>
                            <th scope="col">#</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">Nro. Doc</th>
                            <th scope="col">Placa</th>
                            <th scope="col">Tipo Veh.</th>
                            <th scope="col">Obs.</th>
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- /.content -->

      </div>

    </div>

    <div class="modal fade" id="ModalCliente" tabindex="-1" aria-labelledby="ModalClienteLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <form action="#" id="frmcliente">          
            <div class="modal-header">
              <h5 class="modal-title" id="titulomodalcliente">Crear Cliente</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <input type="hidden" name="IdCliente" id="IdCliente" value="0">
              <div class="form-group">
                <label for="idTipoDocumento">Tipo Documentoe</label>
                <select class="form-control" id="idTipoDocumento" name="idTipoDocumento" required>
                  <option value="">Seleccione Tipo Documento</option>
                  <option value="1">DNI</option>
                  <option value="2">RUC</option>
                </select>
              </div>
              <div class="form-group">
                <label for="NroDocumento">Número Documento:</label>
                <input type="text" class="form-control" name="NroDocumento" id="NroDocumento" placeholder="Ingrese el número" required>
              </div>
              <div class="form-group">
                <label for="NombreCliente">Nombre del Cliente</label>
                <input type="text" class="form-control" name="NombreCliente" id="NombreCliente" placeholder="Ingrese el nombre del cliente" required>
              </div>
              <div class="form-group">
                <label for="DireccionCliente">Dirección Cliente</label>
                <input type="text" class="form-control" name="DireccionCliente" id="DireccionCliente" placeholder="Ingrese Dirección del cliente" required>
              </div>
              <div class="form-group">
                <label for="Telefono">Telefono Cliente</label>
                <input type="text" class="form-control" name="Telefono" id="Telefono" placeholder="Ingrese el Telefono del cliente" required>
              </div>
              <div class="form-group">
                <label for="Correo">Correo Cliente</label>
                <input type="email" class="form-control" name="Correo" id="Correo" placeholder="Ingrese el Correo del cliente" required>
              </div>
              <div class="form-group">
                <label for="Observaciones">Observaciones</label>
                <input type="text" class="form-control" name="Observaciones" id="Observaciones" placeholder="Ingrese el Observaciones del cliente">
              </div>
              <div class="form-group d-none" style="display: none;">
                <label for="Estado">Estado</label>
                <select name="Estado" id="Estado" class="form-control" required>
                  <option value="1" selected>Activo</option>
                  <option value="0">Inactivo</option>
                </select>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
              <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <div class="modal fade" id="ModalVehiculo" tabindex="-1" aria-labelledby="ModalVehiculoLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <form action="#" id="frmvehiculo">          
            <div class="modal-header">
              <h5 class="modal-title" id="titulomodalvehiculo">Crear Vehiculo</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <input type="hidden" name="IdVehiculo" id="IdVehiculo" value="0">              
              <div class="form-group">
                <label for="NombreCliente">Cliente:</label>
                <select name="IdClienteV" id="IdClienteV" class="form-control" required></select>
              </div>
              <div class="form-group">
                <label for="IdMarca">Marca</label>
                <select class="form-control" id="IdMarca" name="IdMarca" required>
                  <option value="">Seleccione Marca</option>
                  <option value="1">Toyota</option>
                  <option value="2">Kia</option>
                  <option value="3">Hyundai</option>
                  <option value="4">Nissan</option>
                  <option value="5">Chevrolet</option>
                  <option value="6">Suzuki</option>
                  <option value="7">Volkswagen</option>
                  <option value="8">Mitsubishi</option>
                  <option value="9">Ford</option>
                  <option value="10">Renault</option>
                </select>
              </div>
               <div class="form-group">
                <label for="IdTipoVehiculo">Tipo Vehículo:</label>
                <select class="form-control" id="IdTipoVehiculo" name="IdTipoVehiculo" required>
                  <option value="">Seleccione Tipo Vehículo</option>
                  <option value="1">SEDÁN</option>
                  <option value="2">SUV</option>
                  <option value="4">STATION WAGON</option>
                  <option value="5">PICK UP</option>
                  <option value="6">MICROBÚS</option>
                  <option value="7">MINIBÚS</option>
                  <option value="8">MOTOCICLETA</option>
                  <option value="9">MOTO TODO TERRENO</option>
                  <option value="10">FURGÓN</option>
                  <option value="11">CUATRIMOTO</option>
                  <option value="12">BICIMOTO</option>
                  <option value="13">OTROS USOS ESPECIALES</option>
                </select>
              </div>
              <div class="form-group">
                <label for="PlacaVehiculo">Placa Vehiculo:</label>
                <input type="text" class="form-control" name="PlacaVehiculo" id="PlacaVehiculo" placeholder="Ingrese el nombre del cliente" required>
              </div>
              <div class="form-group">
                <label for="PlacaNueva">Placa Nueva:</label>
                <input type="text" class="form-control" name="PlacaNueva" id="PlacaNueva" placeholder="Ingrese Dirección del cliente">
              </div>
              <div class="form-group">
                <label for="ObservacionesV">Observaciones</label>
                <input type="text" class="form-control" name="ObservacionesV" id="ObservacionesV" placeholder="Ingrese el Observaciones del cliente">
              </div>
              <div class="form-group d-none" style="display: none;">
                <label for="EstadoV">Estado</label>
                <select name="EstadoV" id="EstadoV" class="form-control" required>
                  <option value="1" selected>Activo</option>
                  <option value="0">Inactivo</option>
                </select>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
              <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <?php require_once("../MainJs/mainjs.php") ?>    
    <script src="Home.js"></script>
  </body>

  </html>
