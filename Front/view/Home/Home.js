
function init() {

}


$(document).ready(function () {
    ComboCliente()
    ListarClientes();
    ListarVehiculosClientes(0)
});

function ComboCliente() {
    $.ajax({
        url: 'https://localhost:7121/api/clientes',
        type: 'GET',
        success: function (data) {
            $("#IdClienteV").empty(); // Limpiar opciones anteriores

            // Opción por defecto
            $("#IdClienteV").append(`<option value="">-- Seleccione --</option>`);

            // Recorrer y agregar opciones
            $.each(data, function (i, item) {
                console.log("Datos del combo cliente:", item);
                $("#IdClienteV").append(`<option value="${item.idCliente}">${item.nombreCliente}</option>`);
            });
        },
        error: function () {
            console.error("Error al cargar el select desde", url);
        }
    });
}

function ListarClientes(){
    tabla = $("#tblClientes").dataTable({
        "aProcessing": true,
        "aServerSide": true,
        // dom: 'Bfrtip',
        "searching": true,
        responsive: true,
        lengthChange: false,
        colReorder: true,
        autoWidth: false,
        buttons: ["csv", "excel", "pdf"],
        ajax: {
            url: 'https://localhost:7121/api/clientes', 
            dataSrc:""
        },
        columns: [ { data: null }, { data: 'idCliente' }, { data: 'nombreCliente' }, { data: 'tipoDocumento' }, { data: 'nroDocumento' }, { data: 'correo' }, { data: 'telefono' } ],
        columnDefs: [{
            targets: 0,
            orderable: false,
            className: 'text-center',
            createdCell: function(td, cellData, rowData, row, col) {
                $(td).html(`<div class="btn-group">
                                <button type="button" class="btn btn-danger btn-sm btnEliminarCliente" data-id="${rowData.idCliente}" data-toggle='tooltip' data-placement='top' title='Eliminar Cliente'><i class='fa fa-trash'></i></button>
                                <button type="button" class="btn btn-warning btn-sm btnEditarCliente text-white" data-id="${rowData.idCliente}" data-toggle='tooltip' data-placement='top' title='Editar Cliente'><i class='fa fa-edit'></i></button>
                                <button type="button" class="btn btn-primary btn-sm btnVehiculoCliente text-white" data-id="${rowData.idCliente}" data-toggle='tooltip' data-placement='top' title='Ver Vehiculos Cliente'><i class='fa fa-car'></i></button>
                            </div>`)

            }

        }, ],
        "bDestroy": true,
        "bInfo": true,
        "iDisplayLength": 10,
        "language":
        {
            "processing": "Procesando...",
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "emptyTable": "Ningún dato disponible en esta tabla",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "search": "Buscar:",
            "infoThousands": ",",
            "loadingRecords": "Cargando...",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            },
            "aria": {
                "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sortDescending": ": Activar para ordenar la columna de manera descendente"
            },
            "buttons": {
                "copy": "Copiar",
                "colvis": "Visibilidad",
                "collection": "Colección",
                "colvisRestore": "Restaurar visibilidad",
                "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
                "copySuccess": {
                    "1": "Copiada 1 fila al portapapeles",
                    "_": "Copiadas %d fila al portapapeles"
                },
                "copyTitle": "Copiar al portapapeles",
                "csv": "CSV",
                "excel": "Excel",
                "pageLength": {
                    "-1": "Mostrar todas las filas",
                    "_": "Mostrar %d filas"
                },
                "pdf": "PDF",
                "print": "Imprimir"
            },
            "autoFill": {
                "cancel": "Cancelar",
                "fill": "Rellene todas las celdas con <i>%d<\/i>",
                "fillHorizontal": "Rellenar celdas horizontalmente",
                "fillVertical": "Rellenar celdas verticalmentemente"
            },
            "decimal": ",",
            "searchBuilder": {
                "add": "Añadir condición",
                "button": {
                    "0": "Constructor de búsqueda",
                    "_": "Constructor de búsqueda (%d)"
                },
                "clearAll": "Borrar todo",
                "condition": "Condición",
                "conditions": {
                    "date": {
                        "after": "Despues",
                        "before": "Antes",
                        "between": "Entre",
                        "empty": "Vacío",
                        "equals": "Igual a",
                        "notBetween": "No entre",
                        "notEmpty": "No Vacio",
                        "not": "Diferente de"
                    },
                    "number": {
                        "between": "Entre",
                        "empty": "Vacio",
                        "equals": "Igual a",
                        "gt": "Mayor a",
                        "gte": "Mayor o igual a",
                        "lt": "Menor que",
                        "lte": "Menor o igual que",
                        "notBetween": "No entre",
                        "notEmpty": "No vacío",
                        "not": "Diferente de"
                    },
                    "string": {
                        "contains": "Contiene",
                        "empty": "Vacío",
                        "endsWith": "Termina en",
                        "equals": "Igual a",
                        "notEmpty": "No Vacio",
                        "startsWith": "Empieza con",
                        "not": "Diferente de"
                    },
                    "array": {
                        "not": "Diferente de",
                        "equals": "Igual",
                        "empty": "Vacío",
                        "contains": "Contiene",
                        "notEmpty": "No Vacío",
                        "without": "Sin"
                    }
                },
                "data": "Data",
                "deleteTitle": "Eliminar regla de filtrado",
                "leftTitle": "Criterios anulados",
                "logicAnd": "Y",
                "logicOr": "O",
                "rightTitle": "Criterios de sangría",
                "title": {
                    "0": "Constructor de búsqueda",
                    "_": "Constructor de búsqueda (%d)"
                },
                "value": "Valor"
            },
            "searchPanes": {
                "clearMessage": "Borrar todo",
                "collapse": {
                    "0": "Paneles de búsqueda",
                    "_": "Paneles de búsqueda (%d)"
                },
                "count": "{total}",
                "countFiltered": "{shown} ({total})",
                "emptyPanes": "Sin paneles de búsqueda",
                "loadMessage": "Cargando paneles de búsqueda",
                "title": "Filtros Activos - %d"
            },
            "thousands": ".",
            "datetime": {
                "previous": "Anterior",
                "next": "Proximo",
                "hours": "Horas",
                "minutes": "Minutos",
                "seconds": "Segundos",
                "unknown": "-",
                "amPm": [
                    "AM",
                    "PM"
                ],
                "months": {
                    "0": "Enero",
                    "1": "Febrero",
                    "10": "Noviembre",
                    "11": "Diciembre",
                    "2": "Marzo",
                    "3": "Abril",
                    "4": "Mayo",
                    "5": "Junio",
                    "6": "Julio",
                    "7": "Agosto",
                    "8": "Septiembre",
                    "9": "Octubre"
                },
                "weekdays": [
                    "Dom",
                    "Lun",
                    "Mar",
                    "Mie",
                    "Jue",
                    "Vie",
                    "Sab"
                ]
            },
            "editor": {
                "close": "Cerrar",
                "create": {
                    "button": "Nuevo",
                    "title": "Crear Nuevo Registro",
                    "submit": "Crear"
                },
                "edit": {
                    "button": "Editar",
                    "title": "Editar Registro",
                    "submit": "Actualizar"
                },
                "remove": {
                    "button": "Eliminar",
                    "title": "Eliminar Registro",
                    "submit": "Eliminar",
                    "confirm": {
                        "_": "¿Está seguro que desea eliminar %d filas?",
                        "1": "¿Está seguro que desea eliminar 1 fila?"
                    }
                },
                "error": {
                    "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
                },
                "multi": {
                    "title": "Múltiples Valores",
                    "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
                    "restore": "Deshacer Cambios",
                    "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
                }
            },
            "info": "Mostrando _START_ a _END_ de _TOTAL_ registros"
        }
    }).DataTable();
}

