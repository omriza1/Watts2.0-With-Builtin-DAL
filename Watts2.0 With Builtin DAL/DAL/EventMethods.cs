using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Watts2._0_With_Builtin_DAL.DAL
{
    public class EventMethods
    {
        #region Select

        public static DataTable GetPrivateEvents(string user, string EventDate)
        {
            string com = "select distinct EventName, DATE_FORMAT(FROM_UNIXTIME(EventDate), '%d/%m/%Y') AS 'EventDate', EventTime from privatecalendar where UserID1=" + UserMethods.getIDOfUser(user) + " and EventDate = UNIX_TIMESTAMP(STR_TO_DATE('" + EventDate + "', '%d/%m/%Y')) order by EventTime ASC";
            //string com = "select distinct EventName, DATE_FORMAT(FROM_UNIXTIME(EventDate), '%d/%m/%Y') AS 'EventDate',EventTime from privatecalendar where UserID1=" + UserMethods.getIDOfUser(user) + "and EventDate =" + int.Parse(EventDate) + " order by EventTime ASC";
            return dal.GetTable(com);
        }

        public static DataTable GetGroupEvents(string GroupName, string EventDate)
        {
            string com = "select EventName,EventDate,EventTime from groupcalendar where GroupName ='" + GroupName + "'";
            return dal.GetTable(com);
        }
        #endregion

        #region Insert
        public static void AppointEventPrivate(string EventName, string User1, string User2, string EventDate, string EventTime)
        {
            string com = "insert into privatecalendar (EventName,EventDate,UserID1,UserID2,EventTime) values('" + EventName + "', UNIX_TIMESTAMP(STR_TO_DATE('" + EventDate + "','%d/%m/%Y'))," + User1 + ",User2,TIME_FORMAT('" + EventTime + "','%k:%i %p'))";
            dal.Execute(com);
        }

        public static void AppointEventGroup(string EventName, string GroupName, string EventDate)
        {
            string com = "insert into groupcalendar (EventName,EventDate,GroupID) values('" + EventName + "','" + EventDate + "'," + GroupMethods.getIDOfGroup(GroupName) + ")";
            dal.Execute(com);
        }


        #endregion
    }
}