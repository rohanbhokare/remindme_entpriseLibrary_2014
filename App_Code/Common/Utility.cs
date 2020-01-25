using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Security;
using System.Text;

using System.Configuration;

using System.Net;
using System.Net.Mail;

namespace NIT.RemindMe.Common

{
    public class Utility
    {
        #region Class Protected Fields
        protected string sqlCommandText = string.Empty;
        #endregion

        #region Constructor
        public Utility()
        {
        }
        #endregion

        #region Public Properties
        public string SortOn
        {
            get;
            set;
        }
        public string SortBy
        {
            get;
            set;
        }
        #endregion

        #region Class Public Method
        public string GetEncryptedData(string PlainText, string Key)
        {
            var PlainTextByte = Encoding.UTF8.GetBytes(PlainText);
            var EncryptedValue = Convert.ToBase64String(MachineKey.Protect(PlainTextByte, Key));
            return EncryptedValue;
        }
        public string GetDecryptedData(string EncryptedText, string Key)
        {
            var Bytes = Convert.FromBase64String(EncryptedText);
            var output = MachineKey.Unprotect(Bytes, Key);
            string decrypttext = Encoding.UTF8.GetString(output);
            return decrypttext;
        }

        //public void SendMail(string Subject, string Message)
        public void SendMail(string ToMail, string Subject, string Message)
        {
            MailMessage objMailMessage = new MailMessage();
            objMailMessage.From = new MailAddress(ConfigurationManager.AppSettings["WebMaster"], "RemindMe");
            objMailMessage.To.Add(new MailAddress(ToMail));
            objMailMessage.Subject = Subject;
            objMailMessage.Body = Message;
            objMailMessage.IsBodyHtml = true;
            objMailMessage.Priority = MailPriority.High;

            //System.Net.NetworkCredential objNetworkCredential = new System.Net.NetworkCredential("rohanbhokre92@gmail.com", "rohan_123");

            SmtpClient objSmtpClient = new SmtpClient();
            objSmtpClient.Host = ConfigurationManager.AppSettings["Host"];
            objSmtpClient.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
           // objSmtpClient.Credentials = objNetworkCredential;
            objSmtpClient.EnableSsl = true;
            objSmtpClient.Send(objMailMessage);
        }
        #endregion
    }
}