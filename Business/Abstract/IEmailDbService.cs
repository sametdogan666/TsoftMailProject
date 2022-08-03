using System.Collections.Generic;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.Business.Abstract
{
    public interface IEmailDbService
    {
        void Delete(EmailMessage emailMessage);
        List<EmailMessage> GetAll();
    }
}
