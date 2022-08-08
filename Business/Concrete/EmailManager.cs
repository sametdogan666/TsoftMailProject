using System;
using System.Collections.Generic;
using System.Linq;
using Business.BusinessAspects.Autofac;
using Business.Constants;
using Core.Utilities.Business;
using Core.Utilities.Results;
using MailKit;
using MailKit.Net.Imap;
using MailKit.Net.Pop3;
using MailKit.Search;
using TsoftMailProject.Business.Abstract;
using TsoftMailProject.Configuration.Abstract;
using TsoftMailProject.DataAccess.Abstract;
using TsoftMailProject.DataAccess.Concrete.EntityFramework;
using TsoftMailProject.Entities.Concrete;



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

        [SecuredOperation("admin")]
        public IDataResult<List<EmailMessage>> ReceiveAllEmail(bool isSaved = false)
        {
            using (var emailClient = new Pop3Client())
            {
                emailClient.Connect(_emailConfiguration.PopServer, _emailConfiguration.PopPort, true);

                emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

                emailClient.Authenticate(_emailConfiguration.PopUsername, _emailConfiguration.PopPassword);

                List<EmailMessage> emails = new List<EmailMessage>();

                for (int i = emailClient.Count; i > 0; i--)
                {
                    var message = emailClient.GetMessage(i - 1);
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
                    if (isSaved == true)
                    {
                        var result = BusinessRules.Run(CheckIsMailAlreadySaved(emailMessage));

                        if (result == null)
                        {
                            _emailDal.Add(emailMessage);
                        }
                    }
                }
                return new SuccessDataResult<List<EmailMessage>>(emails, Messages.ReceiveAllEmail);
            }
        }

        [SecuredOperation("admin")]
        public IDataResult<List<EmailMessage>> ReceiveLimitedEmail(int maxCount = 10, bool isSaved = false)
        {
            using (var emailClient = new ImapClient())
            {
                emailClient.Connect("imap.gmail.com", 993, true);

                emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

                emailClient.Authenticate(_emailConfiguration.PopUsername, _emailConfiguration.PopPassword);

                emailClient.Inbox.Open(MailKit.FolderAccess.ReadWrite);

                var uids = emailClient.Inbox.Search(SearchQuery.All).Reverse();

                List<EmailMessage> emails = new List<EmailMessage>(); ;
                foreach (var uid in uids)
                {
                    var message = emailClient.Inbox.GetMessage(uid);

                    if (maxCount > 0)
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
                        if (isSaved == true)
                        {
                            var result = BusinessRules.Run(CheckIsMailAlreadySaved(emailMessage));

                            if (result == null)
                            {
                                _emailDal.Add(emailMessage);
                            }
                        }
                    }

                    maxCount--;
                }
                return new SuccessDataResult<List<EmailMessage>>(emails, Messages.ReceiveUnreadEmail);
            }
        }
        [SecuredOperation("admin")]
        public IDataResult<List<EmailMessage>> ReceiveUnreadEmail(bool isSaved = false)
        {

            using (var emailClient = new ImapClient())
            {
                emailClient.Connect("imap.gmail.com", 993, true);

                emailClient.AuthenticationMechanisms.Remove("XOAUTH2");

                emailClient.Authenticate(_emailConfiguration.PopUsername, _emailConfiguration.PopPassword);

                emailClient.Inbox.Open(MailKit.FolderAccess.ReadWrite);

                var uids = emailClient.Inbox.Search(SearchQuery.NotSeen);

                List<EmailMessage> emails = new List<EmailMessage>(); ;
                foreach (var uid in uids)
                {
                    var message = emailClient.Inbox.GetMessage(uid);

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
                    if (isSaved == true)
                    {
                        var result = BusinessRules.Run(CheckIsMailAlreadySaved(emailMessage));

                        if (result == null)
                        {
                            _emailDal.Add(emailMessage);
                        }
                    }
                }
                return new SuccessDataResult<List<EmailMessage>>(emails, Messages.ReceiveUnreadEmail);
            }
        }
        [SecuredOperation("admin")]
        public IDataResult<List<EmailMessage>> ReceiveEmailByDay(DateTime start, DateTime end, bool isSaved = false)
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
                        if (isSaved == true)
                        {
                            var result = BusinessRules.Run(CheckIsMailAlreadySaved(emailMessage));

                            if (result == null)
                            {
                                _emailDal.Add(emailMessage);
                            }

                        }
                    }
                }
                return new SuccessDataResult<List<EmailMessage>>(emails, Messages.ReceiveEmailByDay);
            }
        }

        private IResult CheckIsMailAlreadySaved(EmailMessage emailMessage)
        {
            var result = _emailDal.Get(e => e.MessageID == emailMessage.MessageID);
            if (result != null)
            {
                return new ErrorResult(Messages.EmailAlreadyExists);
            }
            return new SuccessResult();
        }

    }
}
