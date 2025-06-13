using Microsoft.AspNetCore.Mvc;
using ProyectoEstacionamiento.Datos;
using ProyectoEstacionamiento.Modelo;

namespace ProyectoEstacionamiento.Controllers
{
    [ApiController]
    [Route("api/vehiculos")]
    public class VehiculosController:ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<List<Mvehiculos>>> Get()
        {
            // Aquí iría la lógica para obtener los datos
            var funcion = new Dvehiculos();
            var lista = await funcion.MostrarVehiculos();
            return lista;
        }

        [HttpPost("id")]
        public async Task<ActionResult<List<Mvehiculos>>> PostMostrarVehiculoid([FromBody] Mvehiculos parametros)
        {
            // Aquí iría la lógica para obtener los datos
            var funcion = new Dvehiculos();
            var lista = await funcion.MostrarVehiculoid(parametros);
            return lista;
        }

        [HttpPost("cliente")]
        public async Task<ActionResult<List<Mvehiculos>>> PostMostrarVehiculoCliente([FromBody] Mvehiculos parametros)
        {
            // Aquí iría la lógica para obtener los clientes
            var funcion = new Dvehiculos();
            var lista = await funcion.MostrarVehiculoCliente(parametros);
            return lista;
        }

        [HttpPost]
        public async Task Post([FromBody] Mvehiculos parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dvehiculos();
            await funcion.InsertarVehiculo(parametros);

        }

        [HttpPut("{id}")]
        public async Task<ActionResult> Put(int id, [FromBody] Mvehiculos parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dvehiculos();
            parametros.IdVehiculo = id;
            await funcion.EditarVehiculo(parametros);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id, [FromBody] Mvehiculos parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dvehiculos();
            parametros.IdVehiculo = id;
            await funcion.EliminarVehiculo(parametros);
            return NoContent();
        }
    }
}
