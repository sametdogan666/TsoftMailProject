using System.Collections.Generic;
using Core.Utilities.Results;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.Business.Abstract
{
    public interface IEmailDbService
    {
        IResult Delete(EmailMessage emailMessage);
        List<EmailMessage> GetAll();
    }
}
