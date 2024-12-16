using System.Globalization;
using DL;
using Microsoft.EntityFrameworkCore;
using static System.Net.Mime.MediaTypeNames;

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

                    var query = context.Empleados.FromSqlRaw($"EXEC EmpleadoGetAll");
                    if (query != null)
                    {
                        result.Objects = new List<object>();
                        foreach (var item in query)
                        {
                            ML.Empleado empleado = new ML.Empleado();
                            empleado.Nombre = item.Nombre;
                            empleado.Correo = item.Correo;
                            empleado.Sueldo = item.Sueldo.Value;
                            empleado.IdEmpleado = item.IdEmpleado;
                            empleado.FechaContrato = Convert.ToString(item.FechaContrato);

                            result.Objects.Add(empleado);
                        }
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Error al obtener los empleados";
                    }
                }
            }
            catch (Exception ex)
            {
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
                result.Correct = false;
            }

            return result;
        }
        public static ML.Result GetById(int IdEmpleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DdcrudAngularContext context = new DdcrudAngularContext())
                {
                    var query = context.Empleados.FromSqlRaw($"EXEC EmpleadoGetById {IdEmpleado}").AsEnumerable().FirstOrDefault();
                    if (query != null)
                    {
                        ML.Empleado empleado = new ML.Empleado();
                        empleado.Nombre = query.Nombre;
                        empleado.Correo = query.Correo;
                        empleado.Sueldo = empleado.Sueldo = query.Sueldo.HasValue ? query.Sueldo.Value : 0;                        ;
                        empleado.FechaContrato = Convert.ToString(query.FechaContrato);
                        empleado.IdEmpleado = query.IdEmpleado;

                        result.Object = empleado;
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Error al obtener el usuario";
                    }
                }
            }
            catch(Exception ex)
            {
                result.Ex = ex;
                result.ErrorMessage = ex.Message;
                result.Correct = false;
            }
            return result;
        }
        public static ML.Result Add(ML.Empleado empleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DdcrudAngularContext context = new DdcrudAngularContext())
                {
                    var query = context.Database.ExecuteSqlRaw(
                         "EXEC EmpleadoAdd " +
                            $"'{empleado.Nombre}', " +
                            $"'{empleado.Correo}', " +
                            $"'{empleado.Sueldo}', " +
                            $"'{empleado.FechaContrato}' " );
                    if (query != 0)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                    }
                }
            }catch(Exception ex)
            {
                result.ErrorMessage = ex.Message;
                result.Correct = false;
                result.Ex = ex;
            }
            return result;
        }
        public static ML.Result Update(ML.Empleado empleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using(DdcrudAngularContext context = new DdcrudAngularContext())
                {
                    var query = context.Database.ExecuteSqlRaw($"EXEC EmpleadoUpdate '{empleado.IdEmpleado}', " +
                        $"'{empleado.Nombre}', " +
                        $"'{empleado.Correo}', " +
                        $"'{empleado.Sueldo}', " +
                        $"'{empleado.FechaContrato}'");
                    if (query > 0)
                    {
                        result.Correct = true;
                        result.Object = empleado;
                        result.ErrorMessage = "Empleado Actualizado";
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Error al actualizar";
                    }
                }
            }
            catch (Exception ex)
            {
                result.ErrorMessage = ex.Message;
                result.Correct = false;
                result.Ex = ex;
            }
            return result;
        }
        public static ML.Result Delete(int IdEmpleado)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (DdcrudAngularContext context = new DdcrudAngularContext())
                {
                    var query = context.Database.ExecuteSqlRaw($"EXEC EmpleadoDelete '{IdEmpleado}'");
                    if(query > 0)
                    {
                        result.Correct = true;
                        result.ErrorMessage = "Empleado eliminado";                        
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Error al eliminar";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
    }
}
