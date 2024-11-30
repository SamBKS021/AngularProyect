using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApiCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadoController : ControllerBase
    {
        [HttpGet]
        [Route("Empleado/GetAll")]
        public IActionResult GetAll()
        {
            ML.Result result = BL.Empleado.GetAll();

            return Ok(result);
        }
    }
}
