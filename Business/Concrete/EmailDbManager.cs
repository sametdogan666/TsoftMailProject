using System.Collections.Generic;
using Business.BusinessAspects.Autofac;
using Business.Constants;
using Core.Utilities.Results;
using TsoftMailProject.Business.Abstract;
using TsoftMailProject.DataAccess.Abstract;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.Business.Concrete
{
    public class EmailDbManager : IEmailDbService
    {
        private IEmailDal _emailDal;

        public EmailDbManager(IEmailDal emailDal)
        {
            _emailDal = emailDal;
        }

        [SecuredOperation("admin")]
        public IResult Delete(EmailMessage emailMessage)
        {
            _emailDal.Delete(emailMessage);
            return new SuccessResult(Messages.deletedEmail);
        }
        [SecuredOperation("admin")]
        public List<EmailMessage> GetAll()
        {
            return _emailDal.GetAll();
        }
    }
}
