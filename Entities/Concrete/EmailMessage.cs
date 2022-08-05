#nullable enable
using System;
using System.Collections.Generic;
using Core.Entities;

namespace TsoftMailProject.Entities.Concrete
{
    public class EmailMessage : IEntity
    {

        public int ID { get; set; }
        public string MessageID { get; set; }
        public string FromAddresses { get; set; }
        public string ToAddresses { get; set; }
        public string Subject { get; set; }
        public string Content { get; set; }
        public DateTime MessageDate { get; set; }
    }
}
