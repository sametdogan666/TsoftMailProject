using System.Collections.Generic;
using System.Threading.Channels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TsoftMailProject.Business.Abstract;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmailDbController : ControllerBase
    {
        private IEmailDbService _emailDbService;

        public EmailDbController(IEmailDbService emailDbService)
        {
            _emailDbService = emailDbService;
        }


        [HttpGet("getall")]
        public List<EmailMessage> GetAll()
        {
            var result =  _emailDbService.GetAll();
            return result;
        }

        [HttpPost("delete")]
        public IActionResult Delete(EmailMessage emailMessage)
        {
            _emailDbService.Delete(emailMessage);
            return RedirectToAction();
        }

    }
}
