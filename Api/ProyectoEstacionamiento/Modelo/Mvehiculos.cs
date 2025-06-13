namespace ProyectoEstacionamiento.Modelo
{
    public class Mvehiculos
    {
        public int IdVehiculo { get; set; }
        public int IdCliente { get; set; }
        public int IdMarca { get; set; }
        public int IdTipoVehiculo { get; set; }        
        public string? PlacaVehiculo { get; set; }
        public string? PlacaNueva { get; set; }
        public string? Observaciones { get; set; }
        public int Estado { get; set; }
        public int UsuarioUpdate { get; set; }
        public DateTime FechaUpdate { get; set; }

        public string? Marca { get; set; }
        public string? TipoVehiculo { get; set; }
        public string? NombreCliente { get; set; }
        public string? NroDocumento { get; set; }
        public string? TipoDocumento { get; set; }
    }
}
