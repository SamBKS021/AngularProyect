using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();

// Configuraci�n de Swagger/OpenAPI
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Configuraci�n de CORS para permitir cualquier origen
builder.Services.AddCors(options =>
{
    options.AddPolicy("PermitirTodos", policy =>
    {
        policy.AllowAnyOrigin()  // Permite cualquier origen
              .AllowAnyHeader()  // Permite cualquier encabezado
              .AllowAnyMethod(); // Permite cualquier m�todo HTTP
    });
});

// Configuraci�n de base de datos (si la tienes en uso en tu contexto)
string connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<DL.DdcrudAngularContext>(options =>
    options.UseSqlServer(connectionString));

var app = builder.Build();

// Configurar el pipeline HTTP.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Habilitar CORS antes de los controladores
app.UseCors("PermitirTodos");

app.UseAuthorization();

app.MapControllers();

app.Run();
