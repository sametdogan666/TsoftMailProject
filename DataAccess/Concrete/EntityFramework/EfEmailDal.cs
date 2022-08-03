using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using TsoftMailProject.DataAccess.Abstract;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.DataAccess.Concrete.EntityFramework
{
    public class EfEmailDal : IEmailDal
    {
        public void Add(EmailMessage emailMessage)
        {

            using (TSoftMailProjectContext context = new TSoftMailProjectContext())
            {
                var addedEntity = context.Entry(emailMessage);
                addedEntity.State = EntityState.Added;
                context.SaveChanges();
            }

        }

        public void Delete(EmailMessage emailMessage)
        {
            using (TSoftMailProjectContext context = new TSoftMailProjectContext())
            {
                var deletedEntity = context.Entry(emailMessage);
                deletedEntity.State = EntityState.Deleted;
                context.SaveChanges();
            }
        }

        public List<EmailMessage> GetAll(Expression<Func<EmailMessage, bool>> filter = null)
        {
            using (TSoftMailProjectContext context = new TSoftMailProjectContext())
            {
                return filter == null
                    ? context.Set<EmailMessage>().ToList()
                    : context.Set<EmailMessage>().Where(filter).ToList();
            }
        }
    }
}
