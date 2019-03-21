using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Watts2._0_With_Builtin_DAL.objects
{
    public class EventCalander
    {
        private string EventName;
        public string Date; // dd/mm/yyyy
        public string time; //hh:mm
        public EventCalander(string EventName, string Date, string time)
        {
            this.EventName = EventName;
            this.Date = Date;
            this.time = time;
        }

        public string getEventName()
        {
            return EventName;
        }
        public string getDate()
        {
            return Date;
        }
        public string getTime()
        {
            return time;
        }
    }
}