$(document).on("submit", "#frmcliente", function (e) {
    e.preventDefault();
    RegistrarEditarCliente(e)
})

function RegistrarEditarCliente(e) {    
    var formData = new FormData($("#frmcliente")[0]);
    formData.append("usuarioUpdate", $("#CodUsuario").val());

    var jsonData = {};
    formData.forEach(function(value, key){
        jsonData[key] = value;
    });
    console.log("Datos del formulario:", jsonData.IdCliente);
    if(jsonData.IdCliente == "" || jsonData.IdCliente == "0") {
        $.ajax({
            url: 'https://localhost:7121/api/clientes',
            type: 'POST',
            data:  JSON.stringify(jsonData),        
            contentType: 'application/json',
            success: function (response) {
                Swal.fire("Éxito", "Cliente agregado correctamente", "success");
                $('#frmcliente')[0].reset();
                $("#IdCliente").val("");  
                $("#tblClientes").DataTable().ajax.reload();
                $("#ModalCliente").modal("hide");
            },
            error: function (error) {
                console.error("Error al agregar cliente:", error);
                Swal.fire("Error", "No se pudo agregar el cliente", "error");
            }
        });
    }else{
        $.ajax({
            url: 'https://localhost:7121/api/clientes/'+jsonData.IdCliente,
            type: 'PUT',
            data:  JSON.stringify(jsonData),        
            contentType: 'application/json',
            success: function (response) {
                Swal.fire("Éxito", "Cliente editado correctamente", "success");
                $('#frmcliente')[0].reset();
                $("#IdCliente").val("");  
                $("#tblClientes").DataTable().ajax.reload();
                $("#ModalCliente").modal("hide");
            },
            error: function (error) {
                console.error("Error al editar cliente:", error);
                Swal.fire("Error", "No se pudo editar el cliente", "error");
            }
        });
    }

}

