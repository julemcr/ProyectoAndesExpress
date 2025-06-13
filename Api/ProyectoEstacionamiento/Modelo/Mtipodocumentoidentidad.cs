namespace ProyectoEstacionamiento.Modelo
{
    public class Mtipodocumentoidentidad
    {
        public int IdTipoDocumento { get; set; }
        public string? TipoDocumento { get; set; }
        public int Estado { get; set; }
        public int UsuarioUpdate { get; set; }
        public DateTime FechaUpdate { get; set; }
    }
}
