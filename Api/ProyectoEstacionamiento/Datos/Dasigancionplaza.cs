using System.Data.SqlClient;
using ProyectoEstacionamiento.Conexion;
using ProyectoEstacionamiento.Modelo;

namespace ProyectoEstacionamiento.Datos
{
    public class Dasigancionplaza
    {
        Conexionbd cn = new Conexionbd();

        public async Task<List<Masignacionplaza>> MostrarAsignacionPlaza()
        {
            // Aquí iría la lógica para obtener los clientes desde la base de datos
            // Por ejemplo, usando Entity Framework o ADO.NET
            var lista = new List<Masignacionplaza>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_listarasignacionplazas", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var items = await cmd.ExecuteReaderAsync())
                    {
                        while (await items.ReadAsync())
                        {
                            var asigancionplaza = new Masignacionplaza
                            {
                                IdAsignacionPlaza = Convert.ToInt32(items["IdAsignacionPlaza"].ToString()),
                                IdPlazaEstacionamiento = Convert.ToInt32(items["IdPlazaEstacionamiento"].ToString()),
                                IdVehiculo = Convert.ToInt32(items["IdVehiculo"].ToString()),
                                FechaInicio = Convert.ToDateTime(items["FechaInicio"].ToString()),
                                FechaFin = Convert.ToDateTime(items["FechaFin"].ToString()),
                                TotalTiempo = items["TotalTiempo"].ToString(),
                                CodigoPlaza = items["CodigoPlaza"].ToString(),
                                UbicacionPlaza = items["UbicacionPlaza"].ToString(),
                                EstadoActual = items["EstadoActual"].ToString(),
                                IdPlaya = Convert.ToInt32(items["IdPlaya"].ToString()),
                                NombrePlaya = items["NombrePlaya"].ToString(),
                                IdCliente = Convert.ToInt32(items["IdCliente"].ToString()),
                                IdTipoVehiculo = Convert.ToInt32(items["IdTipoVehiculo"].ToString()),
                                TipoVehiculo = items["TipoVehiculo"].ToString(),
                                PlacaVehiculo = items["PlacaVehiculo"].ToString(),
                                PlacaNueva = items["PlacaNueva"].ToString(),
                                IdMarca = Convert.ToInt32(items["IdMarca"].ToString()),
                                Marca = items["Marca"].ToString(),
                                Observaciones = items["Observaciones"].ToString(),
                                Estado = Convert.ToInt32(items["Estado"].ToString()),
                                UsuarioUpdate = Convert.ToInt32(items["UsuarioUpdate"].ToString()),
                                FechaUpdate = Convert.ToDateTime(items["FechaUpdate"].ToString()),
                                NombreCliente = items["NombreCliente"].ToString(),
                                NroDocumento = items["NroDocumento"].ToString(),
                                IdTipoDocumento = Convert.ToInt32(items["IdTipoDocumento"].ToString()),
                                TipoDocumento = items["TipoDocumento"].ToString()
                            };

                            lista.Add(asigancionplaza);
                        }
                    }
                }

            }
            return lista;
        }

        public async Task<List<Masignacionplaza>> MostrarAsignacionPlazaId(Masignacionplaza parametros)
        {
            // Aquí iría la lógica para obtener los clientes desde la base de datos
            // Por ejemplo, usando Entity Framework o ADO.NET
            var lista = new List<Masignacionplaza>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_listarasignacionplazasId", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdAsignacionPlaza", parametros.IdAsignacionPlaza); 
                    using (var items = await cmd.ExecuteReaderAsync())
                    {
                        while (await items.ReadAsync())
                        {
                            var asigancionplaza = new Masignacionplaza
                            {
                                IdAsignacionPlaza = Convert.ToInt32(items["IdAsignacionPlaza"].ToString()),
                                IdPlazaEstacionamiento = Convert.ToInt32(items["IdPlazaEstacionamiento"].ToString()),
                                IdVehiculo = Convert.ToInt32(items["IdVehiculo"].ToString()),
                                FechaInicio = Convert.ToDateTime(items["FechaInicio"].ToString()),
                                FechaFin = Convert.ToDateTime(items["FechaFin"].ToString()),
                                TotalTiempo = items["TotalTiempo"].ToString(),
                                CodigoPlaza = items["CodigoPlaza"].ToString(),
                                UbicacionPlaza = items["UbicacionPlaza"].ToString(),
                                EstadoActual = items["EstadoActual"].ToString(),
                                IdPlaya = Convert.ToInt32(items["IdPlaya"].ToString()),
                                NombrePlaya = items["NombrePlaya"].ToString(),
                                IdCliente = Convert.ToInt32(items["IdCliente"].ToString()),
                                IdTipoVehiculo = Convert.ToInt32(items["IdTipoVehiculo"].ToString()),
                                TipoVehiculo = items["TipoVehiculo"].ToString(),
                                PlacaVehiculo = items["PlacaVehiculo"].ToString(),
                                PlacaNueva = items["PlacaNueva"].ToString(),
                                IdMarca = Convert.ToInt32(items["IdMarca"].ToString()),
                                Marca = items["Marca"].ToString(),
                                Observaciones = items["Observaciones"].ToString(),
                                Estado = Convert.ToInt32(items["Estado"].ToString()),
                                UsuarioUpdate = Convert.ToInt32(items["UsuarioUpdate"].ToString()),
                                FechaUpdate = Convert.ToDateTime(items["FechaUpdate"].ToString()),
                                NombreCliente = items["NombreCliente"].ToString(),
                                NroDocumento = items["NroDocumento"].ToString(),
                                IdTipoDocumento = Convert.ToInt32(items["IdTipoDocumento"].ToString()),                                
                                TipoDocumento = items["TipoDocumento"].ToString()
                            };

                            lista.Add(asigancionplaza);
                        }
                    }
                }

            }
            return lista;
        }

        public async Task InsertarAsignacionPlaza(Masignacionplaza parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_guardarasignacionplazas", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdPlazaEstacionamiento", parametros.IdPlazaEstacionamiento);
                    cmd.Parameters.AddWithValue("@pIdVehiculo", parametros.IdVehiculo);
                    cmd.Parameters.AddWithValue("@pFechaInicio", parametros.FechaInicio);
                    cmd.Parameters.AddWithValue("@pFechaFin", parametros.FechaFin);
                    cmd.Parameters.AddWithValue("@pTotalTiempo", parametros.TotalTiempo);
                    cmd.Parameters.AddWithValue("@pEstado", parametros.Estado);
                    cmd.Parameters.AddWithValue("@pObservaciones", parametros.Observaciones);
                    cmd.Parameters.AddWithValue("@pUsuarioUpdate", parametros.UsuarioUpdate);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }

            }
        }

        public async Task EditarAsignacionPlaza(Masignacionplaza parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_editarAsignacionplazas", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdAsignacionPlaza", parametros.IdAsignacionPlaza);
                    cmd.Parameters.AddWithValue("@pIdPlazaEstacionamiento", parametros.IdPlazaEstacionamiento);
                    cmd.Parameters.AddWithValue("@pIdVehiculo", parametros.IdVehiculo);
                    cmd.Parameters.AddWithValue("@pFechaInicio", parametros.FechaInicio);
                    cmd.Parameters.AddWithValue("@pFechaFin", parametros.FechaFin);
                    cmd.Parameters.AddWithValue("@pTotalTiempo", parametros.TotalTiempo);
                    cmd.Parameters.AddWithValue("@pEstado", parametros.Estado);
                    cmd.Parameters.AddWithValue("@pObservaciones", parametros.Observaciones);
                    cmd.Parameters.AddWithValue("@pUsuarioUpdate", parametros.UsuarioUpdate);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }

            }
        }

        public async Task EliminarAsignacionPlaza(Masignacionplaza parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_eliminarasignacionplazas", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdIdAsignacionPlaza", parametros.IdAsignacionPlaza);
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