$('#ModalCliente').on('hidden.bs.modal', function (event) {
    $('#frmcliente')[0].reset();
    $("#IdCliente").val("0");    
    $("#titulomodalcliente").html("Crear Cliente");
  // do something...
})

$(document).on("click", ".btnEditarCliente", function (e) {
    e.preventDefault();
    const idCliente = $(this).data("id");
    $("#titulomodalcliente").html("Editar Cliente");
    GetDataCliente(idCliente)
})


function GetDataCliente(idCliente) {
    $.ajax({
        url: 'https://localhost:7121/api/clientes/id/',
        type: 'POST',
        data: JSON.stringify({ idCliente: idCliente }),        
        contentType: 'application/json',
        success: function (response) {
            // console.log("Respuesta del servidor:", response[0]);
            if (response) {
                $("#IdCliente").val(response[0].idCliente);
                $("#idTipoDocumento").val(response[0].idTipoDocumento).change();
                $("#NroDocumento").val(response[0].nroDocumento);
                $("#NombreCliente").val(response[0].nombreCliente);
                $("#DireccionCliente").val(response[0].direccionCliente);
                $("#Telefono").val(response[0].telefono);
                $("#Correo").val(response[0].correo);
                $("#Observaciones").val(response[0].observaciones);
                $("#Estado").val(response[0].estado).change();
                $("#ModalCliente").modal("show");
            } else {
                Swal.fire("Error", "No se encontró el cliente", "error");
            }
        },
        error: function (error) {
            console.error("No se encontró el cliente, error:", error);
            Swal.fire("Error", "No se encontró el cliente", "error");
        }
    });
}

$(document).on("click", ".btnEliminarCliente", function (e) {
    e.preventDefault();
    const idCliente = $(this).data("id");
    var dialog =  bootbox.prompt({
      title: "Eliminar Cliente",
      message: "¿Estas seguro de realizar esta acción?<br></br>",
      inputType: 'textarea',
      placeholder: 'Ingresar alguna observación si es necesario.',
      centerVertical: true,
      size: "large",
      buttons: {
        cancel: {
          label: '<i class="fa fa-times"></i> NO',
        },
        confirm: {
          label: '<i class="fa fa-check"></i> SI',
        },
      },
      callback: function (result) {
        if (result != null) {
            $.ajax({
                url: 'https://localhost:7121/api/clientes/'+idCliente,
                type: 'DELETE',
                data: JSON.stringify({ 
                    Observaciones: result,
                    Estado: 0,
                    UsuarioUpdate: $("#CodUsuario").val()
                }),
                contentType: 'application/json',
                success: function (response) {
                    $("#tblClientes").DataTable().ajax.reload();
                    $(".bootbox ").modal('hide');
                    Swal.fire("Éxito", "Cliente eliminado correctamente", "success");
                },
                error: function (error) {
                    console.error("Error al eliminar cliente:", error);
                    Swal.fire("Error", "No se pudo eliminar el cliente", "error");
                }
            });
        }
      },
    });
})

