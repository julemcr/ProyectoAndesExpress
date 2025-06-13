namespace ProyectoEstacionamiento.Modelo
{
    public class Mplazaestacionamiento
    {
        public int IdPlazaEstacionamiento { get; set; }
        public int IdPlaya { get; set; }
        public string? CodigoPlaza { get; set; }
        public string? UbicacionPlaza { get; set; }
        public int EstadoActual { get; set; }
        public int Estado { get; set; }
        public int UsuarioUpdate { get; set; }
        public DateTime FechaUpdate { get; set; }
    }
}
