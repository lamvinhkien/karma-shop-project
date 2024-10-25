using WebApp.Services;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddMvc();
builder.Services.AddScoped<VnPayService>();
builder.Services.Configure<VnPay>(builder.Configuration.GetSection("Payment:VnPay"));
builder.Services.AddHttpContextAccessor();

var app = builder.Build();
app.UseStaticFiles();
app.MapDefaultControllerRoute();

app.Run();
