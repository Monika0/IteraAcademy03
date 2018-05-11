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
    [Route("post")]
    public class PostsController : Controller
    {
        private BloggingPlatformContext _context;

        public PostsController(BloggingPlatformContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IEnumerable<Posts> GetPosts()
        {
            return _context.Posts;
        }
    }
}