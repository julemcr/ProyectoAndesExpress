namespace ProyectoEstacionamiento.Modelo
{
    public class Masignacionplaza
    {
        public int IdAsignacionPlaza { get; set; }
        public int IdPlazaEstacionamiento { get; set; }
        public int IdVehiculo { get; set; }        
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string? TotalTiempo { get; set; }
        public int Estado { get; set; }
        public string? Observaciones { get; set; }
        public int UsuarioUpdate { get; set; }
        public DateTime FechaUpdate { get; set; }
        public string? CodigoPlaza { get; set; }
        public string? UbicacionPlaza { get; set; }
        public string? EstadoActual { get; set; }
        public int IdPlaya { get; set; }        
        public string? NombrePlaya { get; set; }
        public string? PlacaVehiculo { get; set; }
        public string? PlacaNueva { get; set; }
        public int IdMarca { get; set; }
        public string? Marca { get; set; }
        public int IdTipoVehiculo { get; set; }
        public string? TipoVehiculo { get; set; }
        public int IdCliente { get; set; }        
        public int IdTipoDocumento { get; set; }
        public string? TipoDocumento { get; set; }
        public string? NroDocumento { get; set; }
        public string? NombreCliente { get; set; }
    }
}
