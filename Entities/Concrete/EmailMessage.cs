using System;
using System.Collections.Generic;

namespace TsoftMailProject.Entities.Concrete
{
    public class EmailMessage
    {
        //public EmailMessage()
        //{
        //    ToAddresses = new List<EmailAddress>();
        //    FromAddresses = new List<EmailAddress>();
        //}
        public int ID { get; set; }
        public string MessageID { get; set; }
        public string FromAddresses { get; set; }
        public string ToAddresses { get; set; }
        //public List<EmailAddress> ToAddresses { get; set; }
        //public List<EmailAddress> FromAddresses { get; set; }
        public string Subject { get; set; }
        public string Content { get; set; }
        public DateTime MessageDate { get; set; }
    }
}
