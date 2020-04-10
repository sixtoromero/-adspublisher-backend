using System;
using System.Collections.Generic;
using System.Text;

namespace AdsPublisher.Domain.Entity
{
    public class Facturas
    {
        public int IDFactura { get; set; }
        public int? IDMicroEmpresa { get; set; }
        public int? IDPlan { get; set; }
        public DateTime? FechaCreacion { get; set; }
    }
}
