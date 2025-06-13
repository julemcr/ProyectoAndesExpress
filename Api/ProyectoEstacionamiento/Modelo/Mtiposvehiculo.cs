namespace ProyectoEstacionamiento.Modelo
{
    public class Mtiposvehiculo
    {
        public int IdTipoVehiculo { get; set; }
        public string? CodTipoVehiculo { get; set; }
        public string? TipoVehiculo { get; set; }
        public string? Observaciones { get; set; }
        public int Estado { get; set; }
        public int UsuarioUpdate { get; set; }
        public DateTime FechaUpdate { get; set; }
    }
}
