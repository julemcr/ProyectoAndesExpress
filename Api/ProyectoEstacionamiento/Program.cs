//var builder = WebApplication.CreateBuilder(args);
//builder.Services.AddControllers();
//var app = builder.Build();
//app.UseHttpsRedirection();
//app.UseAuthorization();
//app.MapControllers();
//app.Run();

var builder = WebApplication.CreateBuilder(args);

// Habilita CORS para todo
builder.Services.AddCors(options =>
{
    options.AddPolicy("PermitirTodo", policy =>
    {
        policy
            .AllowAnyOrigin()
            .AllowAnyHeader()
            .AllowAnyMethod();
    });
});

builder.Services.AddControllers();

var app = builder.Build();

// Aplica la política antes de los endpoints
app.UseCors("PermitirTodo");

app.UseHttpsRedirection();
app.UseAuthorization();

app.MapControllers();

app.Run();
