using Microsoft.AspNetCore.Mvc;
using ProyectoEstacionamiento.Datos;
using ProyectoEstacionamiento.Modelo;

namespace ProyectoEstacionamiento.Controllers
{
    [ApiController]
    [Route("api/clientes")]
    public class ClientesController:ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<List<Mclientes>>> Get()
        {
            // Aquí iría la lógica para obtener los datos
            var funcion = new Dclientes();
            var lista = await funcion.MostrarClientes();
            return lista;
        }

        [HttpPost("id")]
        public async Task<ActionResult<List<Mclientes>>> PostBusquedaClienteId([FromBody] Mclientes parametros)
        {
            // Aquí iría la lógica para obtener los datos
            var funcion = new Dclientes();
            var lista = await funcion.MostrarClientesId(parametros);
            return lista;
        }

        [HttpPost]
        public async Task Post([FromBody] Mclientes parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dclientes();
            await funcion.InsertarCliente(parametros);

        }

        [HttpPut("{id}")]
        public async Task<ActionResult> Put(int id, [FromBody] Mclientes parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dclientes();
            parametros.IdCliente = id;
            await funcion.EditarCliente(parametros);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id, [FromBody] Mclientes parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dclientes();
            parametros.IdCliente = id;
            await funcion.EliminarCliente(parametros);
            return NoContent();
        }
    }
}
