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
    [Route("author")]
    public class AuthorsController : Controller
    {
        private BloggingPlatformContext _context;

        public AuthorsController(BloggingPlatformContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IEnumerable<Authors> GetAuthors()
        {
            return _context.Authors;
        }
    }
}