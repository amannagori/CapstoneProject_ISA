using ISA_Project.ISUSMSWebService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISA_Project
{
    public class SMSService
    {

        public string Provider { get; set; }
        public string Number { get; set; }
        public string Message { get; set; }

        public SMSService(string provider, string number, string message)
        {
            Provider = provider;
            Number = number;
            Message = message;
        }

        public void SendTextMessage(SMSService textMessage)
        {
            var sms = new SUSMSClient();
            sms.sendSMS(textMessage.Provider, textMessage.Number, textMessage.Message);
        }
    }
}
