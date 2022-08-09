using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Core.Entities.Concrete;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using TsoftMailProject.Entities.Concrete;

namespace DataAccess.Concrete.EntityFramework
{
    public class TSoftMailProjectPostgreContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseNpgsql("Server=localhost;Database=TSoftMailProjectDB;Port=5432;User Id=postgres;Password=12345");
        }

        public DbSet<EmailMessage> EmailMessages { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserOperationClaim> UserOperationClaims { get; set; }
        public DbSet<OperationClaim> OperationClaims { get; set; }


       
    }

}

