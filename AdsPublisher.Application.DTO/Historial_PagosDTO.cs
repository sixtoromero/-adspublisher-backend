using System;
using System.Collections.Generic;
using System.Text;

namespace AdsPublisher.Application.DTO
{
    public class Historial_PagosDTO
    {
        public int IDHistorialPago { get; set; }
        public int? IDFactura { get; set; }
        public DateTime? FechaCreacion { get; set; }
    }
}
