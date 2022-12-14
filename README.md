## Başlarken

Çok katmanlı mimari örneği olan bu proje başlıca Business,DataAccess,Core,Entities ve WebAPI katmanlarından oluşmaktadır.
Bu proje mail servisinden gelen maillerin; tümünü görüntüleme, okunmamış mailleri görüntüleme, belirtilen tarih aralığındaki mailleri görüntüleme, belirtilen adet kadar mail görüntüleme işlemlerini gerçekleştirir.
Opsiyonel olarak veritabanına kaydetme ve silme işlemleri de gerçekleştirilir.

 ### Veritabanı Etkinleştirme

 ## Microsoft Sql Server
 `script.sql` içinde `7.` ve `9.` satırda bulunan dosya yolu kullanıcının bilgisayarına göre düzenlenmelidir. Bu işlemden sonra `script.sql` dosyası mevcut veritabanı üzerinde çalıştırılmalıdır (SQLServer).
  Eğer aynı isimde veritabanı varsa script içinde değişiklik yapılmalıdır. Veritabanı ismi veya sunucu ismi farklıysa `DataAccess/Concrete/EntityFramework/TSoftMailProjectContext.cs` dosyasındaki bağlantı adresi buna göre değiştirilmelidir.

  ## PostgreSql
  'postgreScript' dosyası mevcut veritabanı üzerinde çalıştırılmalıdır.
  Eğer aynı isimde veritabanı varsa script içinde değişiklik yapılmalıdır. Veritabanı ismi veya sunucu ismi farklıysa `DataAccess/Concrete/EntityFramework/TSoftMailProjectPostgreContext.cs` dosyasındaki bağlantı adresi buna göre değiştirilmelidir.

  ### Veritabanı Seçimi

`DataAccess/Concrete/EntityFramework/' içerisinde yer alan Dal etiketi ile biten sınıflar için Ms Sql Server için TSoftMailProjectContext sınıfı,
PostgreSql için TSoftMailProjectPostgreContext sınıfı EfEntityRepositoryBase içerisine referans olarak verilmelidir.

  ### Mail Hesabı Konfigürasyonu
  <br>

  - <b> [Kullanılacak mail adresi için POP ve IMAP izinleri verilmelidir.](https://support.google.com/a/answer/105694?hl=tr)  
  </b>
   <br>

  - <b> 'appsettings.json' dosyasında SmtpUsername, SmtpPassword, PopUsername ve PopPassword alanlarını doldurunuz. [Gmail üzerinden uygulama şifresini almayı bilmiyorsanız yönergeyi izleyebilirsiniz.](https://support.google.com/a/answer/105694?hl=tr)  
  </b>


## Paketler

### Business
-Autofac(6.4.0)<br/>
-Autofac.Extras.DynamicProxy(6.0.1)<br/>
-Autofac.Extensions.DependencyInjection(8.0.0)<br/>
-GemBox.Email(15.0.1153)<br/>
-MailKit(3.3.0)<br/>

### Core
-Autofac(6.4.0)<br/>
-Autofac.Extensions.DependencyInjection(8.0.0)<br/>
-Autofac.Extras.DynamicProxy(6.0.1)<br/>
-FluentValidation(11.1.0)<br/>
-Microsoft.AspNetCore.Http(2.2.2)<br/>
-Microsoft.AspNetCore.Http.Abstractions(2.2.0)<br/>
-Microsoft.EntityFrameworkCore(5.0.17)<br/>
-Microsoft.Extensions.Caching.Abstractions(6.0.0)<br/>
-Microsoft.Extensions.Configuration(6.0.1)<br/>
-Microsoft.Extensions.Configuration.Binder(6.0.0)<br/>
-System.IdentityModel.Tokens.Jwt(6.22.0)

### DataAccess
-Microsoft.EntityFrameworkCore.SqlServer(5.0.17)<br/>

### EmailService
-MailKit(3.3.0)

### WebAPI
-Swashbuckle.AspNetCore(5.6.3)<br/>
-Microsoft.AspNetCore.Authentication.JwtBearer(5.0.17)<br/>

## Desteklenen Veritabanları

### Microsoft SQL Server 18

### PostgreSQL 14

