using System.Collections.Generic;
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


        public void Delete(EmailMessage emailMessage)
        {
            _emailDal.Delete(emailMessage);
        }

        public List<EmailMessage> GetAll()
        {
            return _emailDal.GetAll();
        }
    }
}