$(document).on("click", ".btnVehiculoCliente", function (e) {
    e.preventDefault();
    const idCliente = $(this).data("id");
    ListarVehiculosClientes(idCliente)
})

function ListarVehiculosClientes(idCliente){
    var tabla = $("#tblvehiculos").dataTable({
        "aProcessing": true,
        "aServerSide": true,
        // dom: 'Bfrtip',
        "searching": true,
        responsive: true,
        lengthChange: false,
        colReorder: true,
        autoWidth: false,
        buttons: ["csv", "excel", "pdf"],
        ajax: {
            url: 'https://localhost:7121/api/vehiculos/cliente/', 
            type: 'POST',
            contentType: 'application/json',
            data: function (d) {
                return JSON.stringify({ idCliente: idCliente }); // importante
            },
            dataSrc:""
        },
        columns: [ { data: null }, { data: 'idVehiculo' }, { data: 'nombreCliente' }, { data: 'nroDocumento' }, { data: 'placaVehiculo' }, { data: 'marca' }, { data: 'tipoVehiculo' }, {data: 'observaciones'} ],
        columnDefs: [{
            targets: 0,
            orderable: false,
            className: 'text-center',
            createdCell: function(td, cellData, rowData, row, col) {
                $(td).html(`<div class="btn-group">
                                <button type="button" class="btn btn-danger btn-sm btnEliminarVehiculo" data-id="${rowData.idVehiculo}" data-idcliente="${rowData.idCliente}" data-toggle='tooltip' data-placement='top' title='Eliminar Vehiculo'><i class='fa fa-trash'></i></button>
                                <button type="button" class="btn btn-warning btn-sm btnEditarVehiculo text-white" data-id="${rowData.idVehiculo}" data-idcliente="${rowData.idCliente}" data-toggle='tooltip' data-placement='top' title='Editar Vehiculo'><i class='fa fa-edit'></i></button>
                            </div>`)

            }

        }, ],
        "bDestroy": true,
        "bInfo": true,
        "iDisplayLength": 10,
        "language":
        {
            "processing": "Procesando...",
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "emptyTable": "Ningún dato disponible en esta tabla",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "search": "Buscar:",
            "infoThousands": ",",
            "loadingRecords": "Cargando...",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            },
            "aria": {
                "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sortDescending": ": Activar para ordenar la columna de manera descendente"
            },
            "buttons": {
                "copy": "Copiar",
                "colvis": "Visibilidad",
                "collection": "Colección",
                "colvisRestore": "Restaurar visibilidad",
                "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
                "copySuccess": {
                    "1": "Copiada 1 fila al portapapeles",
                    "_": "Copiadas %d fila al portapapeles"
                },
                "copyTitle": "Copiar al portapapeles",
                "csv": "CSV",
                "excel": "Excel",
                "pageLength": {
                    "-1": "Mostrar todas las filas",
                    "_": "Mostrar %d filas"
                },
                "pdf": "PDF",
                "print": "Imprimir"
            },
            "autoFill": {
                "cancel": "Cancelar",
                "fill": "Rellene todas las celdas con <i>%d<\/i>",
                "fillHorizontal": "Rellenar celdas horizontalmente",
                "fillVertical": "Rellenar celdas verticalmentemente"
            },
            "decimal": ",",
            "searchBuilder": {
                "add": "Añadir condición",
                "button": {
                    "0": "Constructor de búsqueda",
                    "_": "Constructor de búsqueda (%d)"
                },
                "clearAll": "Borrar todo",
                "condition": "Condición",
                "conditions": {
                    "date": {
                        "after": "Despues",
                        "before": "Antes",
                        "between": "Entre",
                        "empty": "Vacío",
                        "equals": "Igual a",
                        "notBetween": "No entre",
                        "notEmpty": "No Vacio",
                        "not": "Diferente de"
                    },
                    "number": {
                        "between": "Entre",
                        "empty": "Vacio",
                        "equals": "Igual a",
                        "gt": "Mayor a",
                        "gte": "Mayor o igual a",
                        "lt": "Menor que",
                        "lte": "Menor o igual que",
                        "notBetween": "No entre",
                        "notEmpty": "No vacío",
                        "not": "Diferente de"
                    },
                    "string": {
                        "contains": "Contiene",
                        "empty": "Vacío",
                        "endsWith": "Termina en",
                        "equals": "Igual a",
                        "notEmpty": "No Vacio",
                        "startsWith": "Empieza con",
                        "not": "Diferente de"
                    },
                    "array": {
                        "not": "Diferente de",
                        "equals": "Igual",
                        "empty": "Vacío",
                        "contains": "Contiene",
                        "notEmpty": "No Vacío",
                        "without": "Sin"
                    }
                },
                "data": "Data",
                "deleteTitle": "Eliminar regla de filtrado",
                "leftTitle": "Criterios anulados",
                "logicAnd": "Y",
                "logicOr": "O",
                "rightTitle": "Criterios de sangría",
                "title": {
                    "0": "Constructor de búsqueda",
                    "_": "Constructor de búsqueda (%d)"
                },
                "value": "Valor"
            },
            "searchPanes": {
                "clearMessage": "Borrar todo",
                "collapse": {
                    "0": "Paneles de búsqueda",
                    "_": "Paneles de búsqueda (%d)"
                },
                "count": "{total}",
                "countFiltered": "{shown} ({total})",
                "emptyPanes": "Sin paneles de búsqueda",
                "loadMessage": "Cargando paneles de búsqueda",
                "title": "Filtros Activos - %d"
            },
            "thousands": ".",
            "datetime": {
                "previous": "Anterior",
                "next": "Proximo",
                "hours": "Horas",
                "minutes": "Minutos",
                "seconds": "Segundos",
                "unknown": "-",
                "amPm": [
                    "AM",
                    "PM"
                ],
                "months": {
                    "0": "Enero",
                    "1": "Febrero",
                    "10": "Noviembre",
                    "11": "Diciembre",
                    "2": "Marzo",
                    "3": "Abril",
                    "4": "Mayo",
                    "5": "Junio",
                    "6": "Julio",
                    "7": "Agosto",
                    "8": "Septiembre",
                    "9": "Octubre"
                },
                "weekdays": [
                    "Dom",
                    "Lun",
                    "Mar",
                    "Mie",
                    "Jue",
                    "Vie",
                    "Sab"
                ]
            },
            "editor": {
                "close": "Cerrar",
                "create": {
                    "button": "Nuevo",
                    "title": "Crear Nuevo Registro",
                    "submit": "Crear"
                },
                "edit": {
                    "button": "Editar",
                    "title": "Editar Registro",
                    "submit": "Actualizar"
                },
                "remove": {
                    "button": "Eliminar",
                    "title": "Eliminar Registro",
                    "submit": "Eliminar",
                    "confirm": {
                        "_": "¿Está seguro que desea eliminar %d filas?",
                        "1": "¿Está seguro que desea eliminar 1 fila?"
                    }
                },
                "error": {
                    "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
                },
                "multi": {
                    "title": "Múltiples Valores",
                    "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
                    "restore": "Deshacer Cambios",
                    "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
                }
            },
            "info": "Mostrando _START_ a _END_ de _TOTAL_ registros"
        }
    }).DataTable();
}

