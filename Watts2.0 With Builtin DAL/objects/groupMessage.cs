using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Watts2._0_With_Builtin_DAL.objects
{
    public class groupMessage
    {
        private int senderID;
        private string content;
        private string time;
        public groupMessage(int senderID, string content, string time)
        {

            this.senderID = senderID;
            this.content = content;
            this.time = time;
        }

        public string GetSender()
        {
            return DAL.UserMethods.getUserName(senderID);
        }
        public string GetContent()
        {
            return content;
        }
        public string GetTime()
        {
            return time;
        }
    }
}