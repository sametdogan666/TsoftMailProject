using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading;
using Business.BusinessAspects.Autofac;
using Business.Constants;
using Core.Utilities.Results;
using GemBox.Email.Imap;
using GemBox.Email.Security;
using MailKit;
using MailKit.Net.Pop3;
using MailKit.Net.Smtp;
using MailKit.Search;
using MimeKit;
using MimeKit.Text;
using TsoftMailProject.Business.Abstract;
using TsoftMailProject.Configuration.Abstract;
using TsoftMailProject.DataAccess.Abstract;
using TsoftMailProject.Entities.Concrete;
using ImapClient = MailKit.Net.Imap.ImapClient;
using MailMessage = GemBox.Email.MailMessage;

namespace TsoftMailProject.Business.Concrete
{
    public class EmailManager : IEmailService
    {
        private readonly IEmailConfiguration _emailConfiguration;
        private IEmailDal _emailDal;

        public EmailManager(IEmailConfiguration emailConfiguration, IEmailDal emailDal)
        {
            _emailConfiguration = emailConfiguration;
            _emailDal = emailDal;
        }

        //public void Send(EmailMessage emailMessage)
        //{

        //    var message = new MimeMessage();
        //    message.To.AddRange(emailMessage.ToAddresses.Select(x => new MailboxAddress(x.Name, x.Address)));
        //    message.From.AddRange(emailMessage.FromAddresses.Select(x => new MailboxAddress(x.Name, x.Address)));

        //    message.Subject = emailMessage.Subject;

        //    message.Body = new TextPart(TextFormat.Html)
        //    {
        //        Text = emailMessage.Content
        //    };
        //    using (var emailClient = new SmtpClient())
        //    {

        //        emailClient.Connect(_emailConfiguration.SmtpServer, _emailConfiguration.SmtpPort, true);

        //        emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

        //        emailClient.Authenticate(_emailConfiguration.SmtpUsername, _emailConfiguration.SmtpPassword);

        //        emailClient.Send(message);

        //        emailClient.Disconnect(true);
        //    }
        //}

        [SecuredOperation("admin")]
        public IDataResult<List<EmailMessage>> ReceiveAllEmail(string isSaved = "n")
        {
            using (var emailClient = new Pop3Client())
            {
                emailClient.Connect(_emailConfiguration.PopServer, _emailConfiguration.PopPort, true);

                emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

                emailClient.Authenticate(_emailConfiguration.PopUsername, _emailConfiguration.PopPassword);

                List<EmailMessage> emails = new List<EmailMessage>();

                for (int i = 0; i < emailClient.Count; i++)
                {
                    var message = emailClient.GetMessage(i);
                    var emailMessage = new EmailMessage
                    {
                        MessageID = message.MessageId,
                        Content = message.TextBody,
                        Subject = message.Subject,
                        MessageDate = message.Date.DateTime,
                        FromAddresses = message.From.ToString(),
                        ToAddresses = message.To.ToString()
                    };
                    emails.Add(emailMessage);
                    if (isSaved.ToString() == "y")
                    {
                        _emailDal.Add(emailMessage);
                    }
                }

                //emailClient.Disconnect(true);
                return new SuccessDataResult<List<EmailMessage>>(emails, Messages.ReceiveAllEmail) ;
            }
        }
        //[SecuredOperation("admin")]
        public IDataResult<List<EmailMessage>> ReceiveLimitedEmail(int maxCount = 10, string isSaved = "n")
        {
            using (var emailClient = new Pop3Client())
            {
                emailClient.Connect(_emailConfiguration.PopServer, _emailConfiguration.PopPort, true);

                emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

                emailClient.Authenticate(_emailConfiguration.PopUsername, _emailConfiguration.PopPassword);

                List<EmailMessage> emails = new List<EmailMessage>();
                for (int i = 0; i < maxCount; i++)
                {
                    var message = emailClient.GetMessage(i);
                    var emailMessage = new EmailMessage
                    {
                        MessageID = message.MessageId,
                        Content = message.TextBody,
                        Subject = message.Subject,
                        MessageDate = message.Date.DateTime,
                        FromAddresses = message.From.ToString(),
                        ToAddresses = message.To.ToString()
                    };
                    emails.Add(emailMessage);
                    if (isSaved.ToString() == "y")
                    {
                        _emailDal.Add(emailMessage);
                    }
                }

                //emailClient.Disconnect(true);
                return new SuccessDataResult<List<EmailMessage>>(emails, Messages.ReceiveLimitedEmail) ;
            }




        }

        public IDataResult<List<EmailMessage>> ReceiveUnreadEmail()
        {

            using (var emailClient = new ImapClient())
            {
                emailClient.Connect("imap.gmail.com", 993, true);

                emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

                emailClient.Authenticate(_emailConfiguration.PopUsername, _emailConfiguration.PopPassword);

                var items = emailClient.Inbox.Fetch(0, -1,
                    MessageSummaryItems.UniqueId | MessageSummaryItems.Envelope);

                List<EmailMessage> emails = new List<EmailMessage>(); ;

                foreach (var item in items)
                {
                    var emailMessage = new EmailMessage
                    {
                        MessageID = item.Envelope.MessageId,
                        Content = item.TextBody.ToString(),
                        Subject = item.Envelope.Subject,
                        MessageDate = item.Date.DateTime,
                        FromAddresses = item.Envelope.From.ToString(),
                        ToAddresses = item.Envelope.To.ToString()
                    };
                    emails.Add(emailMessage);
                }
                //client.Disconnect(true);
                return new SuccessDataResult<List<EmailMessage>>(emails, Messages.ReceiveUnreadEmail) ;
            }
        }
        //[SecuredOperation("admin")]
        public IDataResult<List<EmailMessage>> ReceiveEmailByDay(DateTime start, DateTime end, string isSaved = "n")
        {
            using (var emailClient = new Pop3Client())
            {
                emailClient.Connect(_emailConfiguration.PopServer, _emailConfiguration.PopPort, true);

                emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

                emailClient.Authenticate(_emailConfiguration.PopUsername, _emailConfiguration.PopPassword);

                List<EmailMessage> emails = new List<EmailMessage>();

                for (int i = 0; i < emailClient.Count; i++)
                {
                    var message = emailClient.GetMessage(i);
                    if (start <= message.Date.DateTime && message.Date.DateTime <= end)
                    {
                        var emailMessage = new EmailMessage
                        {
                            MessageID = message.MessageId,
                            Content = message.TextBody,
                            Subject = message.Subject,
                            MessageDate = message.Date.DateTime,
                            FromAddresses = message.From.ToString(),
                            ToAddresses = message.To.ToString()
                        };
                        emails.Add(emailMessage);
                        if (isSaved.ToString() == "y")
                        {
                            _emailDal.Add(emailMessage);
                        }
                    }
                }

                //emailClient.Disconnect(true);
                return new SuccessDataResult<List<EmailMessage>>(emails, Messages.ReceiveEmailByDay);
            }
        }

    }
}
