using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using Core.DataAccess;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.DataAccess.Abstract
{
    public interface IEmailDal: IEntityRepository<EmailMessage>
    {
       
    }
}
