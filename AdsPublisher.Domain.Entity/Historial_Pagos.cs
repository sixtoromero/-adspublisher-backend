using System;
using System.Collections.Generic;
using System.Text;

namespace AdsPublisher.Domain.Entity
{
    public class Historial_Pagos
    {
        public int IDHistorialPago { get; set; }
        public int? IDFactura { get; set; }
        public DateTime? FechaCreacion { get; set; }
    }
}
