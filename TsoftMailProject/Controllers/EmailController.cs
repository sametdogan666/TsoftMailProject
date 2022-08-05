using System;
using System.Collections.Generic;
using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MimeKit;
using MimeKit.Text;
using TsoftMailProject.Business.Abstract;
using TsoftMailProject.Entities.Concrete;

namespace EmailApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmailController : ControllerBase
    {
        private IEmailService _emailService;

        public EmailController(IEmailService emailService)
        {
            _emailService = emailService;
        }


        //[HttpPost("sendemail")]
        //public IActionResult SendEmail(EmailMessage request)
        //{
        //    _emailService.Send(request);
        //    return Ok();
        //}
        [HttpGet("receiveallemail")]
        public IActionResult ReceiveAllEmail(string isSaved = "n")
        {
            var result = _emailService.ReceiveAllEmail(isSaved);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("receivelimitedemail")]
        public IActionResult ReceiveLimitedEmail(int maxCount = 10, string isSaved = "n")
        {
            var result = _emailService.ReceiveLimitedEmail(maxCount, isSaved);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("receiveunreademail")]
        public IActionResult ReceiveUnreadEmail()
        {
            var result = _emailService.ReceiveUnreadEmail();
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpGet("receiveemailbyday")]
        public IActionResult ReceiveEmailByDay(DateTime start, DateTime end, string isSaved = "n")
        {
            var result = _emailService.ReceiveEmailByDay(start, end, isSaved);
            if (result.Success)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

    }
}
