using Microsoft.AspNetCore.Mvc;
using WebApp.Models;

namespace WebApp.Controllers;
public class BlogController : BaseController
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