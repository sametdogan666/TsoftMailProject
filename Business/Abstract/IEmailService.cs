using System;
using System.Collections.Generic;
using Core.Utilities.Results;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.Business.Abstract
{
    public interface IEmailService
    {
        //void Send(EmailMessage emailMessage);
        IDataResult<List<EmailMessage>> ReceiveAllEmail(string isSaved = "n");
        IDataResult<List<EmailMessage>> ReceiveLimitedEmail(int maxCount = 10, string isSaved = "n");
        IDataResult<List<EmailMessage>>  ReceiveUnreadEmail();
        IDataResult<List<EmailMessage>>  ReceiveEmailByDay(DateTime start, DateTime end, string isSaved = "n");

    }
}
