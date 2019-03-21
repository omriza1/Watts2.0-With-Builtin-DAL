using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Globalization;

namespace Watts2._0_With_Builtin_DAL.Pages
{
    public partial class Events1 : System.Web.UI.Page
    {
        protected string user;
        protected string receiver;
        protected MySqlConnection conn;
        protected MySqlCommand command;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (string)Session["user"];
            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DATABASE"].ConnectionString);
            FillEvents();
        }
        protected void UpdateEvents(object sender, EventArgs e)
        {
            FillEvents();
        }
        protected void FillEvents()
        {
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("EventName", typeof(string));
            dt1.Columns.Add("EventDate", typeof(string));
            dt1.Columns.Add("EventTime", typeof(string));
            dt1 = DAL.EventMethods.GetPrivateEvents(user, Session["Date"].ToString());
            EventList.DataSource = dt1;
            DataBind();
        }
    }
}