using Core.Entities.Concrete;
using Microsoft.EntityFrameworkCore;
using TsoftMailProject.Entities.Concrete;

namespace TsoftMailProject.DataAccess.Concrete.EntityFramework
{
    public class TSoftMailProjectContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=LAPTOP-05OJ6C2N\SQLEXPRESS;Database=TSoftMailProjectDB;Trusted_Connection=true");
        }

        public DbSet<EmailMessage> EmailMessages { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserOperationClaim> UserOperationClaims { get; set; }
        public DbSet<OperationClaim> OperationClaims { get; set; }
    }
}
