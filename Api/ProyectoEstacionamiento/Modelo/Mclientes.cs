namespace ProyectoEstacionamiento.Modelo
{
    public class Mclientes
    {
        public int IdCliente { get; set; }
        public int IdTipoDocumento { get; set; }

        public string? TipoDocumento { get; set; }
        public string? NroDocumento { get; set; }
        public string? NombreCliente { get; set; }
        public string? DireccionCliente { get; set; }
        public string? Telefono { get; set; }
        public string? Correo { get; set; }
        public string? Observaciones { get; set; }
        public int Estado { get; set; }
        public int UsuarioUpdate { get; set; }
        public DateTime FechaUpdate { get; set; }



    }
}
