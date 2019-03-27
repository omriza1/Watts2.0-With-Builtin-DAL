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
    public partial class Chat1 : System.Web.UI.Page
    {
        protected static string user;
        protected string reciver;
        protected MySqlConnection conn;
        protected MySqlCommand command;
        protected string username { get; set; }
        protected string password { get; set; }
        protected static string userSearch;
        protected static int displayCounter = 1;
        protected static string chosenUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["username"];
            username = username.Remove(username.Length - 1);
            password = Request.QueryString["password"];
            password = password.Remove(password.Length - 1);
            user = username;
            name.Text = user;
            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DATABASE"].ConnectionString);
        }
        
            protected void SendMessageUser(object sender, EventArgs e)
        {
            if (displayCounter == 1)
            {
                DAL.buisness_logic.sendMessagePrivate(user, userMessage.Text, chosenUser);
            }
            else if (displayCounter == 0)
            {
                DAL.buisness_logic.SendMessageGroup(DAL.GroupMethods.getIDOfGroup(chosenUser), userMessage.Text, DAL.UserMethods.getIDOfUser(user));
            }

        }

        protected void UpdateChatTable1(object sender, EventArgs e)
        {
            sortTable();
        }
        protected void sortTable()
        {
            DataTable dt1 = new DataTable();
            DataTable dt3 = new DataTable();
            if (displayCounter == 1)
            {
                dt1 = DAL.MessageMethods.getPrivateMessages(DAL.UserMethods.getIDOfUser(user), DAL.UserMethods.getIDOfUser(chosenUser));

                List<objects.Message> Marr = new List<objects.Message>();
                int sender;
                string content;
                int receiver;
                string Mdate;
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    sender = int.Parse(dt1.Rows[i]["senderID"].ToString());
                    content = dt1.Rows[i]["content"].ToString();
                    receiver = int.Parse(dt1.Rows[i]["receiverID"].ToString());
                    Mdate = dt1.Rows[i]["Mdate"].ToString();
                    Marr.Add(new objects.Message(sender, content, receiver, Mdate));
                }

                dt3.Columns.Add("sender", typeof(string));
                dt3.Columns.Add("content", typeof(string));
                dt3.Columns.Add("reciver", typeof(string));
                dt3.Columns.Add("Mdate", typeof(string));
                dt3.Columns.Add("containerStyle", typeof(string));
                for (int i = 0; i < Marr.Count; i++)
                {
                    dt3.Rows.Add(Marr[i].GetSender() + ":", Marr[i].GetContent(), Marr[i].GetReciver(), Marr[i].GetTime(), (Marr[i].GetSender() == user) ? "lighter" : "darker");
                }

            }
            else if (displayCounter == 0)
            {
                dt1 = DAL.GroupMethods.getMessages(DAL.GroupMethods.getIDOfGroup(chosenUser));

                List<objects.groupMessage> Marr = new List<objects.groupMessage>();
                int sender;
                string content;
                string Mdate;
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    sender = int.Parse(dt1.Rows[i]["senderID"].ToString());
                    content = dt1.Rows[i]["content"].ToString();
                    Mdate = dt1.Rows[i]["Mdate"].ToString();
                    Marr.Add(new objects.groupMessage(sender, content, Mdate));
                }

                dt3.Columns.Add("sender", typeof(string));
                dt3.Columns.Add("content", typeof(string));
                dt3.Columns.Add("Mdate", typeof(string));
                dt3.Columns.Add("containerStyle", typeof(string));
                for (int i = 0; i < Marr.Count; i++)
                {
                    dt3.Rows.Add(Marr[i].GetSender() + ":", Marr[i].GetContent(), Marr[i].GetTime(), (Marr[i].GetSender() == user) ? "lighter" : "darker");
                }
            }
            userChatList.DataSource = dt3;

            DataBind();
        }

        protected void fillTableFriends(string userSearch)
        {
            if (displayCounter == 1)
            {
                if (userSearch == null)
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
                else
                {
                    command = new MySqlCommand("select user_name from watts_users join friends where userIDB = userID and userIDA =" + DAL.UserMethods.getIDOfUser(user) + " and user_name like '" + userSearch + "%'", conn);
                    conn.Open();
                    MySqlDataAdapter adap = new MySqlDataAdapter(command);
                    DataTable dt1 = new DataTable();
                    adap.Fill(dt1);
                    friendsList.DataSource = dt1;
                    DataBind();
                    conn.Close();
                }
            }
            else if(displayCounter == 0)
            {
                if (userSearch == null)
                {
                    command = new MySqlCommand("select user_name from watts_groups where userID = " + DAL.UserMethods.getIDOfUser(user) , conn);
                    conn.Open();
                    MySqlDataAdapter adap = new MySqlDataAdapter(command);
                    DataTable dt1 = new DataTable();
                    adap.Fill(dt1);
                    friendsList.DataSource = dt1;
                    DataBind();
                    conn.Close();
                }
                else
                {
                    command = new MySqlCommand("select user_name from watts_groups where userID = " + DAL.UserMethods.getIDOfUser(user) + " and user_name like '" + userSearch + "%'", conn);
                    conn.Open();
                    MySqlDataAdapter adap = new MySqlDataAdapter(command);
                    DataTable dt1 = new DataTable();
                    adap.Fill(dt1);
                    friendsList.DataSource = dt1;
                    DataBind();
                    conn.Close();
                }
            }

        }

        protected void updateTable(object sender, EventArgs e)
        {
            fillTableFriends(userSearch);
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

        protected void createGroup(object sender, EventArgs e)
        {
            if (DAL.buisness_logic.CreateGroup(groupChatT.Text, user))
            {
                Label2.Text = "Group created";
            }
            else
            {
                Label2.Text = "Group name already taken";
            }
        }

        protected void CreateEvent(object sender, EventArgs e)
        {
            string EveName = eveName.Text;
            //DateTime EveDate = DateTime.ParseExact(day.Text + "/" + month.Text + "/" + year.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            // DateTime EveDate = DateTime.ParseExact(day.Text + "/" + month.Text + "/" + year.Text + " " + hour.Text + ":" + minutes.Text, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
            
                if (displayCounter==1)
                {

                }
                else
                {

                }
            
        }
        protected void calendar_SelectionChanged(object sender, EventArgs e)
        {
            Session["EventDate"] = calendar.SelectedDate.ToShortDateString();
        }

        protected void friendsList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            friendsList.SelectedIndex = e.Item.ItemIndex;
            chosenUser = ((Label)friendsList.SelectedItem.FindControl("friendID")).Text;
            Indicator.Text = "Chatting with user: " + chosenUser;
            if (chosenUser != "" && Timer2.Enabled == false && chosenUser != null && Timer2.Enabled == false)
            {
                Timer2.Enabled = true;
            }
            userChatList.DataSource = null;

        }

        protected void searchF_TextChanged(object sender, EventArgs e)
        {
            userSearch = searchF.Text;
        }

        protected void displaybutton_Click(object sender, EventArgs e)
        {
            if (displayCounter == 1)
            {
                displayCounter--;
            }
            else
            {
                displayCounter++;
            }
        }
    }
}