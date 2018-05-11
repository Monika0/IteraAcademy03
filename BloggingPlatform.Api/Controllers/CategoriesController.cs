using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BloggingPlatform.Db.Model;

namespace BloggingPlatform.Api.Controllers
{
    [Produces("application/json")]
    [Route("category")]
    public class CategoriesController : Controller
    {
        private BloggingPlatformContext _context;

        public CategoriesController(BloggingPlatformContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IEnumerable<Categories> GetCategories()
        {
            return _context.Categories;
        }

        [HttpPost]
        public void CreateCategories([FromBody] Categories category)
        {
            _context.Categories.Add(category);
            _context.SaveChanges();
        }
    }
}