$('#ModalVehiculo').on('hidden.bs.modal', function (event) {
    $('#frmvehiculo')[0].reset();
    $("#IdVehiculo").val("0");    
    $("#IdClienteV").val("").change();    
    $("#titulomodalvehiculo").html("Crear Vehículo");
  // do something...
})

$(document).on("click", ".btnEditarVehiculo", function (e) {
    e.preventDefault();
    const idVehiculo = $(this).data("id");
    $("#titulomodalvehiculo").html("Editar Vehiculo");
    GetDataVehiculo(idVehiculo)
})

function GetDataVehiculo(idVehiculo) {
    $.ajax({
        url: 'https://localhost:7121/api/vehiculos/id/',
        type: 'POST',
        data: JSON.stringify({ idVehiculo: idVehiculo }),        
        contentType: 'application/json',
        success: function (response) {
            console.log("Respuesta del servidor:", response[0]);
            if (response) {
                $("#IdVehiculo").val(response[0].idVehiculo);
                $("#IdClienteV").val(response[0].idCliente).change();
                $("#IdMarca").val(response[0].idMarca).change();
                $("#IdTipoVehiculo").val(response[0].idTipoVehiculo).change();
                $("#PlacaVehiculo").val(response[0].placaVehiculo);
                $("#PlacaNueva").val(response[0].placaNueva);
                $("#ObservacionesV").val(response[0].observaciones);
                $("#EstadoV").val(response[0].estado).change();
                $("#ModalVehiculo").modal("show");
            } else {
                Swal.fire("Error", "No se encontró el cliente", "error");
            }
        },
        error: function (error) {
            console.error("No se encontró el cliente, error:", error);
            Swal.fire("Error", "No se encontró el cliente", "error");
        }
    });
}

