using System;
using System.Collections.Generic;

namespace DL;

public partial class Empleado
{
    public int IdEmpleado { get; set; }

    public string? Nombre { get; set; }

    public string? Correo { get; set; }

    public decimal? Sueldo { get; set; }

    public DateOnly? FechaContrato { get; set; }
}
