using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.DataAccess.Abstract
{
    public interface IEmailDal
    {
        void Add(EmailMessage emailMessage);
        void Delete(EmailMessage emailMessage);
        List<EmailMessage> GetAll(Expression<Func<EmailMessage, bool>> filter = null);
    }
}
