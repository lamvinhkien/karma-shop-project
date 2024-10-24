using Microsoft.AspNetCore.Mvc;
using WebApp.Models;

namespace WebApp.Controllers;
public class CategoryController : BaseController
{
    public IActionResult Index()
    {
        return View();
    }
}