using System.Data.SqlClient;
using ProyectoEstacionamiento.Conexion;
using ProyectoEstacionamiento.Modelo;

namespace ProyectoEstacionamiento.Datos
{
    public class Dclientes
    {
        Conexionbd cn = new Conexionbd();

        public async Task<List<Mclientes>> MostrarClientes()
        {
            // Aquí iría la lógica para obtener los clientes desde la base de datos
            // Por ejemplo, usando Entity Framework o ADO.NET
            var listaClientes = new List<Mclientes>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_listarClientes", sql)) { 
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var items = await cmd.ExecuteReaderAsync()) { 
                        while (await items.ReadAsync()) {
                            var cliente = new Mclientes
                            {
                                IdCliente = Convert.ToInt32(items["IdCliente"].ToString()),
                                IdTipoDocumento = Convert.ToInt32(items["IdTipoDocumento"].ToString()),
                                TipoDocumento = items["TipoDocumento"].ToString(),
                                NroDocumento = items["NroDocumento"].ToString(),
                                NombreCliente = items["NombreCliente"].ToString(),
                                DireccionCliente = items["DireccionCliente"].ToString(),
                                Telefono = items["Telefono"].ToString(),
                                Correo = items["Correo"].ToString(),
                                Observaciones = items["Observaciones"].ToString(),
                                Estado = Convert.ToInt32(items["Estado"].ToString()),
                                UsuarioUpdate = Convert.ToInt32(items["UsuarioUpdate"].ToString()),
                                FechaUpdate = Convert.ToDateTime(items["FechaUpdate"].ToString())
                            };

                            listaClientes.Add(cliente);
                        }
                    }
                }
                
            }
            return listaClientes;
        }

        public async Task<List<Mclientes>> MostrarClientesId(Mclientes parametros)
        {
            // Aquí iría la lógica para obtener los clientes desde la base de datos
            // Por ejemplo, usando Entity Framework o ADO.NET
            var listaClientes = new List<Mclientes>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_listarClientesId", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdCliente", parametros.IdCliente);

                    await sql.OpenAsync();
                    using (var items = await cmd.ExecuteReaderAsync())
                    {
                        while (await items.ReadAsync())
                        {
                            var cliente = new Mclientes
                            {
                                IdCliente = Convert.ToInt32(items["IdCliente"].ToString()),
                                IdTipoDocumento = Convert.ToInt32(items["IdTipoDocumento"].ToString()),
                                TipoDocumento = items["TipoDocumento"].ToString(),
                                NroDocumento = items["NroDocumento"].ToString(),
                                NombreCliente = items["NombreCliente"].ToString(),
                                DireccionCliente = items["DireccionCliente"].ToString(),
                                Telefono = items["Telefono"].ToString(),
                                Correo = items["Correo"].ToString(),
                                Observaciones = items["Observaciones"].ToString(),
                                Estado = Convert.ToInt32(items["Estado"].ToString()),
                                UsuarioUpdate = Convert.ToInt32(items["UsuarioUpdate"].ToString()),
                                FechaUpdate = Convert.ToDateTime(items["FechaUpdate"].ToString())
                            };

                            listaClientes.Add(cliente);
                        }
                    }
                }

            }
            return listaClientes;
        }

        public async Task InsertarCliente(Mclientes parametros) {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_guardarCliente", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdTipoDocumento", parametros.IdTipoDocumento);
                    cmd.Parameters.AddWithValue("@pNroDocumento", parametros.NroDocumento);
                    cmd.Parameters.AddWithValue("@pNombreCliente", parametros.NombreCliente);
                    cmd.Parameters.AddWithValue("@pDireccionCliente", parametros.DireccionCliente);
                    cmd.Parameters.AddWithValue("@pTelefono", parametros.Telefono);
                    cmd.Parameters.AddWithValue("@pCorreo", parametros.Correo);
                    cmd.Parameters.AddWithValue("@pObservaciones", parametros.Observaciones);
                    cmd.Parameters.AddWithValue("@pEstado", parametros.Estado);                    
                    cmd.Parameters.AddWithValue("@pUsuarioUpdate", parametros.UsuarioUpdate);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }

            }
        }

        public async Task EditarCliente(Mclientes parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_editarCliente", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdCliente", parametros.IdCliente);
                    cmd.Parameters.AddWithValue("@pIdTipoDocumento", parametros.IdTipoDocumento);
                    cmd.Parameters.AddWithValue("@pNroDocumento", parametros.NroDocumento);
                    cmd.Parameters.AddWithValue("@pNombreCliente", parametros.NombreCliente);
                    cmd.Parameters.AddWithValue("@pDireccionCliente", parametros.DireccionCliente);
                    cmd.Parameters.AddWithValue("@pTelefono", parametros.Telefono);
                    cmd.Parameters.AddWithValue("@pCorreo", parametros.Correo);
                    cmd.Parameters.AddWithValue("@pObservaciones", parametros.Observaciones);
                    cmd.Parameters.AddWithValue("@pUsuarioUpdate", parametros.UsuarioUpdate);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }

            }
        }

        public async Task EliminarCliente(Mclientes parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_eliminarCliente", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdCliente", parametros.IdCliente);
                    cmd.Parameters.AddWithValue("@pObservaciones", parametros.Observaciones);
                    cmd.Parameters.AddWithValue("@pEstado", parametros.Estado);
                    cmd.Parameters.AddWithValue("@pUsuarioUpdate", parametros.UsuarioUpdate);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }

            }
        }
    }
}
