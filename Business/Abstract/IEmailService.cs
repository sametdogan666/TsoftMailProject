using System;
using System.Collections.Generic;
using Core.Utilities.Results;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.Business.Abstract
{
    public interface IEmailService
    {
        IDataResult<List<EmailMessage>> ReceiveAllEmail(bool isSaved = false);
        IDataResult<List<EmailMessage>> ReceiveLimitedEmail(int maxCount = 10, bool isSaved = false);
        IDataResult<List<EmailMessage>>  ReceiveUnreadEmail(bool isSaved = false);
        IDataResult<List<EmailMessage>>  ReceiveEmailByDay(DateTime start, DateTime end, bool isSaved = false);

    }
}
