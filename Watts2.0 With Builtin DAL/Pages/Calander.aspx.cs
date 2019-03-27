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
    public partial class Calander1 : System.Web.UI.Page
    {
        protected string user;
        protected string reciver;
        protected MySqlConnection conn;
        protected MySqlCommand command;
        protected string username { get; set; }
        protected string password { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["username"];
            username = username.Remove(username.Length - 1);
            password = Request.QueryString["password"];
            password = password.Remove(password.Length - 1);
            user = username;
            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DATABASE"].ConnectionString);
        }

        protected void calendar_SelectionChanged(object sender, EventArgs e)
        {
            string day = calendar.SelectedDate.Day.ToString();
            //string date = DateTime.ParseExact(calendar.SelectedDate.ToShortDateString(), "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString();
            string date = calendar.SelectedDate.ToString("dd/MM/yyyy");
            Session["Date"] = date;
            Response.Redirect("Events.aspx?username="+username+"`&password="+password+"`&date="+date+"`");
        }
    }
}