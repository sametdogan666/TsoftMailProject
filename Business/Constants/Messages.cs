using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Constants
{
    public class Messages
    {
        public static string ReceiveAllEmail = "Tüm mailler getirildi";
        public static string ReceiveLimitedEmail = "Belirtilen sayıda mail getirildi";
        public static string ReceiveEmailByDay = "Belirtilen tarihler arasındaki mailler getirildi";
        public static string ReceiveUnreadEmail = "Okunmamış mailler getirildi";

        public static string UserAdded = "Kullanıcı eklendi";
        public static string UserDeleted = "Kullanıcı silindi";
        public static string UserUpdated = "Kullanıcı güncellendi";
        public static string UserListed = "Kullanıcılar listelendi";

        public static string AuthorizationDenied = "Yetkiniz yok";
        public static string UserRegistered = "Kayıt oldu";
        public static string UserNotFound = "Kullanıcı bulunamadı";
        public static string PasswordError = "Hatalı parola";
        public static string SuccessfulLogin = "Giriş başarılı";
        public static string UserAlreadyExists = "Kullancı mevcut";
        public static string AccessTokenCreated = "Erişim jetonu oluşturuldu";
    }
}