$(document).on("click", ".btnEliminarVehiculo", function (e) {
    e.preventDefault();
    const idVehiculo = $(this).data("id");
    const idCliente = $(this).data("idcliente");
    console.log("ID Vehiculo:", idVehiculo);
    console.log("ID Cliente:", idCliente);
    var dialog =  bootbox.prompt({
      title: "Eliminar Vehiculo",
      message: "¿Estas seguro de realizar esta acción?<br></br>",
      inputType: 'textarea',
      placeholder: 'Ingresar alguna observación si es necesario.',
      centerVertical: true,
      size: "large",
      buttons: {
        cancel: {
          label: '<i class="fa fa-times"></i> NO',
        },
        confirm: {
          label: '<i class="fa fa-check"></i> SI',
        },
      },
      callback: function (result) {
        if (result != null) {
            $.ajax({
                url: 'https://localhost:7121/api/vehiculos/'+idVehiculo,
                type: 'DELETE',
                data: JSON.stringify({ 
                    Observaciones: result,
                    Estado: 0,
                    UsuarioUpdate: $("#CodUsuario").val()
                }),
                contentType: 'application/json',
                success: function (response) {
                    ListarVehiculosClientes(idCliente)
                    $(".bootbox ").modal('hide');
                    Swal.fire("Éxito", "Vehiculo eliminado correctamente", "success");
                },
                error: function (error) {
                    console.error("Error al eliminar vehiculo:", error);
                    Swal.fire("Error", "No se pudo eliminar el vehiculo", "error");
                }
            });
        }
      },
    });
})

$(document).on("submit", "#frmvehiculo", function (e) {
    e.preventDefault();
    RegistrarEditarVehiculo(e)
})

function RegistrarEditarVehiculo(e) {    
    var formData = new FormData($("#frmvehiculo")[0]);
    formData.append("usuarioUpdate", $("#CodUsuario").val());
    formData.append("IdCliente", $("#IdClienteV").val());
    formData.append("Observaciones", $("#ObservacionesV").val());
    formData.append("Estado", $("#EstadoV").val());

    var jsonData = {};
    formData.forEach(function(value, key){
        jsonData[key] = value;
    });
    console.log("Datos del formulario:", jsonData.IdVehiculo);
    if(jsonData.IdVehiculo == "" || jsonData.IdVehiculo == "0") {
        $.ajax({
            url: 'https://localhost:7121/api/vehiculos',
            type: 'POST',
            data:  JSON.stringify(jsonData),        
            contentType: 'application/json',
            success: function (response) {
                Swal.fire("Éxito", "Vehiculo agregado correctamente", "success");
                $('#frmvehiculo')[0].reset();
                $("#IdVehiculo").val("");  
                ListarVehiculosClientes(jsonData.IdCliente)
                $("#ModalVehiculo").modal("hide");
            },
            error: function (error) {
                console.error("Error al agregar Vehiculo:", error);
                Swal.fire("Error", "No se pudo agregar el Vehiculo", "error");
            }
        });
    }else{
        $.ajax({
            url: 'https://localhost:7121/api/vehiculos/'+jsonData.IdVehiculo,
            type: 'PUT',
            data:  JSON.stringify(jsonData),        
            contentType: 'application/json',
            success: function (response) {
                Swal.fire("Éxito", "Vehiculo editado correctamente", "success");
                $('#frmvehiculo')[0].reset();
                $("#IdVehiculo").val("");  
                ListarVehiculosClientes(jsonData.IdCliente)
                $("#ModalVehiculo").modal("hide");
            },
            error: function (error) {
                console.error("Error al editar Vehiculo:", error);
                Swal.fire("Error", "No se pudo editar el Vehiculo", "error");
            }
        });
    }

}

init();