## Başlarken

Çok katlı mimari örneği olan bu proje başlıca Business,DataAccess,Core,Entities ve WebAPI katmanlarından oluşmaktadır.
Bu proje mail Servisinden gelen maillerin tümünü görüntüleme, okunmamış mailleri görüntüleme, belirtilen tarih aralığındaki mailleri görüntüleme, belirtilen adet kadar mail görüntüleme işlemlerini gerçekleştirir.
Opsiyonel olarak veritabanına kaydetme ve silme işlemleri de gerçekleştirilir.

 ### Veritabanı Etkinleştirme

 `script.sql` içinde `7.` ve `9.` satırda bulunan dosya yolu kullanıcının bilgisayarına göre düzenlenmelidir. Bu işlemden sonra `script.sql` dosyası mevcut veritabanı üzerinde çalıştırılmalıdır (SQLServer).
  Eğer aynı isimde veritabanı varsa script içinde değişiklik yapılmalıdır. Veritabanı ismi veya sunucu ismi farklıysa `DataAccess/Concrete/EntityFramework/ReCapProjectContext.cs` dosyasındaki bağlantı adresi buna göre değiştirilmelidir.

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

## Updates

### 1.Gün Görevi
-Entities, DataAccess, Business ve Console katmanlarını oluşturuldu. <br/>
-Bir *Car* nesnesi oluşturulup,Id, BrandId, ColorId, ModelYear, DailyPrice, Description alanları eklendi <br/>
-InMemory formatta GetById, GetAll, Add, Update, Delete oprasyonları yazıldı. <br/>

