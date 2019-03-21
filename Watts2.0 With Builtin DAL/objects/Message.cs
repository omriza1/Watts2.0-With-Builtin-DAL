using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Watts2._0_With_Builtin_DAL.objects
{
    public class Message
    {
        private int senderID;
        private string content;
        private int receiverID;
        private string time;
        public Message(int senderID, string content, int receiverID, string time)
        {

            this.senderID = senderID;
            this.content = content;
            this.receiverID = receiverID;
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
        public string GetReciver()
        {
            return DAL.UserMethods.getUserName(receiverID);
        }
        public string GetTime()
        {
            return time;
        }
    }
}