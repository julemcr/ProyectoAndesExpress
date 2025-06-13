namespace ProyectoEstacionamiento.Conexion
{
    public class Conexionbd
    {
        private string connectionString = String.Empty;
        public Conexionbd()
        {
            var consrtuctor = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            // Aquí se define la cadena de conexión a la base de datos
            connectionString = consrtuctor.GetSection("ConnectionStrings:ConexionMaster").Value ?? string.Empty;
        }

        public string cadenaSQL()
        {
            return connectionString;
        }
    }
}
