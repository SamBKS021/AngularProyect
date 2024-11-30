using Microsoft.EntityFrameworkCore;

namespace BL
{
    public class Empleado
    {
        public static ML.Result GetAll()
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DL.DdcrudAngularContext context = new DL.DdcrudAngularContext())
                {
                    var query= context.Empleados.FromSqlRaw($"EXEC EmpleadoGetAll");
                    if (query != null)
                    {
                        foreach (var item in query) {
                            ML.Empleado empleado = new ML.Empleado();
                            empleado.Nombre = item.Nombre;
                            empleado.Correo = item.Correo;
                            empleado.Sueldo = item.Sueldo.Value;
                            empleado.IdEmpleado = item.IdEmpleado;
                            empleado.FechaContrato =Convert.ToString(item.FechaContrato.Value);
                        }
                        result.Correct = true;
                    }
                    result.Correct = false;
                    result.ErrorMessage = "Error al obtener los empleados";
                }
            } catch (Exception ex) {
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
                result.Correct = false;
            }
            
            return result;
        }
    }
}
