using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Core.DataAccess.EntityFramework;
using Microsoft.EntityFrameworkCore;
using TsoftMailProject.DataAccess.Abstract;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.DataAccess.Concrete.EntityFramework
{
    public class EfEmailDal : EfEntityRepositoryBase<EmailMessage, TSoftMailProjectContext>, IEmailDal
    {

    }
}
