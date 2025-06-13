using System.Data.SqlClient;
using ProyectoEstacionamiento.Conexion;
using ProyectoEstacionamiento.Modelo;

namespace ProyectoEstacionamiento.Datos
{
    public class Dvehiculos
    {
        Conexionbd cn = new Conexionbd();

        public async Task<List<Mvehiculos>> MostrarVehiculos()
        {
            // Aquí iría la lógica para obtener los clientes desde la base de datos
            // Por ejemplo, usando Entity Framework o ADO.NET
            var lista = new List<Mvehiculos>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_listarVehiculos", sql))
                {
                    await sql.OpenAsync();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var items = await cmd.ExecuteReaderAsync())
                    {
                        while (await items.ReadAsync())
                        {
                            var veviculo = new Mvehiculos
                            {
                                IdVehiculo = Convert.ToInt32(items["IdVehiculo"].ToString()),
                                IdCliente = Convert.ToInt32(items["IdCliente"].ToString()),
                                IdMarca = Convert.ToInt32(items["IdMarca"].ToString()),
                                IdTipoVehiculo = Convert.ToInt32(items["IdTipoVehiculo"].ToString()),
                                PlacaVehiculo = items["PlacaVehiculo"].ToString(),
                                PlacaNueva = items["PlacaNueva"].ToString(),
                                Observaciones = items["Observaciones"].ToString(),
                                Estado = Convert.ToInt32(items["Estado"].ToString()),
                                UsuarioUpdate = Convert.ToInt32(items["UsuarioUpdate"].ToString()),
                                FechaUpdate = Convert.ToDateTime(items["FechaUpdate"].ToString()),
                                TipoVehiculo = items["TipoVehiculo"].ToString(),
                                NombreCliente = items["NombreCliente"].ToString(),
                                NroDocumento = items["NroDocumento"].ToString(),
                                TipoDocumento = items["TipoDocumento"].ToString()
                            };

                            lista.Add(veviculo);
                        }
                    }
                }

            }
            return lista;
        }

        public async Task<List<Mvehiculos>> MostrarVehiculoid(Mvehiculos parametros)
        {
            // Aquí iría la lógica para obtener los clientes desde la base de datos
            // Por ejemplo, usando Entity Framework o ADO.NET
            var lista = new List<Mvehiculos>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_listarVehiculosId", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdVehiculo", parametros.IdVehiculo);

                    await sql.OpenAsync();
                    using (var items = await cmd.ExecuteReaderAsync())
                    {
                        while (await items.ReadAsync())
                        {
                            var veviculo = new Mvehiculos
                            {

                                IdVehiculo = Convert.ToInt32(items["IdVehiculo"].ToString()),
                                IdCliente = Convert.ToInt32(items["IdCliente"].ToString()),
                                IdMarca = Convert.ToInt32(items["IdMarca"].ToString()),
                                IdTipoVehiculo = Convert.ToInt32(items["IdTipoVehiculo"].ToString()),
                                PlacaVehiculo = items["PlacaVehiculo"].ToString(),
                                PlacaNueva = items["PlacaNueva"].ToString(),
                                Observaciones = items["Observaciones"].ToString(),
                                Estado = Convert.ToInt32(items["Estado"].ToString()),
                                UsuarioUpdate = Convert.ToInt32(items["UsuarioUpdate"].ToString()),
                                FechaUpdate = Convert.ToDateTime(items["FechaUpdate"].ToString()),
                                Marca = items["Marca"].ToString(),
                                TipoVehiculo = items["TipoVehiculo"].ToString(),
                                NombreCliente = items["NombreCliente"].ToString(),
                                NroDocumento = items["NroDocumento"].ToString(),
                                TipoDocumento = items["TipoDocumento"].ToString()

                            };

                            lista.Add(veviculo);
                        }
                    }
                }

            }
            return lista;
        }

        public async Task<List<Mvehiculos>> MostrarVehiculoCliente(Mvehiculos parametros)
        {
            // Aquí iría la lógica para obtener los clientes desde la base de datos
            // Por ejemplo, usando Entity Framework o ADO.NET
            var lista = new List<Mvehiculos>();
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_listarVehiculosCliente", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdCliente", parametros.IdCliente);

                    await sql.OpenAsync();
                    using (var items = await cmd.ExecuteReaderAsync())
                    {
                        while (await items.ReadAsync())
                        {
                            var veviculo = new Mvehiculos
                            {
                                IdVehiculo = Convert.ToInt32(items["IdVehiculo"].ToString()),
                                IdCliente = Convert.ToInt32(items["IdCliente"].ToString()),
                                IdMarca = Convert.ToInt32(items["IdMarca"].ToString()),
                                IdTipoVehiculo = Convert.ToInt32(items["IdTipoVehiculo"].ToString()),
                                PlacaVehiculo = items["PlacaVehiculo"].ToString(),
                                PlacaNueva = items["PlacaNueva"].ToString(),
                                Observaciones = items["Observaciones"].ToString(),
                                Estado = Convert.ToInt32(items["Estado"].ToString()),
                                UsuarioUpdate = Convert.ToInt32(items["UsuarioUpdate"].ToString()),
                                FechaUpdate = Convert.ToDateTime(items["FechaUpdate"].ToString()),
                                Marca = items["Marca"].ToString(),
                                TipoVehiculo = items["TipoVehiculo"].ToString(),
                                NombreCliente = items["NombreCliente"].ToString(),
                                NroDocumento = items["NroDocumento"].ToString(),
                                TipoDocumento = items["TipoDocumento"].ToString()
                            };

                            lista.Add(veviculo);
                        }
                    }
                }

            }
            return lista;
        }

        public async Task InsertarVehiculo(Mvehiculos parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_guardarVehiculo", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdCliente", parametros.IdCliente);
                    cmd.Parameters.AddWithValue("@pIdMarca", parametros.IdMarca);
                    cmd.Parameters.AddWithValue("@pIdTipoVehiculo", parametros.IdTipoVehiculo);
                    cmd.Parameters.AddWithValue("@pPlacaVehiculo", parametros.PlacaVehiculo);
                    cmd.Parameters.AddWithValue("@pPlacaNueva", parametros.PlacaNueva);
                    cmd.Parameters.AddWithValue("@pObservaciones", parametros.Observaciones);
                    cmd.Parameters.AddWithValue("@pEstado", parametros.Estado);
                    cmd.Parameters.AddWithValue("@pUsuarioUpdate", parametros.UsuarioUpdate);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }

            }
        }

        public async Task EditarVehiculo(Mvehiculos parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_editarVehiculo", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdVehiculo", parametros.IdVehiculo); 
                    cmd.Parameters.AddWithValue("@pIdCliente", parametros.IdCliente);
                    cmd.Parameters.AddWithValue("@pIdMarca", parametros.IdMarca);
                    cmd.Parameters.AddWithValue("@pIdTipoVehiculo", parametros.IdTipoVehiculo);
                    cmd.Parameters.AddWithValue("@pPlacaVehiculo", parametros.PlacaVehiculo);
                    cmd.Parameters.AddWithValue("@pPlacaNueva", parametros.PlacaNueva);
                    cmd.Parameters.AddWithValue("@pObservaciones", parametros.Observaciones);
                    cmd.Parameters.AddWithValue("@pEstado", parametros.Estado);
                    cmd.Parameters.AddWithValue("@pUsuarioUpdate", parametros.UsuarioUpdate);

                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();
                }

            }
        }

        public async Task EliminarVehiculo(Mvehiculos parametros)
        {
            using (var sql = new SqlConnection(cn.cadenaSQL()))
            {
                using (var cmd = new SqlCommand("sp_eliminarVehiculo", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pIdVehiculo", parametros.IdVehiculo);
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
