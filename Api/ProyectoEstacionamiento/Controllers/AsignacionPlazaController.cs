using Microsoft.AspNetCore.Mvc;
using ProyectoEstacionamiento.Datos;
using ProyectoEstacionamiento.Modelo;

namespace ProyectoEstacionamiento.Controllers
{
    [ApiController]
    [Route("api/asignacionplaza")]
    public class AsignacionPlazaController:ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<List<Masignacionplaza>>> Get()
        {
            // Aquí iría la lógica para obtener los datos
            var funcion = new Dasigancionplaza();
            var lista = await funcion.MostrarAsignacionPlaza();
            return lista;
        }

        [HttpPost("id")]
        public async Task<ActionResult<List<Masignacionplaza>>> PostMostrarAsignacionPlazaId([FromBody] Masignacionplaza parametros)
        {
            // Aquí iría la lógica para obtener los datos
            var funcion = new Dasigancionplaza();
            var lista = await funcion.MostrarAsignacionPlazaId(parametros);
            return lista;
        }

        [HttpPost]
        public async Task Post([FromBody] Masignacionplaza parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dasigancionplaza();
            await funcion.InsertarAsignacionPlaza(parametros);

        }

        [HttpPut("{id}")]
        public async Task<ActionResult> Put(int id, [FromBody] Masignacionplaza parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dasigancionplaza();
            parametros.IdAsignacionPlaza = id;
            await funcion.EditarAsignacionPlaza(parametros);
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id, [FromBody] Masignacionplaza parametros)
        {
            // Aquí iría la lógica para insertar un datos
            var funcion = new Dasigancionplaza();
            parametros.IdAsignacionPlaza = id;
            await funcion.EliminarAsignacionPlaza(parametros);
            return NoContent();
        }
    }

}
