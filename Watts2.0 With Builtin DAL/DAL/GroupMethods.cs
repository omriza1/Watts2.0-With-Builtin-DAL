using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;

namespace Watts2._0_With_Builtin_DAL.DAL
{
    public class GroupMethods
    {
        #region Insert
        //creates a new group with an initial user as the admin
        public static void CreateGroup(string groupName, int userID)
        {
            string com = "insert into watts_groups (user_name,UserID,IsAdmin) values('" + groupName + "'," + userID + "," + true + ")";
            dal.Execute(com);
        }
        public static void addUser(string groupName, int userID)
        {
            string com = "insert into watts_groups (user_name,UserID,IsAdmin) values('" + groupName + "'," + userID + "," + false + ")";
            dal.Execute(com);
        }
        public static void sendMessage(int senderID, string content, int groupID)
        {
            string com = "INSERT INTO watts_group_messages (groupID,content,senderID,Mdate) VALUES (" + groupID + ",'" + content + "'," + senderID + ",'" + DateTime.Now.ToString() + "')";
            dal.Execute(com);
        }
        #endregion

        #region select
        /// <summary>
        /// gets all the messages sent in the group specified
        /// </summary>
        /// <param name="groupID"></param>
        /// <returns></returns>
        public static DataTable getMessages(int groupID)
        {
            string com = "select * from watts_group_messages where groupID =" + groupID + " ORDER BY Mdate ASC";
            return dal.GetTable(com);
        }
        /// <summary>
        /// checks if the group exists in the database
        /// </summary>
        /// <param name="groupName"></param>
        /// <returns></returns>
        public static bool groupExist(string groupName)
        {
            string com = "select groupID from watts_groups where user_name='" + groupName + "'";
            return dal.GetTable(com).Rows.Count > 0;
        }
        /// <summary>
        /// checks if a user is in a specified group
        /// </summary>
        /// <param name="groupName"></param>
        /// <param name="userID"></param>
        /// <returns></returns>
        public static bool userInGroup(string groupName, int userID)
        {
            string com = "select * from watts_group where userID =" + userID + " and user_name='" + groupName + "'";
            return dal.GetTable(com).Rows.Count > 0;
        }
        /// <summary>
        /// gets all the groups a user is at
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public static DataTable getAllGroups(int userID)
        {
            string com = "select * from watts_groups where userID=" + userID + "";
            return dal.GetTable(com);
        }
        /// <summary>
        /// gets the id of a group
        /// </summary>
        /// <param name="groupName"></param>
        /// <returns></returns>
        public static int getIDOfGroup(string groupName)
        {
            string com = "select groupID from watts_groups where user_name='" + groupName + "'";
            return int.Parse(dal.GetTable(com).Rows[0][0].ToString());
        }
        #endregion
    }
}