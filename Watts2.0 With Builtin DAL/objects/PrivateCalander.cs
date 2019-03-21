using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Watts2._0_With_Builtin_DAL.objects
{
    public class PrivateCalander
    {
        private string EventName;
        private string EventDate;
        private string EventTime;
        private string UserName1;
        private string UserName2;

        public PrivateCalander(string EventName, string EventDate, string EventTime, string UserName1, string UserName2)
        {
            this.EventName = EventName;
            this.EventDate = EventDate;
            this.EventTime = EventTime;
            this.UserName1 = UserName1;
            this.UserName2 = UserName2;
        }

        public string getEventName()
        {
            return EventName;
        }
        public string getEventDate()
        {
            return EventDate;
        }
        public string getEventTime()
        {
            return EventTime;
        }
        public string getUserName1()
        {
            return UserName1;
        }
        public string getUserName2()
        {
            return UserName2;
        }
    }
}