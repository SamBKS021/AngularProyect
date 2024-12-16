using System.Globalization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace WebApiCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadoController : ControllerBase
    {
        [HttpGet]
        [Route("GetAll")]
        public IActionResult GetAll()
        {
            ML.Result result = BL.Empleado.GetAll();
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }
        [HttpGet]
        [Route("GetById/{IdEmpleado}")]
        public IActionResult GetById(int IdEmpleado)
        {
            ML.Result result = BL.Empleado.GetById(IdEmpleado);
            if (result.Correct)
            {
                return Ok(result);

            }
            else
            {
                return BadRequest(result);
            }

        }
        [HttpPost]
        [Route("Add")]
        public IActionResult Add([FromBody] ML.Empleado empleado)
        {
            DateTime defaultFecha = DateTime.Now;

            DateTime fecha = !string.IsNullOrEmpty(empleado.FechaContrato)
            ? DateTime.ParseExact(empleado.FechaContrato, "dd/MM/yyyy", CultureInfo.InvariantCulture)
            : defaultFecha;

            string fechaFormateada = fecha.ToString("yyyy-MM-dd");

            empleado.FechaContrato = fechaFormateada;

            ML.Result result = BL.Empleado.Add(empleado);
            if (result.Correct)
            {

                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }
        [HttpPut]
        [Route("Update")]
        public IActionResult Update([FromBody] ML.Empleado empleado)
        {
            DateTime defaultFecha = DateTime.Now;

            DateTime fecha = !string.IsNullOrEmpty(empleado.FechaContrato)
            ? DateTime.ParseExact(empleado.FechaContrato, "dd/MM/yyyy", CultureInfo.InvariantCulture)
            : defaultFecha;

            string fechaFormateada = fecha.ToString("yyyy-MM-dd");

            empleado.FechaContrato = fechaFormateada;
            
            ML.Result result = BL.Empleado.Update(empleado);
            if (result.Correct)
            {
                return Ok(result);

            }
            return BadRequest(result);
        }
        [HttpDelete]
        [Route("Delete/{IdEmpleado}")]
        public IActionResult Delete(int IdEmpleado)
        {
            ML.Result result = BL.Empleado.Delete(IdEmpleado);
            if (result.Correct)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }

    }
}
