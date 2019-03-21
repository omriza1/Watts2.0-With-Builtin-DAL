using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Watts2._0_With_Builtin_DAL.Pages
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected string user;
        protected string receiver;
        protected MySqlConnection conn;
        protected MySqlCommand command;
        protected string username { get; set; }
        protected string password { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["username"];
            password = Request.QueryString["password"];
            //user = Session["user"].ToString();
            username = username.Remove(username.Length - 1);
            user = username;
            password = password.Remove(password.Length - 1);
            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DATABASE"].ConnectionString);

            fillTableFriends();
            UserName.Text = user;
            GroupList();
        }

        protected void fillTableFriends()
        {
            command = new MySqlCommand("select user_name from watts_users join friends where userIDB = userID and userIDA =" + DAL.UserMethods.getIDOfUser(user), conn);
            conn.Open();
            MySqlDataAdapter adap = new MySqlDataAdapter(command);
            DataTable dt1 = new DataTable();
            adap.Fill(dt1);
            friendsList.DataSource = dt1;
            DataBind();
            conn.Close();

        }

        protected void updateTable(object sender, EventArgs e)
        {
            fillTableFriends();
        }

        protected void addfriend(object sender, EventArgs e)
        {
            if (DAL.buisness_logic.searchUser(searchT.Text))
            {
                if (!DAL.buisness_logic.checkIfFriends(user, searchT.Text))
                {
                    DAL.UserMethods.addFriend(DAL.UserMethods.getIDOfUser(user), DAL.UserMethods.getIDOfUser(searchT.Text));
                    Indicator.Text = "Friend added";
                }
                else
                {
                    Indicator.Text = "Both Users are already friends";
                }
            }
            else
            {
                Indicator.Text = "User does not exists";
            }
        }

        protected void GroupList()
        {
            DataTable dt1 = new DataTable();
            dt1 = DAL.GroupMethods.getAllGroups(DAL.UserMethods.getIDOfUser(user));
            groupChatList.DataSource = dt1;
            DataBind();
        }
        protected void updateGroupTable(object sender, EventArgs e)
        {
            GroupList();
        }
    }
}