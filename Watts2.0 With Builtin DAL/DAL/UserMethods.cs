using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;

namespace Watts2._0_With_Builtin_DAL.DAL
{
    public class UserMethods
    {
        #region Insert
        /// <summary>
        /// adds a user to the database
        /// </summary>
        /// <param name="user_name"></param>
        /// <param name="password"></param>
        public static void adduser(string user_name, string password)
        {
            string com = "insert into watts_users (user_name,user_password) VALUES ('" + user_name + "','" + password + "')";
            dal.Execute(com);
        }

        /// <summary>
        /// creates a pair of friends
        /// </summary>
        /// <param name="userIDA"></param>
        /// <param name="userIDB"></param>
        public static void addFriend(int userIDA, int userIDB)
        {
            string com = "insert into friends (userIDA,userIDB) VALUES (" + userIDA + "," + userIDB + ")";
            dal.Execute(com);
        }

        #endregion

        #region Delete
        /// <summary>
        /// deletes a user from the database
        /// </summary>
        /// <param name="username"></param>
        public static void deleteuser(string username)
        {
            string com = "DELETE FROM watts_users WHERE user_name='" + username + "'";
            dal.Execute(com);
        }

        #endregion

        #region Update
        /// <summary>
        /// changes the password for a user
        /// </summary>
        /// <param name="user_name"></param>
        /// <param name="newPassword"></param>
        public static void ChangePassword(string user_name, string newPassword)
        {
            string com = "update watts_users set user_password='" + newPassword + "' where user_name = '" + user_name + "'";
            dal.Execute(com);
        }

        #endregion

        #region Select
        /// <summary>
        /// gets all the users
        /// </summary>
        /// <returns></returns>
        public static DataTable getalluser()
        {
            string com = "select * from watts_users";
            return dal.GetTable(com);
        }

        /// <summary>
        /// checks if the user exists for the login by counting how many times its username and password are in the database(can't be more then once for simplicity)
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public static bool userExist(string username, string password)
        {
            string com = "select userID from watts_users where user_name='" + username + "' and user_password='" + password + "'";
            return dal.GetTable(com).Rows.Count > 0;
        }

        /// <summary>
        /// checks if the user exists for sending a message for example by counting how many times its username and password are in the database
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public static bool userExist(string username)
        {
            string com = "select userID from watts_users where user_name = '" + username + "'";
            return dal.GetTable(com).Rows.Count > 0;
        }
        /// <summary>
        /// checks if two users are friends
        /// </summary>
        /// <param name="userIDA"></param>
        /// <param name="userIDB"></param>
        /// <returns></returns>
        public static bool checkFriends(int userIDA, int userIDB)
        {
            string com = "select * from friends where userIDA = " + userIDA + " and userIDB =" + userIDB + "";
            return dal.GetTable(com).Rows.Count > 0;
        }
        /// <summary>
        /// gets the id of a user
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static int getIDOfUser(string user)
        {
            string com = "select userID from watts_users where user_name='" + user + "'";
            return int.Parse(dal.GetTable(com).Rows[0][0].ToString());
        }

        public static string getUserName(int userID)
        {
            string com = "select user_name from watts_users where userID = " + userID + "";
            return dal.GetTable(com).Rows[0][0].ToString();
        }
        #endregion
    }
}