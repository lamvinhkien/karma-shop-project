using Microsoft.AspNetCore.Mvc;
using WebApp.Models;

namespace WebApp.Controllers;
public class HomeController : BaseController
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Details()
    {
        return View();
    }
}