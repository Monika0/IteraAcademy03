using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BloggingPlatform.Db.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BloggingPlatform.Api.Controllers
{
    public class DBController : Controller
    {
        public BloggingPlatformContext _context;
        public DBController(BloggingPlatformContext context) : base()
        {
            _context = context;
        }
    }
}