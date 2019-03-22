﻿using System;
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
        protected string user;
        protected string reciver;
        protected MySqlConnection conn;
        protected MySqlCommand command;
        protected static bool Button1WasPressed = false;
        protected static bool Button2WasPressed = false;
        protected string username { get; set; }
        protected string password { get; set; }
        protected static string userSearch;
        protected static int displayCounter = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            username = Request.QueryString["username"];
            username = username.Remove(username.Length - 1);
            password = Request.QueryString["password"];
            password = password.Remove(password.Length - 1);
            user = username;
            conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DATABASE"].ConnectionString);
        }

        /*protected void ChooseSecondUser(object sender, EventArgs e)
        {
            friendsList.SelectedIndex = e.Item.ItemIndex;
            Session["reciver"] = ((Label)friendsList.SelectedItem.FindControl("friendID")).Text;
            Indicator.Text = "Chatting with user:" + Session["reciver"].ToString();
            if (Session["reciver"].ToString() != "" && Timer2.Enabled == false)
            {
                Timer2.Enabled = true;
            }
            Button1WasPressed = true;
            Button2WasPressed = false;
            userChatList.DataSource = null;
        }*/

        protected void SendMessageUser(object sender, EventArgs e)
        {
            if (Button1WasPressed && !Button2WasPressed)
            {
                DAL.buisness_logic.sendMessagePrivate(Session["user"].ToString(), userMessage.Text, Session["reciver"].ToString());
            }
            else if (Button2WasPressed && !Button1WasPressed)
            {
                DAL.buisness_logic.SendMessageGroup(DAL.GroupMethods.getIDOfGroup(Session["group"].ToString()), userMessage.Text, DAL.UserMethods.getIDOfUser(Session["user"].ToString()));
            }

        }

        protected void UpdateChatTable1(object sender, EventArgs e)
        {
            string chosenuser = "";
            sortTable();
        }
        protected void sortTable()
        {
            DataTable dt1 = new DataTable();
            DataTable dt3 = new DataTable();
            if (Button1WasPressed)
            {
                dt1 = DAL.MessageMethods.getPrivateMessages(DAL.UserMethods.getIDOfUser(user), DAL.UserMethods.getIDOfUser(Session["receiver"].ToString()));

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
            else if (Button2WasPressed)
            {
                dt1 = DAL.GroupMethods.getMessages(DAL.GroupMethods.getIDOfGroup(ChatGroupT.Text));

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
                    command = new MySqlCommand("select group_name from watts_groups where userID = " + DAL.UserMethods.getIDOfUser(user) , conn);
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
                    command = new MySqlCommand("select group_name from watts_groups where userID = " + DAL.UserMethods.getIDOfUser(user) + " and group_name like '" + userSearch + "%'", conn);
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

        protected void chooseGroup(object sender, EventArgs e)
        {
            Session["group"] = ChatGroupT.Text;
            Indicator.Text = "Chatting with Group:" + Session["group"].ToString();
            if (Session["group"].ToString() != "" && Timer2.Enabled == false)
            {
                Timer2.Enabled = true;
            }
            Button1WasPressed = false;
            Button2WasPressed = true;
            userChatList.DataSource = null;
        }

        protected void CreateEvent(object sender, EventArgs e)
        {
            string EveName = eveName.Text;
            //DateTime EveDate = DateTime.ParseExact(day.Text + "/" + month.Text + "/" + year.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            // DateTime EveDate = DateTime.ParseExact(day.Text + "/" + month.Text + "/" + year.Text + " " + hour.Text + ":" + minutes.Text, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
            if (Button1WasPressed || Button2WasPressed)
            {
                if (Button1WasPressed && !Button2WasPressed)
                {

                }
                else
                {

                }
            }
        }
        protected void calendar_SelectionChanged(object sender, EventArgs e)
        {
            Session["EventDate"] = calendar.SelectedDate.ToShortDateString();
        }

        protected void friendsList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            friendsList.SelectedIndex = e.Item.ItemIndex;
            Session["reciver"] = ((Label)friendsList.SelectedItem.FindControl("friendID")).Text;
            Indicator.Text = "Chatting with user:" + Session["reciver"].ToString();
            if (Session["reciver"].ToString() != "" && Timer2.Enabled == false)
            {
                Timer2.Enabled = true;
            }
            Button1WasPressed = true;
            Button2WasPressed = false;
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